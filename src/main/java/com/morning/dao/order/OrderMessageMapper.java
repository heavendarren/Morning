package com.morning.dao.order;

import java.util.List;

import com.morning.entity.order.OrderMessage;

/**
 * 
 * @description：订单详情持久层接口
 * @author CXX
 * @version 创建时间：2016年8月30日  上午12:01:28
 */
public interface OrderMessageMapper {
	
	/**
	 * 批量插入订单详情
	 * @param orderMessageList
	 */
	public void createOrderMessage(List<OrderMessage> orderMessageList);
}
