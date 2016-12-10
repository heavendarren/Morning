package com.morning.entity.order;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.morning.entity.user.UserAddress;

/**
 * @description：订单实体类
 * @author CXX
 * @version 创建时间：2016年8月29日  下午4:04:08
 */
public class Order implements Serializable{
	
	private static final long serialVersionUID = 709516462127366974L;
	/**订单ID*/
	private Integer orderId;
	/**订单编号*/
    private String orderNumber;
	/**用户ID*/
    private Integer accountId;
	/**下单时间*/
    private Date orderDate;
	/**订单总金额*/
    private Double totalMoney;
	/**订单状态:0.订单关闭1.订单提交2.支付完成3.商品出库4.等待收获5.收货完成*/
    private Integer orderState;
	/**地址编号*/
    private Integer addressId;
	/**支付方式*/
    private Integer payType;
    /**支付状态*/
    private Integer payStatus;
    /**支付平台*/
    private String payment;
	/**配送方式*/
    private Integer sendType;
	/**送货时间*/
    private Integer sendTime;
	/**发票类型*/
    private Integer invoicelType;
	/**发票内容*/
    private String invoicelTitle;
	/**会员留言*/
    private String userMessage;
    /**订单详情列表*/
    private List<OrderMessage> orderMessageList;
    /**收货地址信息*/
    private UserAddress userAddress;
    /**收货地址信息*/
    private OrderShip orderShip;
    
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public Integer getAccountId() {
		return accountId;
	}
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public Integer getOrderState() {
		return orderState;
	}
	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}
	public Integer getAddressId() {
		return addressId;
	}
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
	public Integer getPayType() {
		return payType;
	}
	public void setPayType(Integer payType) {
		this.payType = payType;
	}
	public Integer getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(Integer payStatus) {
		this.payStatus = payStatus;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public Integer getSendType() {
		return sendType;
	}
	public void setSendType(Integer sendType) {
		this.sendType = sendType;
	}
	public Integer getSendTime() {
		return sendTime;
	}
	public void setSendTime(Integer sendTime) {
		this.sendTime = sendTime;
	}
	public Integer getInvoicelType() {
		return invoicelType;
	}
	public void setInvoicelType(Integer invoicelType) {
		this.invoicelType = invoicelType;
	}
	public String getInvoicelTitle() {
		return invoicelTitle;
	}
	public void setInvoicelTitle(String invoicelTitle) {
		this.invoicelTitle = invoicelTitle;
	}
	public String getUserMessage() {
		return userMessage;
	}
	public void setUserMessage(String userMessage) {
		this.userMessage = userMessage;
	}
	public List<OrderMessage> getOrderMessageList() {
		return orderMessageList;
	}
	public void setOrderMessageList(List<OrderMessage> orderMessageList) {
		this.orderMessageList = orderMessageList;
	}
	public UserAddress getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(UserAddress userAddress) {
		this.userAddress = userAddress;
	}
	public OrderShip getOrderShip() {
		return orderShip;
	}
	public void setOrderShip(OrderShip orderShip) {
		this.orderShip = orderShip;
	}
}