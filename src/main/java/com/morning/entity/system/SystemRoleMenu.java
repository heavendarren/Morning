package com.morning.entity.system;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemRoleMenu   
* 类描述：SystemRoleMenu 表实体类   
* 创建人：陈星星   
* 创建时间：2016年11月13日 下午10:41:36   
* 修改人：陈星星   
* 修改时间：2016年11月13日 下午10:41:36   
* @version
 */
@TableName("tb_system_role_menu")
public class SystemRoleMenu implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 角色权限编号 */
	@TableId(value = "ROLE_MENU_ID", type = IdType.AUTO)
	private Integer roleMenuId;

	/** 角色编号 */
	@TableField(value = "ROLE_ID")
	private Integer roleId;

	/** 权限编号 */
	@TableField(value = "MENU_ID")
	private Integer menuId;
	
	/** 权限标识 */
	@TableField(exist = false)
	private String permission;

	public Integer getRoleMenuId() {
		return this.roleMenuId;
	}

	public void setRoleMenuId(Integer roleMenuId) {
		this.roleMenuId = roleMenuId;
	}

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getMenuId() {
		return this.menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}
	
}
