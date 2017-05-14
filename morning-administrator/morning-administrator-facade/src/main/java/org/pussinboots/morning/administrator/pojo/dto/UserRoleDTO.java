package org.pussinboots.morning.administrator.pojo.dto;

import java.io.Serializable;
import java.util.Set;

public class UserRoleDTO implements Serializable{
	
	private static final long serialVersionUID = 1L;

	/**
	 * 管理员角色标志列表
	 */
	private Set<String> roleSigns;
	
	/**
	 * 管理员角色ID列表
	 */
	private Set<String> roleIds;
	
	public UserRoleDTO() {
		super();
	}

	public UserRoleDTO(Set<String> roleSigns, Set<String> roleIds) {
		super();
		this.roleSigns = roleSigns;
		this.roleIds = roleIds;
	}

	public Set<String> getRoleSigns() {
		return roleSigns;
	}

	public void setRoleSigns(Set<String> roleSigns) {
		this.roleSigns = roleSigns;
	}

	public Set<String> getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(Set<String> roleIds) {
		this.roleIds = roleIds;
	}
}
