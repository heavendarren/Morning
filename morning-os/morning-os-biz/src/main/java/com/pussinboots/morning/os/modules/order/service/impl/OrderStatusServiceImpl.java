package com.pussinboots.morning.os.modules.order.service.impl;

import com.pussinboots.morning.os.modules.order.entity.OrderStatus;
import com.pussinboots.morning.os.modules.order.mapper.OrderStatusMapper;
import com.pussinboots.morning.os.modules.order.service.IOrderStatusService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：OrderStatusServiceImpl   
* 类描述：OrderStatus表 / 订单状态表 业务逻辑层接口实现      
* 创建人：陈星星   
* 创建时间：2017年3月28日 下午3:44:26   
*
 */
@Service
public class OrderStatusServiceImpl extends ServiceImpl<OrderStatusMapper, OrderStatus> implements IOrderStatusService {
	
}
