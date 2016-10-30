package com.morning.common.security;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.morning.common.constants.GlobalConstants;
import com.morning.common.util.ServletUtils;
import com.morning.entity.system.SystemMenu;
import com.morning.entity.system.SystemRole;
import com.morning.entity.system.SystemUser;
import com.morning.service.system.SystemMenuService;
import com.morning.service.system.SystemRoleService;
import com.morning.service.system.SystemUserLoginLogService;
import com.morning.service.system.SystemUserService;

public class SystemAuthorizingRealm extends AuthorizingRealm {
	
	@Autowired
	private SystemUserService systemUserService;
	@Autowired
	private SystemRoleService systemRoleService;
	@Autowired
	private SystemMenuService systemMenuService;
	@Autowired
	private SystemUserLoginLogService systemUserLoginLogService;
	
	/**
	 * 认证回调函数, 登录时调用
	 * Shiro登录认证(原理：用户提交 用户名和密码  --- shiro 封装令牌 ---- realm 通过用户名将密码查询返回 ---- shiro 自动去比较查询出密码和用户输入密码是否一致---- 进行登陆控制
	 * 该方法的调用时机为LoginController.login()方法中执行Subject.login()时 
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authenticationToken) throws AuthenticationException {
		//获取基于用户名和密码的令牌：实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的  
		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
		
		SystemUser systemUser = systemUserService.querySysUserByUserName(token.getUsername());
		if (systemUser != null) {
			// 校验用户状态
			if (GlobalConstants.NO.equals(systemUser.getStatus().toString())){
				throw new DisabledAccountException();
			}
			// 认证缓存信息
			SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(systemUser, systemUser.getLoginPassword(), getName());
			return simpleAuthenticationInfo;
		} else {
			return null;
		}
	}
	
	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
	 * 经测试:本例中该方法的调用时机为需授权资源被访问时 
	 * 经测试:并且每次访问需授权资源时都会执行该方法中的逻辑,这表明本例中默认并未启用AuthorizationCache 
	 * 比如说这里从数据库获取权限信息时,先去访问Spring3.1提供的缓存,而不使用Shior提供的AuthorizationCache 
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

		SystemUser systemUser = (SystemUser) principalCollection.getPrimaryPrincipal();
		
		if(systemUser != null){
			//权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）  
			SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
			
			//获得用户角色列表
			List<SystemRole> systemRoles = systemRoleService.queryRoleByUserId(systemUser.getAccountId());
			List<Integer> roleList = new ArrayList<Integer>();
			for (SystemRole systemRole : systemRoles) {  // 添加用户角色信息
				simpleAuthorizationInfo.addRole(systemRole.getRoleName());
				roleList.add(systemRole.getRoleId());
			}
			
			//获得权限列表
			List<SystemMenu> systemMenus = new ArrayList<SystemMenu>();
			for(Integer roleId : roleList){
				List<SystemMenu> systemMenuList = systemMenuService.querySysMenuByRoleId(roleId);
				systemMenus.addAll(systemMenuList);
			}
			for(SystemMenu systemMenu : systemMenus){
				if(StringUtils.isNotBlank(systemMenu.getPermission())){
					// 添加基于Permission的权限信息
					simpleAuthorizationInfo.addStringPermission(systemMenu.getPermission());
				}
			}
			
    		//修改用户登录记录
    		systemUserService.updateUserLoginLog(systemUser.getAccountId(), new Date(), ServletUtils.getIpAddr(ServletUtils.getRequest()));
    		
    		// 记录登录日志
    		systemUserLoginLogService.saveLoginLog(systemUser);
	        return simpleAuthorizationInfo;  
		}
		return null;
	}
	

}
