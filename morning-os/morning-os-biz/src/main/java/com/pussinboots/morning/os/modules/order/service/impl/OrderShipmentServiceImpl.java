package com.pussinboots.morning.os.modules.order.service.impl;

import com.pussinboots.morning.os.modules.order.entity.OrderShipment;
import com.pussinboots.morning.os.modules.order.mapper.OrderShipmentMapper;
import com.pussinboots.morning.os.modules.order.service.IOrderShipmentService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：OrderShipmentServiceImpl   
* 类描述：OrderShipment表 / 订单配送表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年3月28日 下午3:43:56   
*
 */
@Service
public class OrderShipmentServiceImpl extends ServiceImpl<OrderShipmentMapper, OrderShipment> implements IOrderShipmentService {

	@Autowired
	private OrderShipmentMapper orderShipmentMapper;
	
	@Override
	public OrderShipment selectByOrderId(Long orderId) {
		OrderShipment orderShipment = new OrderShipment();
		orderShipment.setOrderId(orderId);
		return orderShipmentMapper.selectOne(orderShipment);
	}
	
}
