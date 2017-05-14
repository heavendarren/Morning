package org.pussinboots.morning.order.service;

import java.util.List;

import org.pussinboots.morning.order.entity.OrderProduct;
import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-order-facade   
* 类名称：IOrderProductService   
* 类描述：OrderProduct / 订单明细表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年5月10日 上午10:30:45   
*
 */
public interface IOrderProductService extends IService<OrderProduct> {
	
	/**
	 * 根据订单ID查找订单详情
	 * @param orderId 订单ID
	 * @return
	 */
	List<OrderProduct> listByOrderId(Long orderId);
	
}
