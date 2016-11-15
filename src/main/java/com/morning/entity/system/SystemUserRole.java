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
* 类名称：SystemUserRole   
* 类描述：SystemUserRole 表实体类 
* 创建人：陈星星   
* 创建时间：2016年11月13日 下午9:48:11   
* 修改人：陈星星   
* 修改时间：2016年11月13日 下午9:48:11   
* @version
 */
@TableName("tb_system_user_role")
public class SystemUserRole implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 用户角色编号 */
	@TableId(value = "USER_ROLE_ID", type = IdType.AUTO)
	private Integer userRoleId;

	/** 角色编号 */
	@TableField(value = "ROLE_ID")
	private Integer roleId;

	/** 用户编号 */
	@TableField(value = "ACCOUNT_ID")
	private Integer accountId;

	/** 创建时间 */
	@TableField(value = "CREATE_TIME")
	private Date createTime;

	/** 创建者 */
	@TableField(value = "CREATE_BY")
	private String createBy;
	
	/** 角色名称 */
	@TableField(value = "ROLE_NAME")
	private String roleName;

	public Integer getUserRoleId() {
		return this.userRoleId;
	}

	public void setUserRoleId(Integer userRoleId) {
		this.userRoleId = userRoleId;
	}

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getAccountId() {
		return this.accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
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

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
}
