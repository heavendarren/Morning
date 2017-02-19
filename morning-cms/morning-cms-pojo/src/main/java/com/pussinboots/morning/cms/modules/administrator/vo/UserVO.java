package com.pussinboots.morning.cms.modules.administrator.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.pussinboots.morning.cms.modules.administrator.entity.Role;
import com.pussinboots.morning.cms.modules.administrator.entity.User;

public class UserVO extends User{

	private static final long serialVersionUID = 1L;
	
	/** 组织名称 */
	private String organizationName;
	
	/** 会员名称 */
	private String name;
	
	/** 注册时间开始 */
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date beginCreateTime;

	/** 注册时间结束 */
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date endCreateTime;
	
	/** 登录时间开始 */
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date beginLoginTime;

	/** 登录时间结束 */
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date endLoginTime;
	
	/** 用户角色 */
	private List<Role> roles;

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBeginCreateTime() {
		return beginCreateTime;
	}

	public void setBeginCreateTime(Date beginCreateTime) {
		this.beginCreateTime = beginCreateTime;
	}

	public Date getEndCreateTime() {
		return endCreateTime;
	}

	public void setEndCreateTime(Date endCreateTime) {
		this.endCreateTime = endCreateTime;
	}

	public Date getBeginLoginTime() {
		return beginLoginTime;
	}

	public void setBeginLoginTime(Date beginLoginTime) {
		this.beginLoginTime = beginLoginTime;
	}

	public Date getEndLoginTime() {
		return endLoginTime;
	}

	public void setEndLoginTime(Date endLoginTime) {
		this.endLoginTime = endLoginTime;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
}
