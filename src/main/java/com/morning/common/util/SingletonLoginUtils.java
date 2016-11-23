package com.morning.common.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.code.kaptcha.Constants;
import com.morning.common.security.SystemAuthorizingUser;
import com.morning.common.util.toolbox.StringUtil;
import com.morning.entity.ShoppingCart;
import com.morning.entity.user.User;

/**
 * 
 * @description：获取登录用户通用处理工具类
 * @author CXX
 * @version 创建时间：2016年8月19日  上午11:18:39
 */
public class SingletonLoginUtils {
	
	private static final Logger logger = LoggerFactory.getLogger(SingletonLoginUtils.class);
	
	private SingletonLoginUtils() {
	}

	/**
	 * 创建储存购物车信息的模型
	 */
	public static void creatShoppingCart(HttpServletRequest request){
		ShoppingCart shoppingCart;
		try{
			shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
			if(shoppingCart == null){
				shoppingCart = new ShoppingCart();//创建新的购物车模型
				request.getSession().setAttribute("shoppingCart", shoppingCart);
			}
		}catch(Exception e){
			logger.error("SingletonLoginUtils.creatShoppingCart", e);
		}
	}
	
	/**
	 * 获取购物车模型
	 * @param request
	 * @return User
	 */
	public static ShoppingCart getShoppingCart(HttpServletRequest request){
		ShoppingCart shoppingCart;
		try{
			shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
			if(shoppingCart != null){
				return shoppingCart;
			}
		}catch(Exception e){
			logger.error("SingletonLoginUtils.getShoppingCart", e);
		}
		return null;
	}
	
	
	/**
	 * 更新前台用户信息,Session
	 * @param request
	 * @param user
	 */
	public static void updateLoginUser(HttpServletRequest request,User user){
		try{
			//隐藏用户密码，将用户信息存放session中
			user.setLoginPassword("");
			user.setTelephone(user.getTelephone().replaceAll("(\\d{3})\\d{4}(\\d{4})","$1****$2"));
			user.setUserIdentity(user.getUserIdentity().replaceAll("(\\d{4})\\d{10}(\\w{4})","$1*****$2"));
			request.getSession().setAttribute("user", user);
		}catch(Exception e){
			logger.error("SingletonLoginUtils.updateLoginUser" , e);
		}
	}
	
	/**
	 * 获取前台登录用户
	 * @param request
	 * @return User
	 */
	public static User getLoginUser(HttpServletRequest request){
		User user = null;
		try{
			user=(User) request.getSession().getAttribute("user");
			if(user != null){
				return user;
			}
		}catch(Exception e){
			logger.error("SingletonLoginUtils.SingletonLoginUtils", e);
		}
		return null;
	}
	
	
	/**
	 * 获取前台登录用户ID
	 * @param request
	 * @return 返回用户ID
	 */
	public static int getLoginUserId(HttpServletRequest request){
		User user = getLoginUser(request);
		if(user!=null){
			return user.getAccountId();
		}
		return -1;
	}
	
	
	/**
	 * 验证验证码
	 * @param userInputCaptcha
	 * @return
	 */
	public static boolean validate() {
		// 获取Session中验证码
		Object captcha = ServletUtils.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		String registerCode = ServletUtils.getParameter("registerCode");
		if (StringUtil.isBlank(registerCode)) {
			return false;
		}
		return registerCode.equalsIgnoreCase(captcha.toString());
	}
	
	/**
	 * 获取后台登录用户
	 * @return SystemAuthorizingUser
	 */
	public static SystemAuthorizingUser getSystemUser() {
		try {
			Subject subject = SecurityUtils.getSubject();
			SystemAuthorizingUser systemUser = (SystemAuthorizingUser) subject.getPrincipal();
			if (systemUser != null) {
				return systemUser;
			}
		} catch (UnavailableSecurityManagerException e) {
			logger.error("SystemUserServiceImpl.getSystemUser", e);
		}
		return null;
	}
	
	/**
	 * 获取后台登录用户ID
	 * @return
	 */
	public static Integer getSystemUserId(){
		return getSystemUser().getAccountId();
	}
	
	/**
	 * 获取后台登录用户昵称
	 * @return
	 */
	public static String getSystemUserName(){
		return getSystemUser().getUserName();
	}
}
