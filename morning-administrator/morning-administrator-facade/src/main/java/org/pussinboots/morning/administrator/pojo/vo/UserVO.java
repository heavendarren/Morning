package org.pussinboots.morning.administrator.pojo.vo;

import java.util.List;

import org.pussinboots.morning.administrator.entity.Role;
import org.pussinboots.morning.administrator.entity.User;

public class UserVO extends User{

	private static final long serialVersionUID = 1L;
	
	/** 组织名称 */
	private String organizationName;
	
	/** 用户角色 */
	private List<Role> roles;

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
}
