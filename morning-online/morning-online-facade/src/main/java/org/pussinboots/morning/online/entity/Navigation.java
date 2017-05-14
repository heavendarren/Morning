package org.pussinboots.morning.online.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-online-facade   
* 类名称：Navigation   
* 类描述：Navigation / 导航表 实体类   
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午8:52:08   
*
 */
@TableName("os_navigation")
public class Navigation extends Model<Navigation> {

    private static final long serialVersionUID = 1L;

    /**
     * 导航ID
     */
	@TableId(value="navigation_id", type= IdType.AUTO)
	private Long navigationId;
    /**
     * 代码简称
     */
	private String code;
    /**
     * 名称
     */
	private String name;
    /**
     * 状态 1=显示/0=隐藏
     */
	private Integer status;
    /**
     * 数量
     */
	private Integer number;
    /**
     * 显示数量
     */
	@TableField("show_number")
	private Integer showNumber;
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
    /**
     * 更新时间
     */
	@TableField("update_time")
	private Date updateTime;
    /**
     * 更新者
     */
	@TableField("update_by")
	private String updateBy;
    /**
     * 备注信息
     */
	private String remarks;


	public Long getNavigationId() {
		return navigationId;
	}

	public void setNavigationId(Long navigationId) {
		this.navigationId = navigationId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getShowNumber() {
		return showNumber;
	}

	public void setShowNumber(Integer showNumber) {
		this.showNumber = showNumber;
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

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Override
	protected Serializable pkVal() {
		return this.navigationId;
	}

}
