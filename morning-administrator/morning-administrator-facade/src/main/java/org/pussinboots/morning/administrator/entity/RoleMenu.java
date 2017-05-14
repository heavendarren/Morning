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
* 类名称：RoleMenu   
* 类描述：RoleMenu / 角色权限关联表 实体类   
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午5:36:45   
*
 */
@TableName("cms_role_menu")
public class RoleMenu extends Model<RoleMenu> {

    private static final long serialVersionUID = 1L;

    /**
     * 角色权限编号
     */
	@TableId(value="role_menu_id", type= IdType.AUTO)
	private Long roleMenuId;
    /**
     * 角色编号
     */
	@TableField("role_id")
	private Long roleId;
    /**
     * 权限编号
     */
	@TableField("menu_id")
	private Long menuId;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 创建者
     */
	@TableField("create_by")
	private String createBy;


	public Long getRoleMenuId() {
		return roleMenuId;
	}

	public void setRoleMenuId(Long roleMenuId) {
		this.roleMenuId = roleMenuId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	@Override
	protected Serializable pkVal() {
		return this.roleMenuId;
	}

}
