package org.pussinboots.morning.product.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：Product   
* 类描述：Product / 商品表 实体类   
* 创建人：陈星星   
* 创建时间：2017年4月11日 下午3:11:04   
*
 */
@TableName("os_product")
public class Product extends Model<Product> {

    private static final long serialVersionUID = 1L;

    /**
     * 商品ID
     */
	@TableId(value="product_id", type= IdType.AUTO)
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
     * 显示价积分
     */
	@TableField("show_score")
	private Integer showScore;
    /**
     * 显示价格
     */
	@TableField("show_price")
	private BigDecimal showPrice;
    /**
     * 产品简介
     */
	private String introduce;
    /**
     * 展示图片
     */
	@TableField("pic_img")
	private String picImg;
    /**
     * 是否置顶 1=置顶/0=默认
     */
	@TableField("show_in_top")
	private Integer showInTop;
    /**
     * 是否导航栏 1=显示/0=隐藏
     */
	@TableField("show_in_nav")
	private Integer showInNav;
    /**
     * 是否热门 1=热门/0=默认
     */
	@TableField("show_in_hot")
	private Integer showInHot;
    /**
     * 是否上架：1=上架/0=下架
     */
	@TableField("show_in_shelve")
	private Integer showInShelve;
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
     * 上架时间
     */
	@TableField("shelve_time")
	private Date shelveTime;
    /**
     * 上架人
     */
	@TableField("shelve_by")
	private String shelveBy;
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
     * 搜索关键词
     */
	@TableField("search_key")
	private String searchKey;
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

	public Integer getShowScore() {
		return showScore;
	}

	public void setShowScore(Integer showScore) {
		this.showScore = showScore;
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

	public String getPicImg() {
		return picImg;
	}

	public void setPicImg(String picImg) {
		this.picImg = picImg;
	}

	public Integer getShowInTop() {
		return showInTop;
	}

	public void setShowInTop(Integer showInTop) {
		this.showInTop = showInTop;
	}

	public Integer getShowInNav() {
		return showInNav;
	}

	public void setShowInNav(Integer showInNav) {
		this.showInNav = showInNav;
	}

	public Integer getShowInHot() {
		return showInHot;
	}

	public void setShowInHot(Integer showInHot) {
		this.showInHot = showInHot;
	}

	public Integer getShowInShelve() {
		return showInShelve;
	}

	public void setShowInShelve(Integer showInShelve) {
		this.showInShelve = showInShelve;
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

	public Date getShelveTime() {
		return shelveTime;
	}

	public void setShelveTime(Date shelveTime) {
		this.shelveTime = shelveTime;
	}

	public String getShelveBy() {
		return shelveBy;
	}

	public void setShelveBy(String shelveBy) {
		this.shelveBy = shelveBy;
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

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
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
