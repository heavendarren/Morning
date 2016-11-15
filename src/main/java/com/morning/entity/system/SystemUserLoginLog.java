package com.morning.entity.system;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;


/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemUserLoginLog   
* 类描述：SystemUserLoginLog 表实体类
* 创建人：陈星星   
* 创建时间：2016年11月12日 下午11:39:18   
* 修改人：陈星星   
* 修改时间：2016年11月12日 下午11:39:18   
* @version
 */
@TableName("tb_system_user_login_log")
public class SystemUserLoginLog implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 登录日志ID */
	@TableId(value = "LOG_ID", type = IdType.AUTO)
	private Integer logId;

	/** 登录时间 */
	@TableField(value = "LOGIN_TIME")
	private Date loginTime;

	/** 登录IP */
	@TableField(value = "USER_IP")
	private String userIp;

	/** 用户ID */
	@TableField(value = "USER_ID")
	private Integer userId;

	/** 操作系统 */
	@TableField(value = "OPERATING_SYSTEM")
	private String operatingSystem;

	/** 浏览器 */
	private String browser;


	public Integer getLogId() {
		return this.logId;
	}

	public void setLogId(Integer logId) {
		this.logId = logId;
	}

	public Date getLoginTime() {
		return this.loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public String getUserIp() {
		return this.userIp;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getOperatingSystem() {
		return this.operatingSystem;
	}

	public void setOperatingSystem(String operatingSystem) {
		this.operatingSystem = operatingSystem;
	}

	public String getBrowser() {
		return this.browser;
	}

	public void setBrowser(String browser) {
		this.browser = browser;
	}

}
