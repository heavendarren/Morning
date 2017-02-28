package com.pussinboots.morning.os.modules.product.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：ProductAttribute   
* 类描述：ProductAttribute表 / 商品属性表 实体类   
* 创建人：陈星星   
* 创建时间：2017年2月27日 下午1:26:29   
*
 */
@TableName("os_product_attribute")
public class ProductAttribute extends Model<ProductAttribute> {

    private static final long serialVersionUID = 1L;

    /**
     * 属性ID
     */
	@TableId("attribute_id")
	private Long attributeId;
    /**
     * 商品ID
     */
	@TableField("product_id")
	private Long productId;
    /**
     * 总库存
     */
	private Integer stock;
    /**
     * 销售量
     */
	@TableField("sales_volume")
	private Integer salesVolume;
    /**
     * 游览量
     */
	@TableField("page_views")
	private Integer pageViews;
    /**
     * 评论数量
     */
	@TableField("comment_number")
	private Integer commentNumber;
    /**
     * 累计评价
     */
	@TableField("comment_total")
	private Integer commentTotal;
    /**
     * 平均评价
     */
	@TableField("comment_average")
	private BigDecimal commentAverage;
    /**
     * 收藏数
     */
	@TableField("favorite_number")
	private Integer favoriteNumber;


	public Long getAttributeId() {
		return attributeId;
	}

	public void setAttributeId(Long attributeId) {
		this.attributeId = attributeId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Integer getSalesVolume() {
		return salesVolume;
	}

	public void setSalesVolume(Integer salesVolume) {
		this.salesVolume = salesVolume;
	}

	public Integer getPageViews() {
		return pageViews;
	}

	public void setPageViews(Integer pageViews) {
		this.pageViews = pageViews;
	}

	public Integer getCommentNumber() {
		return commentNumber;
	}

	public void setCommentNumber(Integer commentNumber) {
		this.commentNumber = commentNumber;
	}

	public Integer getCommentTotal() {
		return commentTotal;
	}

	public void setCommentTotal(Integer commentTotal) {
		this.commentTotal = commentTotal;
	}

	public BigDecimal getCommentAverage() {
		return commentAverage;
	}

	public void setCommentAverage(BigDecimal commentAverage) {
		this.commentAverage = commentAverage;
	}

	public Integer getFavoriteNumber() {
		return favoriteNumber;
	}

	public void setFavoriteNumber(Integer favoriteNumber) {
		this.favoriteNumber = favoriteNumber;
	}

	@Override
	protected Serializable pkVal() {
		return this.attributeId;
	}

}
