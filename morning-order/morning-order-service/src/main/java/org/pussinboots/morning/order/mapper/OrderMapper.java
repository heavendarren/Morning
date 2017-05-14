package org.pussinboots.morning.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.order.entity.Order;
import org.pussinboots.morning.order.pojo.vo.OrderVO;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-order-service   
* 类名称：OrderMapper   
* 类描述：Order / 订单表 数据访问层接口   
* 创建人：陈星星   
* 创建时间：2017年5月10日 上午10:33:13   
*
 */
public interface OrderMapper extends BaseMapper<Order> {
	
	/**
	 * 根据用户ID、订单状态列表、分页信息、搜索内容查找订单总记录数
	 * @param userId 用户ID
	 * @param typeValue 订单状态列表
	 * @param search 搜索内容
	 * @return
	 */
	Integer getCount(@Param("userId") Long userId, @Param("typeValue") String typeValue,
			@Param("search") String search);
	
	/**
	 * 根据用户ID、订单状态列表、分页信息、搜索内容查找订单列表
	 * @param userId 用户ID
	 * @param typeValue 订单状态列表
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @return
	 */
	List<OrderVO> list(@Param("userId") Long userId, @Param("typeValue") String typeValue,
			@Param("pageInfo") PageInfo pageInfo, @Param("search") String search);
	
	/**
	 * 根据用户ID、订单编号查找订单信息
	 * @param userId 用户ID
	 * @param orderNumber 订单编号
	 * @return
	 */
	OrderVO getOrder(@Param("userId") Long userId, @Param("orderNumber") Long orderNumber);
}