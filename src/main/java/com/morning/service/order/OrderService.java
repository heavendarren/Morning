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
* 项目名称：morning Maven Webapp   
* 类名称：OrderService   
* 类描述：订单业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年8月23日  上午12:16:56  
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午11:03:42   
* @version
 */
public interface OrderService {
	
	/**
	 * 创建新订单
	 * @param order
	 * @return
	 */
	public int createOrder(Order order);
	
	/**
	 * 支付，更新订单状态
	 * @param order  订单
	 * @param payment 支付平台
	 * @param payStatus 支付状态
	 * @param orderState 订单状态
	 */
	public void updateOrder(Order order, String payment, Integer payStatus, Integer orderState);
	
	/**
	 * 通过订单编号，查询订单
	 * @param orderNumber 订单编号
	 * @param accountId  账号ID
	 * @param orderState 订单状态
	 * @return
	 */
	public Order queryOrderByNumber(String orderNumber, Integer accountId, Integer orderState);

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
	 * @param shoppingCart 购物车信息
	 * @param order 订单信息
	 * @param orderMessageList
	 * @return
	 */
	public Map<String, Object> createOrderAndMessage(ShoppingCart shoppingCart, Order order, List<OrderMessage> orderMessageList);
	
	/**
	 * 更新购物车商品数量和价钱
	 * @param shoppingCart
	 * @param cartMessageList
	 */
	public void updateShoppingCart(ShoppingCart shoppingCart, List<OrderMessage> cartMessageList);

}
