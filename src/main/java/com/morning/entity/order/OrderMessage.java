package com.morning.entity.order;

import java.io.Serializable;

import com.morning.entity.goods.Goods;

/**
 * @description：订单详情实体类
 * @author CXX
 * @version 创建时间：2016年8月29日  下午5:21:16
 */
public class OrderMessage implements Serializable{
	
	private static final long serialVersionUID = -6800637303825877829L;
	/**订单详情ID*/
	private Integer orderMessageId;
	/**商品编号*/
    private Integer goodsId;
	/**购买数量*/
    private Integer orderNumber;
	/**公益价格*/
    private Double orderMoney;
	/**商品颜色*/
    private String goodsColor;
	/**商品版本*/
    private String goodsStandard;
	/**公益套餐*/
    private Integer publicType;
	/**订单ID*/
    private Integer orderId;
    /**商品实体类*/
    private Goods goods;
    /**购物车临时编号*/
    private Integer cartId;
	public Integer getOrderMessageId() {
		return orderMessageId;
	}
	public void setOrderMessageId(Integer orderMessageId) {
		this.orderMessageId = orderMessageId;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public Integer getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}
	public Double getOrderMoney() {
		return orderMoney;
	}
	public void setOrderMoney(Double orderMoney) {
		this.orderMoney = orderMoney;
	}
	public String getGoodsColor() {
		return goodsColor;
	}
	public void setGoodsColor(String goodsColor) {
		this.goodsColor = goodsColor;
	}
	public String getGoodsStandard() {
		return goodsStandard;
	}
	public void setGoodsStandard(String goodsStandard) {
		this.goodsStandard = goodsStandard;
	}
	public Integer getPublicType() {
		return publicType;
	}
	public void setPublicType(Integer publicType) {
		this.publicType = publicType;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public Integer getCartId() {
		return cartId;
	}
	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}
}