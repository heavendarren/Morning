package com.morning.entity.order;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.morning.entity.user.UserAddress;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * @description：订单实体类
 * @author CXX
 * @version 创建时间：2016年8月29日  下午4:04:08
 */
@Data
@EqualsAndHashCode(callSuper = false)
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

}