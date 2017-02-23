package com.pussinboots.morning.os.modules.product.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：ProductImage   
* 类描述：ProductImage表 / 商品图片表 实体类   
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:36:56   
*
 */
@TableName("os_product_image")
public class ProductImage extends Model<ProductImage> {

    private static final long serialVersionUID = 1L;

	@TableId("pic_img_id")
	private Long picImgId;
    /**
     * 商品ID
     */
	@TableField("product_id")
	private Long productId;
    /**
     * 展示图片
     */
	@TableField("pic_img")
	private String picImg;
    /**
     * 排序
     */
	private Integer sort;
    /**
     * 状态：1.显示；0.隐藏
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
     * 更新者
     */
	@TableField("update_by")
	private String updateBy;
    /**
     * 页面标题
     */
	@TableField("page_title")
	private String pageTitle;


	public Long getPicImgId() {
		return picImgId;
	}

	public void setPicImgId(Long picImgId) {
		this.picImgId = picImgId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getPicImg() {
		return picImg;
	}

	public void setPicImg(String picImg) {
		this.picImg = picImg;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
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

	@Override
	protected Serializable pkVal() {
		return this.picImgId;
	}

}