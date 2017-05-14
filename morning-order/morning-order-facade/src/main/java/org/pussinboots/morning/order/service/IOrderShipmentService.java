package org.pussinboots.morning.order.service;

import org.pussinboots.morning.order.entity.OrderShipment;
import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-order-facade   
* 类名称：IOrderShipmentService   
* 类描述：OrderShipment / 订单配送表 业务逻辑层接口    
* 创建人：陈星星   
* 创建时间：2017年5月10日 上午10:31:24   
*
 */
public interface IOrderShipmentService extends IService<OrderShipment> {
	
	/**
	 * 根据订单ID查找订单配送信息
	 * @param orderId 订单ID
	 * @return
	 */	
	OrderShipment getByOrderId(Long orderId);
	
	/**
	 * 更新订单配送信息
	 * @param orderShipment 订单配送信息
	 * @param userId 用户ID
	 * @return
	 */
	Integer update(OrderShipment orderShipment, Long userId);
	
}
