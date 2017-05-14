package org.pussinboots.morning.order.service;

import java.util.List;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.order.entity.Order;
import org.pussinboots.morning.order.entity.OrderShipment;
import org.pussinboots.morning.order.pojo.vo.OrderShoppingCartVO;
import org.pussinboots.morning.order.pojo.vo.OrderVO;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-order-facade   
* 类名称：IOrderService   
* 类描述：Order / 订单表 业务逻辑层接口      
* 创建人：陈星星   
* 创建时间：2017年5月10日 上午10:31:08   
*
 */
public interface IOrderService extends IService<Order> {
	
	/**
	 * 根据订单信息创建订单
	 * @param order 订单信息
	 * @param orderShipment 订单配送信息
	 * @param shoppingCartVOs 购物车商品列表 
	 * @param userId 用户ID
	 * @return
	 */
	Long insertOrder(Order order, OrderShipment orderShipment, List<OrderShoppingCartVO> shoppingCartVOs, Long userId);
	
	/**
	 * 根据用户ID、订单状态列表、分页信息、搜索内容查找订单列表
	 * @param userId 用户ID
	 * @param pageInfo 分页信息
	 * @param typeValue 订单状态列表
	 * @param search 搜索内容
	 * @return
	 */
	BasePageDTO<OrderVO> list(Long userId, PageInfo pageInfo, String typeValue, String search);
	
	/**
	 * 根据用户ID、订单编号查找订单信息
	 * @param userId 用户ID
	 * @param orderNumber 订单编号
	 * @return
	 */
	OrderVO getOrder(Long userId, Long orderNumber);
	
	/**
	 * 根据订单编号,用户ID,订单状态查找订单信息
	 * @param orderNumber 订单编号
	 * @param userId 用户ID
	 * @param orderStatus 订单状态
	 * @return
	 */
	Order getByOrderNumber(Long orderNumber, Long userId, Integer status);
	
	/**
	 * 根据订单编号,用户ID取消订单
	 * @param orderNumber 订单编号
	 * @param userId 用户ID
	 * @return
	 */
	Integer updateCancelOrder(Long orderNumber, Long userId);
	
	/**
	 * 根据订单编号,用户ID,送货时间类型修改送货时间
	 * @param orderNumber  订单编号
	 * @param shipmentTime 送货时间
	 * @param userId 用户ID
	 * @return
	 */
	Integer updateShipmentTime(Long orderNumber, Integer shipmentTime, Long userId);
}
