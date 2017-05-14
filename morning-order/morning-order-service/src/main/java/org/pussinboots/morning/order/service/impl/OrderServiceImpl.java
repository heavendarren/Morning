package org.pussinboots.morning.order.service.impl;

import java.util.Date;
import java.util.List;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.order.common.enums.OrderCreateStatusEnum;
import org.pussinboots.morning.order.common.enums.OrderStatusEnum;
import org.pussinboots.morning.order.common.util.OrderUtils;
import org.pussinboots.morning.order.entity.Order;
import org.pussinboots.morning.order.entity.OrderShipment;
import org.pussinboots.morning.order.entity.OrderStatus;
import org.pussinboots.morning.order.mapper.OrderMapper;
import org.pussinboots.morning.order.mapper.OrderProductMapper;
import org.pussinboots.morning.order.mapper.OrderShipmentMapper;
import org.pussinboots.morning.order.mapper.OrderStatusMapper;
import org.pussinboots.morning.order.pojo.vo.OrderShoppingCartVO;
import org.pussinboots.morning.order.pojo.vo.OrderVO;
import org.pussinboots.morning.order.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-order-service   
* 类名称：OrderServiceImpl   
* 类描述：Order / 订单表 业务逻辑层接口实现                  
* 创建人：陈星星   
* 创建时间：2017年5月10日 上午10:35:40   
*
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements IOrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderShipmentMapper orderShipmentMapper;
	@Autowired
	private OrderStatusMapper orderStatusMapper;
	@Autowired
	private OrderProductMapper orderProductMapper;
	
	@Override
	public Long insertOrder(Order order, OrderShipment orderShipment, List<OrderShoppingCartVO> shoppingCartVOs,
			Long userId) {
		
		// 创建订单
		Long orderNumber = OrderUtils.getOrderNuber();
		order.setCreateTime(new Date());
		order.setUpdateTime(new Date());
		order.setUserId(userId);
		order.setOrderNumber(orderNumber);
		order.setPayAmount(OrderUtils.getPayAmount(order.getShipmentAmount(), order.getOrderAmount()));
		order.setOrderStatus(OrderStatusEnum.SUBMIT_ORDERS.getStatus());
		orderMapper.insert(order);
		
		// 创建订单配送表
		orderShipment.setOrderId(order.getOrderId());
		order.setUpdateTime(new Date());
		orderShipmentMapper.insert(orderShipment);
		
		// 添加订单详情表
		orderProductMapper.insertProducts(shoppingCartVOs, order.getOrderId());
		
		// 添加订单记录表
		OrderStatus orderStatus = new OrderStatus();
		orderStatus.setCreateBy(userId.toString());
		orderStatus.setCreateTime(new Date());
		orderStatus.setRemarks(OrderStatusEnum.SUBMIT_ORDERS.getStateInfo());
		orderStatus.setOrderStatus(OrderStatusEnum.SUBMIT_ORDERS.getStatus());
		orderStatus.setOrderId(order.getOrderId());
		orderStatus.setCreateStatus(OrderCreateStatusEnum.MEMBER.getStatus());
		orderStatusMapper.insert(orderStatus);
		
		return order.getOrderNumber();
	}

	@Override
	public BasePageDTO<OrderVO> list(Long userId, PageInfo pageInfo, String typeValue, String search) {
		pageInfo.setTotal(orderMapper.getCount(userId, typeValue, search));
		List<OrderVO> orderVOs = orderMapper.list(userId, typeValue, pageInfo, search);
		return new BasePageDTO<OrderVO>(pageInfo, orderVOs);
	}

	@Override
	public OrderVO getOrder(Long userId, Long orderNumber) {
		return orderMapper.getOrder(userId, orderNumber);
	}

	@Override
	public Order getByOrderNumber(Long orderNumber, Long userId, Integer status) {
		Order order = new Order();
		order.setOrderNumber(orderNumber);
		order.setUserId(userId);
		order.setOrderStatus(status);
		return orderMapper.selectOne(order);
	}

	@Override
	public Integer updateCancelOrder(Long orderNumber, Long userId) {
		Order queryOrder = new Order();
		queryOrder.setOrderNumber(orderNumber);
		queryOrder.setUserId(userId);
		queryOrder.setOrderStatus(OrderStatusEnum.SUBMIT_ORDERS.getStatus());
		Order order = orderMapper.selectOne(queryOrder);

		if (order != null) {
			order.setOrderStatus(OrderStatusEnum.MANUALLY_CANCEL_THE_ORDER.getStatus());
			order.setUpdateTime(new Date());
			orderMapper.updateById(order);

			// 添加订单记录表
			OrderStatus orderStatus = new OrderStatus();
			orderStatus.setCreateBy(userId.toString());
			orderStatus.setCreateTime(new Date());
			orderStatus.setRemarks(OrderStatusEnum.MANUALLY_CANCEL_THE_ORDER.getStateInfo());
			orderStatus.setOrderStatus(OrderStatusEnum.MANUALLY_CANCEL_THE_ORDER.getStatus());
			orderStatus.setOrderId(order.getOrderId());
			orderStatus.setCreateStatus(OrderCreateStatusEnum.MEMBER.getStatus());
			return orderStatusMapper.insert(orderStatus);
		} else {
			// TODO 抛出一个订单不存在的异常
			return null;
		}

	}

	@Override
	public Integer updateShipmentTime(Long orderNumber, Integer shipmentTime, Long userId) {
		Order queryOrder = new Order();
		queryOrder.setOrderNumber(orderNumber);
		queryOrder.setUserId(userId);
		queryOrder.setOrderStatus(OrderStatusEnum.SUBMIT_ORDERS.getStatus());
		Order order = orderMapper.selectOne(queryOrder);

		if (order != null) {
			order.setShipmentTime(shipmentTime);
			order.setUpdateTime(new Date());
			return orderMapper.updateById(order);

		} else {
			// TODO 抛出一个订单不存在的异常
			return null;
		}
	}
}
