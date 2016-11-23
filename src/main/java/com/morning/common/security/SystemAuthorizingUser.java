package com.morning.common.security;

import java.io.Serializable;


public class SystemAuthorizingUser implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/** 用户ID */
	private Integer accountId;

	/** 登录名 */
	private String loginName;

	/** 昵称 */
	private String userName;

	/** 真实姓名 */
	private String realName;
	
	public SystemAuthorizingUser(Integer accountId, String loginName,
			String userName, String realName) {
		super();
		this.accountId = accountId;
		this.loginName = loginName;
		this.userName = userName;
		this.realName = realName;
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
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
}
