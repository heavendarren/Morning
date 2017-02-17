package com.pussinboots.morning.cms.modules.administrator.entity;

import com.baomidou.mybatisplus.activerecord.Model;

import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

/**
 * 
* 项目名称：morning-cms-pojo   
* 类名称：UserRole   
* 类描述：UserRole  表实体类   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:39:51
 */
@TableName("cms_user_role")
public class UserRole extends Model<UserRole> {

    private static final long serialVersionUID = 1L;

    /**
     * 用户角色ID
     */
	@TableId("user_role_id")
	private Long userRoleId;
    /**
     * 角色ID
     */
	@TableField("role_id")
	private Long roleId;
    /**
     * 管理员ID
     */
	@TableField("user_id")
	private Long userId;
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


	public Long getUserRoleId() {
		return userRoleId;
	}

	public void setUserRoleId(Long userRoleId) {
		this.userRoleId = userRoleId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
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
		return this.userRoleId;
	}

}
