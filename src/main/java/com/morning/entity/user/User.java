package com.morning.entity.user;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @description：用户实体类
 * @author CXX
 * @version 创建时间：2016年8月12日  下午4:14:08
 */
public class User implements Serializable {

	private static final long serialVersionUID = -681369877242642871L;
	/**用户ID*/
	private Integer accountId;
	/**用户名*/
    private String loginName;
	/**用户密码*/
    private String loginPassword;
	/**注册时间*/
    private Date createDate;
	/**姓名*/
    private String userName;
	/**身份证*/
    private String userIdentity;
	/**用户头像*/
    private String picImg;
    /**电子邮箱*/
    private String email;
    /**手机号码*/
    private String telephone;
    /**性别*/
    private Byte sex;
    /**年龄*/
    private Byte age;
    /**账户余额*/
    private Integer payment;
    /**站内信未读消息数*/
    private Integer msgNum;
    /**用户商城积分 */
    private Integer userPoint;
    /**状态 0正常 1冻结 2删除*/
    private Integer status;
    /**最后登录时间*/
    private Date lastLoginTime;
    /**最后登录IP*/
    private String lastLoginIp;
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
	public String getLoginPassword() {
		return loginPassword;
	}
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserIdentity() {
		return userIdentity;
	}
	public void setUserIdentity(String userIdentity) {
		this.userIdentity = userIdentity;
	}
	public String getPicImg() {
		return picImg;
	}
	public void setPicImg(String picImg) {
		this.picImg = picImg;
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
	public Byte getSex() {
		return sex;
	}
	public void setSex(Byte sex) {
		this.sex = sex;
	}
	public Byte getAge() {
		return age;
	}
	public void setAge(Byte age) {
		this.age = age;
	}
	public Integer getPayment() {
		return payment;
	}
	public void setPayment(Integer payment) {
		this.payment = payment;
	}
	public Integer getMsgNum() {
		return msgNum;
	}
	public void setMsgNum(Integer msgNum) {
		this.msgNum = msgNum;
	}
	public Integer getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(Integer userPoint) {
		this.userPoint = userPoint;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public String getLastLoginIp() {
		return lastLoginIp;
	}
	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}
}