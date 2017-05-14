package org.pussinboots.morning.order.service.impl;

import java.util.List;

import org.pussinboots.morning.order.entity.OrderProduct;
import org.pussinboots.morning.order.mapper.OrderProductMapper;
import org.pussinboots.morning.order.service.IOrderProductService;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-order-service   
* 类名称：OrderProductServiceImpl   
* 类描述：OrderProduct / 订单明细表 业务逻辑层接口实现               
* 创建人：陈星星   
* 创建时间：2017年5月10日 上午10:35:16   
*
 */
@Service
public class OrderProductServiceImpl extends ServiceImpl<OrderProductMapper, OrderProduct> implements IOrderProductService {

	@Autowired
	private OrderProductMapper orderProductMapper;
	
	@Override
	public List<OrderProduct> listByOrderId(Long orderId) {
		OrderProduct orderProduct = new OrderProduct();
		orderProduct.setOrderId(orderId);
		return orderProductMapper.selectList(new EntityWrapper<OrderProduct>(orderProduct));
	}
}
