package org.pussinboots.morning.administrator.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-administrator-facade   
* 类名称：UserLoginLog   
* 类描述：UserLoginLog / 管理员登陆表 实体类       
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午5:36:16   
*
 */
@TableName("cms_user_login_log")
public class UserLoginLog extends Model<UserLoginLog> {

    private static final long serialVersionUID = 1L;

    /**
     * 登录日志ID
     */
	@TableId(value="log_id", type= IdType.AUTO)
	private Long logId;
    /**
     * 登录时间
     */
	@TableField("login_time")
	private Date loginTime;
    /**
     * 登录IP
     */
	@TableField("user_ip")
	private String userIp;
    /**
     * 管理员ID
     */
	@TableField("user_id")
	private Long userId;
    /**
     * 操作系统
     */
	@TableField("operating_system")
	private String operatingSystem;
    /**
     * 浏览器
     */
	private String browser;
	

	public UserLoginLog() {
		super();
	}

	public UserLoginLog(Date loginTime, String userIp, Long userId, String operatingSystem,
			String browser) {
		super();
		this.loginTime = loginTime;
		this.userIp = userIp;
		this.userId = userId;
		this.operatingSystem = operatingSystem;
		this.browser = browser;
	}

	public Long getLogId() {
		return logId;
	}

	public void setLogId(Long logId) {
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

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
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

	@Override
	protected Serializable pkVal() {
		return this.logId;
	}

}
