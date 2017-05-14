package org.pussinboots.morning.order.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-order-facade   
* 类名称：OrderProduct   
* 类描述：OrderProduct / 订单明细表 实体类   
* 创建人：陈星星   
* 创建时间：2017年5月10日 上午10:29:38   
*
 */
@TableName("os_order_product")
public class OrderProduct extends Model<OrderProduct> {

    private static final long serialVersionUID = 1L;

    /**
     * 订单商品ID
     */
	@TableId(value="order_product_id", type= IdType.AUTO)
	private Long orderProductId;
    /**
     * 订单ID
     */
	@TableField("order_id")
	private Long orderId;
    /**
     * 商品编号
     */
	@TableField("product_number")
	private Long productNumber;
    /**
     * 商品名称
     */
	private String name;
    /**
     * 展示图片
     */
	@TableField("pic_img")
	private String picImg;
    /**
     * 商品规格编号
     */
	@TableField("product_spec_number")
	private Long productSpecNumber;
    /**
     * 商品规格名称
     */
	@TableField("product_spec_name")
	private String productSpecName;
    /**
     * 价格
     */
	private BigDecimal price;
    /**
     * 积分
     */
	private Integer score;
    /**
     * 商品总数量
     */
	@TableField("buy_number")
	private Integer buyNumber;
    /**
     * 商品总积分
     */
	@TableField("product_score")
	private Integer productScore;
    /**
     * 商品总金额
     */
	@TableField("product_amount")
	private BigDecimal productAmount;
    /**
     * 评论状态 0=未评论，1=已评论
     */
	@TableField("comment_status")
	private Integer commentStatus;


	public Long getOrderProductId() {
		return orderProductId;
	}

	public void setOrderProductId(Long orderProductId) {
		this.orderProductId = orderProductId;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Long getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(Long productNumber) {
		this.productNumber = productNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPicImg() {
		return picImg;
	}

	public void setPicImg(String picImg) {
		this.picImg = picImg;
	}

	public Long getProductSpecNumber() {
		return productSpecNumber;
	}

	public void setProductSpecNumber(Long productSpecNumber) {
		this.productSpecNumber = productSpecNumber;
	}

	public String getProductSpecName() {
		return productSpecName;
	}

	public void setProductSpecName(String productSpecName) {
		this.productSpecName = productSpecName;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getBuyNumber() {
		return buyNumber;
	}

	public void setBuyNumber(Integer buyNumber) {
		this.buyNumber = buyNumber;
	}

	public Integer getProductScore() {
		return productScore;
	}

	public void setProductScore(Integer productScore) {
		this.productScore = productScore;
	}

	public BigDecimal getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(BigDecimal productAmount) {
		this.productAmount = productAmount;
	}

	public Integer getCommentStatus() {
		return commentStatus;
	}

	public void setCommentStatus(Integer commentStatus) {
		this.commentStatus = commentStatus;
	}

	@Override
	protected Serializable pkVal() {
		return this.orderProductId;
	}

}
