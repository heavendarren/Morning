package com.morning.service.order;

import com.morning.entity.order.OrderShip;
import com.baomidou.framework.service.ISuperService;

/**
 *
 * OrderShip 表数据服务层接口
 *
 */
public interface IOrderShipService extends ISuperService<OrderShip> {
	
	/**
	 * 创建订单配送表
	 * @param orderId
	 * @param addressId
	 */
	void insertOrderShip(Integer orderId, Integer addressId);
	
	/**
	 * 通过订单ID查询订单配送记录
	 * @param orderId 订单ID
	 * @return
	 */
	OrderShip selectByOrderId(Integer orderId);


}