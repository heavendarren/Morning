package com.morning.service.order;

import java.util.List;

import com.morning.entity.order.OrderMessage;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：OrderMessageService   
* 类描述：订单详情业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年11月6日 下午11:03:28   
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午11:03:28   
* @version
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
