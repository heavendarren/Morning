package com.morning.service.order;

import java.util.List;

import com.morning.entity.order.OrderMessage;

/**
 * 
 * @description：订单详情业务层接口
 * @author CXX
 * @version 创建时间：2016年8月30日  上午12:12:58
 */
public interface OrderMessageService {
	
	/**
	 * 批量插入订单详情
	 * @param orderMessageList
	 */
	public void createOrderMessage(List<OrderMessage> orderMessageList);
	
	/**
	 * 更新购物车列表，判断商品是否存在
	 * @param orderMessageList
	 * @param orderMessage
	 */
	public void updateShoppingCartList(List<OrderMessage> cartMessageList, OrderMessage orderMessage);
}
