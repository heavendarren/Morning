package com.pussinboots.morning.os.common.security;

import java.io.Serializable;

/**
 * 
* 项目名称：morning-cms-webapp   
* 类名称：SystemAuthorizingUser   
* 类描述：SystemAuthorizingUser 管理员登录信息实体类   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午4:11:01
 */
public class AuthorizingUser implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/** 用户ID*/
	private Long userId;
	
	/** 用户编号 */
	private Long userNumber;

	/** 昵称 */
	private String userName;

	/** 真实姓名 */
	private String realName;
	
    /** 电子邮箱*/
	private String email;
	
    /** 手机号码*/
	private String telephone;
	
	/** 加密密码的盐 */
	private String salt;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(Long userNumber) {
		this.userNumber = userNumber;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	/** 证书凭证  */
    public String getCredentialsSalt() {  
        return userNumber + salt;  
    }
}
