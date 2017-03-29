package com.pussinboots.morning.os.modules.order.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.common.enums.StatusEnum;
import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.common.util.OrderUtils;
import com.pussinboots.morning.os.modules.order.dto.OrderPageDTO;
import com.pussinboots.morning.os.modules.order.entity.Order;
import com.pussinboots.morning.os.modules.order.entity.OrderShipment;
import com.pussinboots.morning.os.modules.order.entity.OrderStatus;
import com.pussinboots.morning.os.modules.order.enums.OrderCreateStatusEnum;
import com.pussinboots.morning.os.modules.order.enums.OrderStatusEnum;
import com.pussinboots.morning.os.modules.order.mapper.OrderMapper;
import com.pussinboots.morning.os.modules.order.mapper.OrderProductMapper;
import com.pussinboots.morning.os.modules.order.mapper.OrderShipmentMapper;
import com.pussinboots.morning.os.modules.order.mapper.OrderStatusMapper;
import com.pussinboots.morning.os.modules.order.service.IOrderService;
import com.pussinboots.morning.os.modules.order.vo.OrderVO;
import com.pussinboots.morning.os.modules.product.entity.ShoppingCart;
import com.pussinboots.morning.os.modules.product.mapper.ShoppingCartMapper;
import com.pussinboots.morning.os.modules.product.mapper.SpecificationAttributeMapper;
import com.pussinboots.morning.os.modules.product.vo.CartVO;
import com.pussinboots.morning.os.modules.product.vo.ShoppingCartVO;
import com.pussinboots.morning.os.modules.user.entity.Address;
import com.pussinboots.morning.os.modules.user.mapper.AddressMapper;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：OrderServiceImpl   
* 类描述：Order表 / 订单表 业务逻辑层接口实现       
* 创建人：陈星星   
* 创建时间：2017年3月28日 下午3:43:38   
*
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements IOrderService {
	
	@Autowired
	private ShoppingCartMapper shoppingCartMapper;
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private AddressMapper addressMapper;
	@Autowired
	private OrderShipmentMapper orderShipmentMapper;
	@Autowired
	private OrderProductMapper orderProductMapper;
	@Autowired
	private SpecificationAttributeMapper specificationAttributeMapper;
	@Autowired
	private OrderStatusMapper orderStatusMapper;
	
	@Transactional
	@Override
	public Long insertOrder(Order order, Long addressId, Long userId) {
		
		// 根据用户ID查找购物车商品列表
		List<ShoppingCartVO> shoppingCartVOs = shoppingCartMapper.selectCartVOs(userId, StatusEnum.CHECKED.getStatus());
		CartVO cartVO = new CartVO();
		if (!shoppingCartVOs.isEmpty()) {
			for (ShoppingCartVO shoppingCartVO : shoppingCartVOs) {
				// 根据用户ID查找购物车商品列表
				if (StringUtils.isNotBlank(shoppingCartVO.getSpec())) {
					List<String> specificationName = specificationAttributeMapper
							.selectBySpec(shoppingCartVO.getSpec());
					shoppingCartVO.setSpecificationName(specificationName);
				}
			}
			cartVO.setShoppingCartVOs(shoppingCartVOs);
		}
		
		// 获得订单编号
		Long orderNumber = OrderUtils.getOrderNuber();
		order.setCreateTime(new Date());
		order.setUpdateTime(new Date());
		order.setUserId(userId);
		order.setBuyNumber(cartVO.getTotalNumber());
		order.setOrderAmount(cartVO.getTotalPrice());
		order.setOrderScore(cartVO.getTotalScore());
		order.setOrderNumber(orderNumber);
		order.setPayAmount(OrderUtils.getPayAmount(order.getShipmentAmount(), order.getOrderAmount()));
		order.setOrderStatus(OrderStatusEnum.SUBMIT_ORDERS.getStatus());
		orderMapper.insert(order);
		
		// 根据用户ID和地址ID查找地址
		Address queryAddress = new Address();
		queryAddress.setAddressId(addressId);
		queryAddress.setUserId(userId);
		Address address = addressMapper.selectOne(queryAddress);
		
		OrderShipment orderShipment = new OrderShipment();
		BeanUtils.copyProperties(address, orderShipment);
		orderShipment.setOrderId(order.getOrderId());
		orderShipment.setUpdateTime(null);
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
		
		// 删除购物车车中商品
		ShoppingCart shoppingCart = new ShoppingCart();
		shoppingCart.setUserId(userId);
		shoppingCart.setCheckStatus(StatusEnum.CHECKED.getStatus());
		shoppingCartMapper.delete(new EntityWrapper<ShoppingCart>(shoppingCart));
		
		return orderNumber;
	}

	@Override
	public Order selectByOrderNumber(Long orderNumber, Long userId, Integer orderStatus) {
		Order order = new Order();
		order.setOrderNumber(orderNumber);
		order.setUserId(userId);
		order.setOrderStatus(orderStatus);
		return orderMapper.selectOne(order);
	}

	@Override
	public OrderPageDTO selectOrderVO(Long userId, String typeValue, PageInfo pageInfo, String search) {
		pageInfo.setTotal(orderMapper.selectOrderVOCount(userId, typeValue, search));
		List<OrderVO> orderVOs = orderMapper.selectOrderVO(userId, typeValue, pageInfo, search);
		return new OrderPageDTO(orderVOs, pageInfo);
	}
}
