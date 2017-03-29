package com.pussinboots.morning.os.modules.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.order.entity.Order;
import com.pussinboots.morning.os.modules.order.vo.OrderVO;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：OrderMapper   
* 类描述：Order表 / 订单表 数据访问层接口   
* 创建人：陈星星   
* 创建时间：2017年3月28日 下午3:41:36   
*
 */
public interface OrderMapper extends BaseMapper<Order> {
	
	/**
	 * 根据用户ID、订单状态列表、分页信息、搜索内容查找订单列表
	 * @param userId 用户ID
	 * @param typeValue 订单状态列表
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @return
	 */
	List<OrderVO> selectOrderVO(@Param("userId") Long userId, @Param("typeValue") String typeValue,
			@Param("pageInfo") PageInfo pageInfo, @Param("search") String search);
	
	/**
	 * 根据用户ID、订单状态列表、分页信息、搜索内容查找订单总记录数
	 * @param userId 用户ID
	 * @param typeValue 订单状态列表
	 * @param search 搜索内容
	 * @return
	 */
	Integer selectOrderVOCount(@Param("userId") Long userId, @Param("typeValue") String typeValue,
			@Param("search") String search);
}