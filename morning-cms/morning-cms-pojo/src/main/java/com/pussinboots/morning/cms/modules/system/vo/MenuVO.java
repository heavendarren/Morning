package com.pussinboots.morning.cms.modules.system.vo;

import java.util.List;

import com.pussinboots.morning.cms.modules.system.entity.Menu;

public class MenuVO extends Menu {

	private static final long serialVersionUID = 1L;
	
	/** 子级权限List */
	private List<Menu> childMenus;
	
	/** 是否选中 */
	private boolean checked;

	public List<Menu> getChildMenus() {
		return childMenus;
	}

	public void setChildMenus(List<Menu> childMenus) {
		this.childMenus = childMenus;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
}
