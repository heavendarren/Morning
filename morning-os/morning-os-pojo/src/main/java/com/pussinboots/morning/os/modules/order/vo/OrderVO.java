package com.pussinboots.morning.os.modules.order.vo;

import java.util.List;

import com.pussinboots.morning.os.modules.order.entity.Order;
import com.pussinboots.morning.os.modules.order.entity.OrderProduct;
import com.pussinboots.morning.os.modules.order.entity.OrderShipment;
import com.pussinboots.morning.os.modules.order.entity.OrderStatus;

public class OrderVO extends Order{

	private static final long serialVersionUID = 1L;
	
	private OrderShipment orderShipment;
	
	private List<OrderProduct> orderProducts;
	
	private List<OrderStatus> orderStatusList;
	
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
