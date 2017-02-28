package com.pussinboots.morning.os.modules.content.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：AdvertDetail   
* 类描述：AdvertDetail 表 / 广告位管理表
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午11:14:14   
*
 */
@TableName("os_advert_detail")
public class AdvertDetail extends Model<AdvertDetail> {

    private static final long serialVersionUID = 1L;

    /**
     * 广告详情ID
     */
	@TableId("advert_detail_id")
	private Long advertDetailId;
    /**
     * 标题
     */
	private String title;
    /**
     * 广告位ID
     */
	@TableField("advert_id")
	private Long advertId;
    /**
     * 分类ID
     */
	@TableField("category_id")
	private Long categoryId;
    /**
     * 排序
     */
	private Integer sort;
    /**
     * 链接地址
     */
	private String href;
    /**
     * 状态：1.启用；0.禁用
     */
	private Integer status;
    /**
     * 展示图片
     */
	@TableField("pic_img")
	private String picImg;
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


	public Long getAdvertDetailId() {
		return advertDetailId;
	}

	public void setAdvertDetailId(Long advertDetailId) {
		this.advertDetailId = advertDetailId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getAdvertId() {
		return advertId;
	}

	public void setAdvertId(Long advertId) {
		this.advertId = advertId;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
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

	public String getPicImg() {
		return picImg;
	}

	public void setPicImg(String picImg) {
		this.picImg = picImg;
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
		return this.advertDetailId;
	}

}
