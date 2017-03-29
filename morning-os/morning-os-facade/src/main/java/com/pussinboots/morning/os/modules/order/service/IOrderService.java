package com.pussinboots.morning.os.modules.order.service;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.order.dto.OrderPageDTO;
import com.pussinboots.morning.os.modules.order.entity.Order;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IOrderService   
* 类描述：Order表 / 订单表 业务逻辑层接口  
* 创建人：陈星星   
* 创建时间：2017年3月28日 下午3:38:56   
*
 */
public interface IOrderService extends IService<Order> {
	
	/**
	 * 根据订单信息创建订单
	 * @param order 订单信息
	 * @param addressId 地址ID
	 * @param userId 用户ID	 
	 * @return
	 */
	Long insertOrder(Order order , Long addressId, Long userId);
	
	/**
	 * 根据订单编号,用户ID,订单状态查找订单信息
	 * @param orderNumber 订单编号
	 * @param userId 用户ID
	 * @param orderStatus 订单状态
	 * @return
	 */
	Order selectByOrderNumber(Long orderNumber, Long userId, Integer orderStatus);
	
	/**
	 * 根据用户ID、订单状态列表、分页信息、搜索内容查找订单列表
	 * @param userId 用户ID
	 * @param typeValue 订单状态列表
	 * @param pageInfo 订单状态列表
	 * @param search 搜索内容
	 * @return OrderPageDTO
	 */
	OrderPageDTO selectOrderVO(Long userId, String typeValue, PageInfo pageInfo, String search);
	
}
