package com.morning.service.impl.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.morning.common.util.MD5Utils;
import com.morning.dao.system.SystemUserMapper;
import com.morning.entity.system.SystemUser;
import com.morning.entity.system.SystemUserRole;
import com.morning.entity.user.QueryUser;
import com.morning.service.system.SystemUserService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemUserServiceImpl   
* 类描述：后台管理员业务逻辑层实现   
* 创建人：陈星星   
* 创建时间：2016年9月14日  下午3:07:53
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午11:01:39   
* @version
 */
@Service("systemUserService")
@Transactional
public class SystemUserServiceImpl implements SystemUserService {
	
	private static final Logger logger = LoggerFactory.getLogger(SystemUserServiceImpl.class);
	
	@Autowired
	private SystemUserMapper systemUserMapper;

	@Override
	public SystemUser queryLoginUser(SystemUser systemUser) {
		return systemUserMapper.queryLoginUser(systemUser);
	}
	
	@Override
	public boolean checkLoginName(String loginName) {
		int count = systemUserMapper.checkLoginName(loginName);
		if(count>0){
			return true;
		}
		return false;
	}

	@Override
	public void updateUserLoginLog(Integer accountId, Date lastLoginTime,
			String lastLoginIp) {
		Map<String,Object> parameter = new HashMap<String, Object>();
		parameter.put("accountId", accountId);
		parameter.put("lastLoginTime", lastLoginTime);
		parameter.put("lastLoginIp", lastLoginIp);
		systemUserMapper.updateUserLoginLog(parameter);
	}
	
	@Override
	@CacheEvict(value="userCache",key="'sysUserInfo'+#systemUser.loginName")
	public void updateUserPws(SystemUser systemUser) {
		systemUserMapper.updateUserPws(systemUser);
	}
	
	@Override
	@CacheEvict(value="userCache",key="'sysUserInfo'+#systemUser.accountId")
	public void updateUserInfo(SystemUser systemUser) {
		systemUserMapper.updateUserInfo(systemUser);
	}
	
	@Override
	@Cacheable(value="userCache",key="'sysUserInfo'+#accountId")
	public SystemUser querySysUserByUserId(Integer accountId) {
		return systemUserMapper.querySysUserByUserId(accountId);
	}
	
	@Override
	public List<SystemUser> querySysUsersByRole(Integer roleId) {
		return systemUserMapper.querySysUsersByRole(roleId);
	}

	@Override
	@Cacheable(value="userCache",key="'sysUserInfo'+#loginName")
	public SystemUser querySysUserByUserName(String loginName) {
		return systemUserMapper.querySysUserByUserName(loginName);
	}
	
	@Override
	public int querySysUserNumber() {
		return systemUserMapper.querySysUserNumber();
	}
	
	@Override
	public List<SystemUser> querySysUserList(QueryUser queryUser) {
		return systemUserMapper.querySysUserList(queryUser);
	}
	
	@Override
	public void updateSysUserStates(SystemUser systemUser) {
		systemUserMapper.updateSysUserStates(systemUser);
	}

	@Override
	public void deleteSysUserRole(Integer accountId) {
		systemUserMapper.deleteSysUserRole(accountId);	
	}
	
	@Override
	public void deleteSysUser(Integer accountId) {
		deleteSysUserRole(accountId);
		systemUserMapper.deleteSysUser(accountId);
	}
	
	@Override
	public int createsystemUser(SystemUser systemUser) {
		SystemUser sysUser = getSystemUser();
		systemUser.setLoginPassword(MD5Utils.getMD5(systemUser.getLoginPassword()));
		systemUser.setCreateBy(sysUser.getUserName());
		systemUser.setCreateTime(new Date());
		return systemUserMapper.createsystemUser(systemUser);
	}
	
	@Override
	public void createUserRole(String[] roleIds ,Integer accountId) {
		List<SystemUserRole> systemUserRoles = new ArrayList<SystemUserRole>();
		for(int i = 0; i<roleIds.length; i++){
			SystemUserRole systemUserRole = new SystemUserRole();
			systemUserRole.setAccountId(accountId);
			systemUserRole.setCreateTime(new Date());
			systemUserRole.setRoleId(Integer.valueOf(roleIds[i]).intValue());
			systemUserRole.setCreateBy(getSystemUser().getUserName());
			systemUserRoles.add(systemUserRole);
		}
		systemUserMapper.createUserRole(systemUserRoles);
	}
	
	@Override
	public void updateSystemUserRole(SystemUser systemUser, String[] roleIds) {
		SystemUser sysUser = this.getSystemUser();
		systemUser.setUpdateBy(sysUser.getUserName());
		systemUser.setUpdateTime(new Date());
		this.updateUserInfo(systemUser);
		this.deleteSysUserRole(systemUser.getAccountId());
		this.createUserRole(roleIds, systemUser.getAccountId());
	}
	
	@Override
	public void createSystemUserRole(SystemUser systemUser, String[] roleIds) {
		this.createsystemUser(systemUser);
		this.createUserRole(roleIds, systemUser.getAccountId());
	}

	@Override
	public SystemUser getSystemUser(){
		try{
			Subject subject = SecurityUtils.getSubject();
			SystemUser systemUser = (SystemUser)subject.getPrincipal();
			if (systemUser != null){
				return systemUser;
			}
		}catch (UnavailableSecurityManagerException e) {
			logger.error("SystemUserServiceImpl.getSystemUser", e);
		}catch (InvalidSessionException e){
			logger.error("SystemUserServiceImpl.getSystemUser", e);
		}
		return null;
	}

}
