package org.pussinboots.morning.order.pojo.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.pussinboots.morning.order.entity.OrderProduct;
import org.pussinboots.morning.order.entity.OrderShipment;
import org.pussinboots.morning.order.entity.OrderStatus;

public class OrderVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
    /**
     * 订单ID
     */
	private Long orderId;
	
    /**
     * 订单编号,系统生成
     */
	private Long orderNumber;
	
    /**
     * 用户ID
     */
	private Long userId;
	
    /**
     * 支付方式 0=线下支付，1=在线支付
     */
	private Integer payType;
	
    /**
     * 配送时间 1=不限送货时间，2=工作日送货，3=双休日、假日送货
     */
	private Integer shipmentTime;
	
    /**
     * 配送方式 0=快递配送（免运费），1=快递配送（运费）
     */
	private Integer shipmentType;
	
    /**
     * 快递费
     */
	private BigDecimal shipmentAmount;
	
    /**
     * 支付方式 1=不开发票，2=电子发票，3=普通发票
     */
	private Integer invoiceType;
	
    /**
     * 发票抬头
     */
	private String invoiceTitle;
	
    /**
     * 订单状态
     */
	private Integer orderStatus;
	
    /**
     * 创建时间
     */
	private Date createTime;
	
    /**
     * 更新时间
     */
	private Date updateTime;
	
    /**
     * 订单金额
     */
	private BigDecimal orderAmount;
	
    /**
     * 订单积分
     */
	private Integer orderScore;
	
    /**
     * 支付金额 = 订单金额 + 快递费
     */
	private BigDecimal payAmount;
	
    /**
     * 商品总数量
     */
	private Integer buyNumber;
	
	/**
	 * 订单配送表
	 */
	private OrderShipment orderShipment;
	
	/**
	 * 订单明细表
	 */
	private List<OrderProduct> orderProducts;
	
	/**
	 * 订单状态表 
	 */
	private List<OrderStatus> orderStatusList;
	
	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Long getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(Long orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Integer getPayType() {
		return payType;
	}

	public void setPayType(Integer payType) {
		this.payType = payType;
	}

	public Integer getShipmentTime() {
		return shipmentTime;
	}

	public void setShipmentTime(Integer shipmentTime) {
		this.shipmentTime = shipmentTime;
	}

	public Integer getShipmentType() {
		return shipmentType;
	}

	public void setShipmentType(Integer shipmentType) {
		this.shipmentType = shipmentType;
	}

	public BigDecimal getShipmentAmount() {
		return shipmentAmount;
	}

	public void setShipmentAmount(BigDecimal shipmentAmount) {
		this.shipmentAmount = shipmentAmount;
	}

	public Integer getInvoiceType() {
		return invoiceType;
	}

	public void setInvoiceType(Integer invoiceType) {
		this.invoiceType = invoiceType;
	}

	public String getInvoiceTitle() {
		return invoiceTitle;
	}

	public void setInvoiceTitle(String invoiceTitle) {
		this.invoiceTitle = invoiceTitle;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public BigDecimal getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(BigDecimal orderAmount) {
		this.orderAmount = orderAmount;
	}

	public Integer getOrderScore() {
		return orderScore;
	}

	public void setOrderScore(Integer orderScore) {
		this.orderScore = orderScore;
	}

	public BigDecimal getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(BigDecimal payAmount) {
		this.payAmount = payAmount;
	}

	public Integer getBuyNumber() {
		return buyNumber;
	}

	public void setBuyNumber(Integer buyNumber) {
		this.buyNumber = buyNumber;
	}

	public OrderShipment getOrderShipment() {
		return orderShipment;
	}

	public void setOrderShipment(OrderShipment orderShipment) {
		this.orderShipment = orderShipment;
	}

	public List<OrderProduct> getOrderProducts() {
		return orderProducts;
	}

	public void setOrderProducts(List<OrderProduct> orderProducts) {
		this.orderProducts = orderProducts;
	}

	public List<OrderStatus> getOrderStatusList() {
		return orderStatusList;
	}

	public void setOrderStatusList(List<OrderStatus> orderStatusList) {
		this.orderStatusList = orderStatusList;
	}

}
