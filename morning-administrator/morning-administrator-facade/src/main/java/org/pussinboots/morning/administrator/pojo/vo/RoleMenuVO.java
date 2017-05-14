package org.pussinboots.morning.administrator.pojo.vo;

import java.util.List;

import org.pussinboots.morning.administrator.pojo.dto.RoleMenuDTO;

public class RoleMenuVO extends RoleMenuDTO {

	private static final long serialVersionUID = 1L;
	
	/** 子级权限List */
	private List<RoleMenuDTO> childMenus;
	
	/** 是否选中 */
	private boolean checked;

	public List<RoleMenuDTO> getChildMenus() {
		return childMenus;
	}

	public void setChildMenus(List<RoleMenuDTO> childMenus) {
		this.childMenus = childMenus;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
}
