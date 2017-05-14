package org.pussinboots.morning.online.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-online-facade   
* 类名称：Email   
* 类描述：Email / 邮箱记录表 实体类  
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午3:47:12   
*
 */
@TableName("os_email")
public class Email extends Model<Email> {

    private static final long serialVersionUID = 1L;

    /**
     * 邮箱ID
     */
	@TableId(value="email_id", type= IdType.AUTO)
	private Long emailId;
    /**
     * 邮箱标识号
     */
	@TableField("email_sign")
	private Long emailSign;
    /**
     * 用户邮箱
     */
	@TableField("user_email")
	private String userEmail;
    /**
     * 邮箱类型：0.找回密码; 1.注册; 2.改变邮箱; 3.通知
     */
	@TableField("email_type")
	private Integer emailType;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 有效开始时间
     */
	@TableField("start_time")
	private Date startTime;
    /**
     * 有效结束时间
     */
	@TableField("end_time")
	private Date endTime;
    /**
     * 新电子邮箱
     */
	@TableField("new_email")
	private String newEmail;
    /**
     * 链接是否已失效：0.失效；1.未失效；
     */
	private Integer status;
    /**
     * 发送状态：0.发送失败；1.发送成功；
     */
	@TableField("send_status")
	private Integer sendStatus;
    /**
     * 验证码
     */
	private String captcha;
    /**
     * 邮箱主题
     */
	@TableField("email_subject")
	private String emailSubject;
    /**
     * 邮箱正文
     */
	@TableField("email_content")
	private String emailContent;
	
	public Email() {
		super();
	}

	public Email(Long emailSign, String userEmail, Integer emailType, Date createTime, Date startTime, Date endTime,
			Integer sendStatus, String captcha, String emailSubject, String emailContent) {
		super();
		this.emailSign = emailSign;
		this.userEmail = userEmail;
		this.emailType = emailType;
		this.createTime = createTime;
		this.startTime = startTime;
		this.endTime = endTime;
		this.sendStatus = sendStatus;
		this.captcha = captcha;
		this.emailSubject = emailSubject;
		this.emailContent = emailContent;
	}

	public Long getEmailId() {
		return emailId;
	}

	public void setEmailId(Long emailId) {
		this.emailId = emailId;
	}

	public Long getEmailSign() {
		return emailSign;
	}

	public void setEmailSign(Long emailSign) {
		this.emailSign = emailSign;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Integer getEmailType() {
		return emailType;
	}

	public void setEmailType(Integer emailType) {
		this.emailType = emailType;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getNewEmail() {
		return newEmail;
	}

	public void setNewEmail(String newEmail) {
		this.newEmail = newEmail;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getSendStatus() {
		return sendStatus;
	}

	public void setSendStatus(Integer sendStatus) {
		this.sendStatus = sendStatus;
	}

	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public String getEmailSubject() {
		return emailSubject;
	}

	public void setEmailSubject(String emailSubject) {
		this.emailSubject = emailSubject;
	}

	public String getEmailContent() {
		return emailContent;
	}

	public void setEmailContent(String emailContent) {
		this.emailContent = emailContent;
	}

	@Override
	protected Serializable pkVal() {
		return this.emailId;
	}

}
