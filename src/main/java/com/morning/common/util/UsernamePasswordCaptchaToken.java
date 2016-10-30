package com.morning.common.util;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：UsernamePasswordCaptchaToken   
* 类描述：扩展添加验证码-继承用户验证类  
* 创建人：陈星星   
* 创建时间：2016年10月20日 上午1:28:20   
* 修改人：陈星星   
* 修改时间：2016年10月20日 上午1:28:20   
* 修改备注：   
* @version    
*
 */
public class UsernamePasswordCaptchaToken extends UsernamePasswordToken {

	private static final long serialVersionUID = 6774003285962749800L;
	
	private String captcha;
	private boolean mobileLogin;
	
	public UsernamePasswordCaptchaToken() {
		super();
	}

	public UsernamePasswordCaptchaToken(String username, char[] password,
			boolean rememberMe, String host, String captcha, boolean mobileLogin) {
		super(username, password, rememberMe, host);
		this.captcha = captcha;
		this.mobileLogin = mobileLogin;
	}

	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public boolean isMobileLogin() {
		return mobileLogin;
	}

}
