package com.morning.service.impl.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.order.OrderShipMapper;
import com.morning.dao.user.UserAddressMapper;
import com.morning.entity.order.OrderShip;
import com.morning.entity.user.UserAddress;
import com.morning.service.order.IOrderShipService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * OrderShip 表数据服务层接口实现类
 *
 */
@Service
public class OrderShipServiceImpl extends SuperServiceImpl<OrderShipMapper, OrderShip> implements IOrderShipService {
	
	@Autowired
	private OrderShipMapper orderShipMapper;
	@Autowired
	private UserAddressMapper userAddressMapper;

	@Override
	public void insertOrderShip(Integer orderId, Integer addressId) {
		UserAddress userAddress = userAddressMapper.queryAddressById(addressId);
		OrderShip orderShip = new OrderShip(userAddress);
		orderShip.setOrderId(orderId);
		orderShipMapper.insertSelective(orderShip);
	}

	@Override
	public OrderShip selectByOrderId(Integer orderId) {
		OrderShip orderShip = new OrderShip();
		orderShip.setOrderId(orderId);
		return orderShipMapper.selectOne(orderShip);
	}
	
}