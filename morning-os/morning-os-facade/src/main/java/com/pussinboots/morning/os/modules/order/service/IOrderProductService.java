package com.pussinboots.morning.os.modules.order.service;

import com.pussinboots.morning.os.modules.order.entity.OrderProduct;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IOrderProductService   
* 类描述：OrderProduct表 / 订单明细表 业务逻辑层接口  
* 创建人：陈星星   
* 创建时间：2017年3月28日 下午3:38:56   
*
 */
public interface IOrderProductService extends IService<OrderProduct> {
	
	/**
	 * 根据订单ID查找订单详情
	 * @param orderId 订单ID
	 * @return
	 */
	List<OrderProduct> selectByOrderId(Long orderId);
	
}
