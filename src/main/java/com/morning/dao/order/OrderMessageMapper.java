package com.morning.dao.order;

import java.util.List;

import com.morning.entity.order.OrderMessage;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：OrderMessageMapper   
* 类描述：订单详情数据访问层接口      
* 创建人：陈星星   
* 创建时间：2016年8月30日  上午12:01:28   
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:36:36   
* @version
 */
public interface OrderMessageMapper {
	
	/**
	 * 批量插入订单详情
	 * @param orderMessageList
	 */
	public void createOrderMessage(List<OrderMessage> orderMessageList);
}
