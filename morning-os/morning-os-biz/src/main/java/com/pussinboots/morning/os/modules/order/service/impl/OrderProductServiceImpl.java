package com.pussinboots.morning.os.modules.order.service.impl;

import com.pussinboots.morning.os.modules.order.entity.OrderProduct;
import com.pussinboots.morning.os.modules.order.mapper.OrderProductMapper;
import com.pussinboots.morning.os.modules.order.service.IOrderProductService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：OrderProductServiceImpl   
* 类描述：OrderProduct表 / 订单明细表 业务逻辑层接口实现    
* 创建人：陈星星   
* 创建时间：2017年3月28日 下午3:43:07   
*
 */
@Service
public class OrderProductServiceImpl extends ServiceImpl<OrderProductMapper, OrderProduct> implements IOrderProductService {
	
	@Autowired
	private OrderProductMapper orderProductMapper;

	@Override
	public List<OrderProduct> selectByOrderId(Long orderId) {
		OrderProduct orderProduct = new OrderProduct();
		orderProduct.setOrderId(orderId);
		return orderProductMapper.selectList(new EntityWrapper<OrderProduct>(orderProduct));
	}
}
