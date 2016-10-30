package com.morning.common.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.morning.entity.ShoppingCart;
import com.morning.entity.system.SystemUser;
import com.morning.entity.user.User;

/**
 * 
 * @description：获取登录用户通用处理工具类
 * @author CXX
 * @version 创建时间：2016年8月19日  上午11:18:39
 */
public class SingletonLoginUtils {
	
	private static final Logger logger = Logger.getLogger(SingletonLoginUtils.class);
	
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
	 * 更新后台管理员信息,Session
	 * @param request
	 * @param systemUser
	 */
	public static void updateAdminUser(HttpServletRequest request,SystemUser systemUser){
		try{
			//隐藏用户密码，将用户信息存放session中
			systemUser.setLoginPassword("");
			request.getSession().setAttribute("systemUser", systemUser);
		}catch(Exception e){
			logger.error("SingletonLoginUtils.updateAdminUser" , e);
		}
	}
	
	/**
	 * 获取后台登录用户
	 * @param request
	 * @return
	 */
	public static SystemUser getSystemUser(HttpServletRequest request){
		SystemUser systemUser = null;
		try{
			systemUser = (SystemUser) request.getSession().getAttribute("systemUser");
			if(systemUser != null){
				return systemUser;
			}
		}catch(Exception e){
			logger.error("SingletonLoginUtils.getSystemUser", e);
		}
		return null;
	}
	
	/**
	 * 获取后台登录用户ID
	 * @param requset
	 * @return
	 */
	public static int getSystemUserId(HttpServletRequest requset){
		SystemUser systemUser = getSystemUser(requset);
		if(systemUser != null){
			return systemUser.getAccountId();
		}
		return -1;
	}
}
