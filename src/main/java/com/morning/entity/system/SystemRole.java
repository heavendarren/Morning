package com.morning.entity.system;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemRole   
* 类描述：SystemRole 表实体类   
* 创建人：陈星星   
* 创建时间：2016年11月13日 下午9:52:18   
* 修改人：陈星星   
* 修改时间：2016年11月13日 下午9:52:18   
* @version
 */
@TableName("tb_system_role")
public class SystemRole implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 角色编号 */
	@TableId(value = "ROLE_ID", type = IdType.AUTO)
	private Integer roleId;

	/** 角色名称 */
	@TableField(value = "ROLE_NAME")
	private String roleName;

	/** 所属部门 */
	@TableField(value = "ROLE_OFFICE")
	private String roleOffice;

	/** 系统数据：1.是，只有超级管理员能修改；0.否，拥有角色修改人员的权限能都修改 */
	@TableField(value = "IS_SYSTEM")
	private Integer isSystem;

	/** 状态：1.正常；0.冻结 */
	private Integer status;

	/** 创建时间 */
	@TableField(value = "CREATE_TIME")
	private Date createTime;

	/** 创建者 */
	@TableField(value = "CREATE_BY")
	private String createBy;

	/** 更新时间 */
	@TableField(value = "UPDATE_TIME")
	private Date updateTime;

	/** 更新者 */
	@TableField(value = "UPDATE_BY")
	private String updateBy;

	/** 备注信息 */
	private String remarks;

	/** 角色人数 */
	@TableField(exist = false)
	private Integer number;

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleOffice() {
		return this.roleOffice;
	}

	public void setRoleOffice(String roleOffice) {
		this.roleOffice = roleOffice;
	}

	public Integer getIsSystem() {
		return this.isSystem;
	}

	public void setIsSystem(Integer isSystem) {
		this.isSystem = isSystem;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateBy() {
		return this.createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getUpdateBy() {
		return this.updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}
}
