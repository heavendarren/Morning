package com.morning.entity.user;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @description：用户登录日志
 * @author CXX
 * @version 创建时间：2016年8月12日  下午11:37:03
 */
public class UserLoginLog implements Serializable {
	
	private static final long serialVersionUID = 3907610102817431130L;
	/**登录日志ID*/
	private Integer logId;
	/**登录时间*/
    private Date loginTime;
	/**登录IP*/
    private String userIp;
	/**用户ID*/
    private Integer userId;
	/**操作系统*/
    private String operatingSystem;
	/**浏览器*/
    private String browser;
	public Integer getLogId() {
		return logId;
	}
	public void setLogId(Integer logId) {
		this.logId = logId;
	}
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	public String getUserIp() {
		return userIp;
	}
	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getOperatingSystem() {
		return operatingSystem;
	}
	public void setOperatingSystem(String operatingSystem) {
		this.operatingSystem = operatingSystem;
	}
	public String getBrowser() {
		return browser;
	}
	public void setBrowser(String browser) {
		this.browser = browser;
	}
    
}