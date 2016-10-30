package com.morning.service.impl.order;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.goods.GoodsMapper;
import com.morning.dao.order.OrderMapper;
import com.morning.dao.order.OrderMessageMapper;
import com.morning.entity.PageInfo;
import com.morning.entity.ShoppingCart;
import com.morning.entity.order.Order;
import com.morning.entity.order.OrderMessage;
import com.morning.entity.order.QueryOrder;
import com.morning.service.order.OrderService;


/**
 * @Transactional：注解中属性描述
 * propagation：事务的传播行为
 * isolation：事务的隔离级别
 * readOnly:只读
 * rollbackFor：发生哪些异常回滚
 * noRollbackFor：发生哪些异常不回滚
 */
/**
 * 
 * @description：订单业务层实现
 * @author CXX
 * @version 创建时间：2016年8月29日  下午4:28:36
 */
@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {
	
	private static final Logger logger=Logger.getLogger(OrderServiceImpl.class);
	
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderMessageMapper orderMessageMapper;
	@Autowired
	private GoodsMapper goodsMapper;
	
	@Override
	public int createOrder(Order order) {
		return orderMapper.createOrder(order);
	}
	
	@Override
	public int queryOrderCount(QueryOrder queryOrder) {
		Map<String,Object> parameter = new HashMap<String, Object>();
		parameter.put("queryOrder",queryOrder);
		return orderMapper.queryOrderCount(parameter);
	}
	
	@Override
	public int queryOrderCountBySystem(Integer orderState) {
		return orderMapper.queryOrderCountBySystem(orderState);
	}
	
	@Override
	public Date queryOrderTime(Integer orderState) {
		return orderMapper.queryOrderTime(orderState);
	}
	
	@Override
	public List<Order> queryOrder(QueryOrder queryOrder, PageInfo pageInfo) {
		Map<String,Object> parameter = new HashMap<String, Object>();
		try{
			int totalNumber = queryOrderCount(queryOrder);
			pageInfo.setTotalNumber(totalNumber);
		}catch(Exception e){
			logger.error("OrderServiceImpl.queryOrder", e);
		}
		parameter.put("queryOrder",queryOrder);
		parameter.put("pageInfo",pageInfo);
		return orderMapper.queryOrderByState(parameter);
	}

	@Override
	public Map<String, Object> createOrderAndMessage(Order order,List<OrderMessage> orderMessageList) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		boolean flag = false;
		try{
			// 插入订单，返回订单ID
			this.createOrder(order);
			//插入订单详情
			for(int i = 0; i<orderMessageList.size();i++){
				OrderMessage orderMessage =  orderMessageList.get(i);
				orderMessage.setOrderId(order.getOrderId());
				orderMessageList.set(i, orderMessage);
			}
			orderMessageMapper.createOrderMessage(orderMessageList);
			//更新库存和销量
			for(int i = 0; i<orderMessageList.size();i++){
				OrderMessage orderMessage =  orderMessageList.get(i);
				goodsMapper.updateGoodsCountList(orderMessage);
			}
			flag = true;
		}catch(Exception e){
			logger.error("OrderServiceImpl.createOrderAndMessage", e);
		}
		returnMap.put("flag", flag);
		return returnMap;
	}

	@Override
	public void updateShoppingCart(ShoppingCart shoppingCart,List<OrderMessage> cartMessageList) {
		/**订单总数量*/
		int totalNumber = 0;
		/**订单总价格*/
		double totalMoney = 0;
		for(int i = 0; i<cartMessageList.size();i++){
			OrderMessage cartOrder =  cartMessageList.get(i);
			totalNumber += cartOrder.getOrderNumber();
			totalMoney += cartOrder.getOrderMoney()*cartOrder.getOrderNumber();
		}
		shoppingCart.setTotalMoney(totalMoney);
		shoppingCart.setTotalNumber(totalNumber);
	}

}
