package com.pussinboots.morning.os.modules.order.service;

import com.pussinboots.morning.os.modules.order.entity.OrderShipment;
import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IOrderShipmentService   
* 类描述：OrderShipment表 / 订单配送表 业务逻辑层接口     
* 创建人：陈星星   
* 创建时间：2017年3月28日 下午3:39:49   
*
 */
public interface IOrderShipmentService extends IService<OrderShipment> {
	
	/**
	 * 根据订单ID查找订单配送信息
	 * @param orderId 订单ID
	 * @return
	 */
	OrderShipment selectByOrderId(Long orderId);
	
}
