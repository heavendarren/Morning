package com.pussinboots.morning.cms.common.security;

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
	
	/** 管理员ID */
	private Long userId;

	/** 登录名 */
	private String loginName;

	/** 昵称 */
	private String userName;

	/** 真实姓名 */
	private String realName;
	
	/** 加密密码的盐 */
	private String salt;
	
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
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
	
	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	/** 证书凭证  */
    public String getCredentialsSalt() {  
        return loginName + salt;  
    }
}
