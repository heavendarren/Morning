package com.pussinboots.morning.os.modules.product.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.math.BigDecimal;


/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：Product   
* 类描述：Product表 / 商品表   实体类     
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:33:23   
*
 */
@TableName("os_product")
public class Product extends Model<Product> {

    private static final long serialVersionUID = 1L;

    /**
     * 商品ID
     */
	@TableId("product_id")
	private Long productId;
    /**
     * 商品编号
     */
	@TableField("product_number")
	private Long productNumber;
    /**
     * 标签ID
     */
	@TableField("label_id")
	private Integer labelId;
    /**
     * 商品名称
     */
	private String name;
    /**
     * 显示价格
     */
	@TableField("show_price")
	private BigDecimal showPrice;
    /**
     * 商品简介
     */
	private String introduce;
    /**
     * 搜索关键词
     */
	@TableField("search_key")
	private String searchKey;
    /**
     * 展示图片
     */
	@TableField("pic_img")
	private String picImg;
    /**
     * 显示首页导航条上：1.显示；0.隐藏
     */
	@TableField("show_in_nav")
	private Integer showInNav;
    /**
     * 是否是明星产品：0,否；1.是
     */
	@TableField("star_product")
	private Integer starProduct;
    /**
     * 商品状态：0,新增；1,上架；2,下架
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
     * 备注
     */
	private String remarks;


	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Long getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(Long productNumber) {
		this.productNumber = productNumber;
	}

	public Integer getLabelId() {
		return labelId;
	}

	public void setLabelId(Integer labelId) {
		this.labelId = labelId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getShowPrice() {
		return showPrice;
	}

	public void setShowPrice(BigDecimal showPrice) {
		this.showPrice = showPrice;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getPicImg() {
		return picImg;
	}

	public void setPicImg(String picImg) {
		this.picImg = picImg;
	}

	public Integer getShowInNav() {
		return showInNav;
	}

	public void setShowInNav(Integer showInNav) {
		this.showInNav = showInNav;
	}

	public Integer getStarProduct() {
		return starProduct;
	}

	public void setStarProduct(Integer starProduct) {
		this.starProduct = starProduct;
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
		return this.productId;
	}

}
