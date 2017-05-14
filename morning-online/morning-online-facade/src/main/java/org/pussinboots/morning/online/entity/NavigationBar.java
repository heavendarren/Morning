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
* 类名称：NavigationBar   
* 类描述：NavigationBar / 导航栏表 实体类   
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午8:52:59   
*
 */
@TableName("os_navigation_bar")
public class NavigationBar extends Model<NavigationBar> {

    private static final long serialVersionUID = 1L;

    /**
     * 导航栏ID
     */
	@TableId(value="navigation_bar_id", type= IdType.AUTO)
	private Long navigationBarId;
    /**
     * 导航ID
     */
	@TableField("navigation_id")
	private Long navigationId;
    /**
     * 名称
     */
	private String name;
    /**
     * 打开方式：_blank；_parent；_self；_top
     */
	private String target;
    /**
     * 排序
     */
	private Integer sort;
    /**
     * 链接地址
     */
	private String href;
    /**
     * 状态 1=显示/0=隐藏
     */
	private Integer status;
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


	public Long getNavigationBarId() {
		return navigationBarId;
	}

	public void setNavigationBarId(Long navigationBarId) {
		this.navigationBarId = navigationBarId;
	}

	public Long getNavigationId() {
		return navigationId;
	}

	public void setNavigationId(Long navigationId) {
		this.navigationId = navigationId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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
		return this.navigationBarId;
	}

}
