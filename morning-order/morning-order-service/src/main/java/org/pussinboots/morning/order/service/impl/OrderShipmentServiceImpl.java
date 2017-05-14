package org.pussinboots.morning.order.service.impl;

import org.pussinboots.morning.order.entity.OrderShipment;
import org.pussinboots.morning.order.mapper.OrderShipmentMapper;
import org.pussinboots.morning.order.service.IOrderShipmentService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-order-service   
* 类名称：OrderShipmentServiceImpl   
* 类描述：OrderShipment / 订单配送表 业务逻辑层接口实现            
* 创建人：陈星星   
* 创建时间：2017年5月10日 上午10:34:55   
*
 */
@Service
public class OrderShipmentServiceImpl extends ServiceImpl<OrderShipmentMapper, OrderShipment> implements IOrderShipmentService {
	
	@Autowired
	private OrderShipmentMapper orderShipmentMapper;

	@Override
	public OrderShipment getByOrderId(Long orderId) {
		OrderShipment orderShipment = new OrderShipment();
		orderShipment.setOrderId(orderId);
		return orderShipmentMapper.selectOne(orderShipment);
	}

	@Override
	public Integer update(OrderShipment orderShipment, Long userId) {
		// TODO 根据订单号以及用户ID以及订单状态查找该订单是否存在,如存在则修改配送地址信息,若不存在,则抛出异常
		return orderShipmentMapper.updateById(orderShipment);
	}
}
