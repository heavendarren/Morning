package org.pussinboots.morning.user.pojo.vo;

import java.io.Serializable;

public class UserVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
    /**
     * 用户ID
     */
	private Long userId;
	
    /**
     * 用户编号
     */
	private Long userNumber;
	
    /**
     * 昵称
     */
	private String userName;
	
    /**
     * 真实姓名
     */
	private String realName;
	
    /**
     * 性别 0=保密/1=男/2=女
     */
	private Integer sex;
	
    /**
     * 年龄
     */
	private Integer age;
	
    /**
     * 用户头像
     */
	private String picImg;
	
    /**
     * 电子邮箱
     */
	private String email;
	
    /**
     * 手机号码
     */
	private String telephone;

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

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
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
}
