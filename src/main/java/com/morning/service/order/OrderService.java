package com.morning.service.order;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.morning.entity.PageInfo;
import com.morning.entity.ShoppingCart;
import com.morning.entity.order.Order;
import com.morning.entity.order.OrderMessage;
import com.morning.entity.order.QueryOrder;

/**
 * 
 * @description：订单业务层接口
 * @author CXX
 * @version 创建时间：2016年8月23日  上午12:16:56
 */
public interface OrderService {
	
	/**
	 * 创建新订单
	 * @param order
	 * @return
	 */
	public int createOrder(Order order);

	/**
	 * 查询订单数量
	 * @param queryOrder
	 * @return
	 */
	public int queryOrderCount(QueryOrder queryOrder);
	
	/**
	 * 查询订单数量,通过订单状态
	 * @param orderState
	 * @return
	 */
	public int queryOrderCountBySystem(Integer orderState);
	
	/**
	 * 查询最近订单时间,通过订单状态
	 * @param orderState
	 * @return
	 */
	public Date queryOrderTime(Integer orderState);
	
	/**
	 * 查询订单，通过订单状态 /搜索条件
	 * @param queryOrder
	 * @param pageInfo
	 * @return
	 */
	public List<Order> queryOrder(QueryOrder queryOrder, PageInfo pageInfo);
	
	/**
	 * 创建新订单和订单详情
	 * @param order
	 * @param orderMessageList
	 * @return
	 */
	public Map<String, Object> createOrderAndMessage(Order order, List<OrderMessage> orderMessageList);
	
	/**
	 * 更新购物车商品数量和价钱
	 * @param shoppingCart
	 * @param cartMessageList
	 */
	public void updateShoppingCart(ShoppingCart shoppingCart, List<OrderMessage> cartMessageList);

}
