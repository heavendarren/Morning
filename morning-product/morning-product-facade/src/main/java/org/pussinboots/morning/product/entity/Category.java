package org.pussinboots.morning.product.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：Category   
* 类描述：Category / 分类表 实体类   
* 创建人：陈星星   
* 创建时间：2017年4月12日 下午4:19:23   
*
 */
@TableName("os_category")
public class Category extends Model<Category> {

    private static final long serialVersionUID = 1L;

    /**
     * 分类ID
     */
	@TableId(value="category_id", type= IdType.AUTO)
	private Long categoryId;
    /**
     * 父分类ID
     */
	@TableField("parent_id")
	private Long parentId;
    /**
     * 分类名称
     */
	private String name;
    /**
     * 排序
     */
	private Integer sort;
    /**
     * 目录类型 2=二级目录/1=一级目录/0=总目录
     */
	private Integer type;
    /**
     * 状态 1=显示/0=隐藏
     */
	private Integer status;
    /**
     * 是否导航栏 1=显示/0=隐藏
     */
	@TableField("show_in_nav")
	private Integer showInNav;
    /**
     * 是否置顶 1=置顶/0=默认
     */
	@TableField("show_in_top")
	private Integer showInTop;
    /**
     * 是否热门 1=热门/0=默认
     */
	@TableField("show_in_hot")
	private Integer showInHot;
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
     * 页面标题
     */
	@TableField("page_title")
	private String pageTitle;
    /**
     * 页面描述
     */
	@TableField("page_description")
	private String pageDescription;
    /**
     * 页面关键词
     */
	@TableField("page_keyword")
	private String pageKeyword;
    /**
     * 备注信息
     */
	private String remarks;


	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getShowInNav() {
		return showInNav;
	}

	public void setShowInNav(Integer showInNav) {
		this.showInNav = showInNav;
	}

	public Integer getShowInTop() {
		return showInTop;
	}

	public void setShowInTop(Integer showInTop) {
		this.showInTop = showInTop;
	}

	public Integer getShowInHot() {
		return showInHot;
	}

	public void setShowInHot(Integer showInHot) {
		this.showInHot = showInHot;
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

	public String getPageTitle() {
		return pageTitle;
	}

	public void setPageTitle(String pageTitle) {
		this.pageTitle = pageTitle;
	}

	public String getPageDescription() {
		return pageDescription;
	}

	public void setPageDescription(String pageDescription) {
		this.pageDescription = pageDescription;
	}

	public String getPageKeyword() {
		return pageKeyword;
	}

	public void setPageKeyword(String pageKeyword) {
		this.pageKeyword = pageKeyword;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Override
	protected Serializable pkVal() {
		return this.categoryId;
	}

}
