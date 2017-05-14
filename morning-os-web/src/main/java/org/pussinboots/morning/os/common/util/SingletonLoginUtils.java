package org.pussinboots.morning.os.common.util;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.subject.Subject;
import org.pussinboots.morning.os.common.security.AuthorizingUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.code.kaptcha.Constants;

/**
 * 
* 项目名称：morning-os-webapp   
* 类名称：SingletonLoginUtils   
* 类描述：SingletonLoginUtils工具类： 登录用户通用处理工具类   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午1:04:53
 */
public class SingletonLoginUtils {
	
	private static final Logger logger = LoggerFactory.getLogger(SingletonLoginUtils.class);
	
	private SingletonLoginUtils() {
		throw new AssertionError();
	}

	/**
	 * 验证验证码
	 * @param userInputCaptcha
	 * @return 正确:true/错误:false
	 */
	public static boolean validate(String registerCode) {
		// 获取Session中验证码
		Object captcha = ServletUtils.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if (StringUtils.isEmpty(registerCode)) {
			return false;
		}
		boolean result = registerCode.equalsIgnoreCase(captcha.toString());
		if (result) {
			ServletUtils.getRequest().getSession().removeAttribute(Constants.KAPTCHA_SESSION_KEY);
		}
		return result;
	}
	
	/**
	 * 获取登录用户
	 * @return
	 */
	public static AuthorizingUser getUser() {
		try {
			Subject subject = SecurityUtils.getSubject();
			AuthorizingUser user = (AuthorizingUser) subject.getPrincipal();
			if (user != null) {
				return user;
			}
		} catch (UnavailableSecurityManagerException e) {
			logger.error("SingletonLoginUtils.getUser:{}", e);
		}
		return null;
	}
	
	/**
	 * 获取登录用户ID
	 * @return
	 */
	public static Long getUserId() {
		try {
			Subject subject = SecurityUtils.getSubject();
			AuthorizingUser user = (AuthorizingUser) subject.getPrincipal();
			if (user != null) {
				return user.getUserId();
			}
		} catch (UnavailableSecurityManagerException e) {
			logger.error("SingletonLoginUtils.getUser:{}", e);
		}
		return null;
	}
}
