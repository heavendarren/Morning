package org.pussinboots.morning.os.common.security;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.user.entity.User;
import org.pussinboots.morning.user.service.IUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * 
* 项目名称：morning-cms-webapp   
* 类名称：ShiroAuthorizingRealm   
* 类描述：shiro 认证回调及授权查询回调函数实现类   
* 创建人：陈星星   
* 创建时间：2017年2月20日 上午2:01:25    
*
 */
public class ShiroAuthorizingRealm extends AuthorizingRealm {
	
	@Autowired
	private IUserService userService;
	
	/**
	 * 认证回调函数, 登录时调用
	 * Shiro登录认证(原理：用户提交 用户名和密码  --- shiro 封装令牌 ---- realm 通过用户名将密码查询返回 ---- shiro 自动去比较查询出密码和用户输入密码是否一致---- 进行登陆控制
	 * 该方法的调用时机为LoginController.login()方法中执行Subject.login()时 
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
			throws AuthenticationException {
		// 获取基于用户名和密码的令牌：实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的
		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
		
		User user = userService.getByLoginName(token.getUsername());
		
		if (user == null || user.getEmailIsActive().equals(StatusEnum.NONACTIVATED.getStatus())) {
			throw new UnknownAccountException();// 没找到帐号或者邮箱未被激活
		}
		
		if (StatusEnum.FREEZE.getStatus().equals(user.getStatus())) {
			throw new DisabledAccountException();// 校验用户状态
		}
		
		AuthorizingUser authorizingUser = new AuthorizingUser();
		BeanUtils.copyProperties(user, authorizingUser);
		
		// 认证缓存信息
		return new SimpleAuthenticationInfo(authorizingUser,
				user.getLoginPassword(), 
				ByteSource.Util.bytes(authorizingUser.getCredentialsSalt()),
				getName());
	}
	
	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
	 * 经测试:本例中该方法的调用时机为需授权资源被访问时 
	 * 经测试:并且每次访问需授权资源时都会执行该方法中的逻辑,这表明本例中默认并未启用AuthorizationCache 
	 * 比如说这里从数据库获取权限信息时,先去访问Spring3.1提供的缓存,而不使用Shior提供的AuthorizationCache 
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		return null;
	}
	
}
