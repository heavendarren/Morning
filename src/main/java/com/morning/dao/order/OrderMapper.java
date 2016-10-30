package com.morning.dao.order;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.morning.entity.order.Order;

/**
 * 
 * @description：订单持久层接口
 * @author CXX
 * @version 创建时间：2016年8月23日  上午12:13:16
 */
public interface OrderMapper {
	
	/**
	 * 创建新订单
	 * @param order
	 * @return
	 */
	public int createOrder(Order order);
	
	/**
	 * 查询商品数量
	 * @param parameter QueryGoods查询条件
	 * @return
	 */
	public int queryOrderCount(Map<String,Object> parameter);
	
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
	 * 查询订单，通过订单状态 
	 * @param parameter  
	 * @return
	 */
	public List<Order> queryOrderByState(Map<String, Object> parameter);
}