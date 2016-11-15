package com.morning.service.impl.order;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.morning.common.util.ServletUtils;
import com.morning.common.util.SingletonLoginUtils;
import com.morning.dao.order.OrderMapper;
import com.morning.dao.order.OrderMessageMapper;
import com.morning.entity.PageInfo;
import com.morning.entity.ShoppingCart;
import com.morning.entity.order.Order;
import com.morning.entity.order.OrderMessage;
import com.morning.entity.order.QueryOrder;
import com.morning.service.goods.GoodsService;
import com.morning.service.order.OrderLogService;
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
* 项目名称：morning Maven Webapp   
* 类名称：OrderServiceImpl   
* 类描述：订单业务逻辑层实现   
* 创建人：陈星星   
* 创建时间：2016年8月29日  下午4:28:36
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午11:00:06   
* @version
 */
@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);	
	
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderMessageMapper orderMessageMapper;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private OrderLogService orderLogService;
	
	@Override
	public int createOrder(Order order) {
		return orderMapper.createOrder(order);
	}
	
	@Override
	public void updateOrder(Order order, String payment, Integer payStatus, Integer orderState) {
		order.setPayment(payment);
		order.setPayStatus(payStatus);
		order.setOrderState(orderState);
		orderMapper.updateOrder(order);
		//创建订单日志
		orderLogService.createOrderLog(String.valueOf(orderState), String.valueOf(order.getAccountId()), "w" , order.getOrderId(), order.getOrderNumber());
	}
	
	@Override
	public Order queryOrderByNumber(String orderNumber, Integer accountId, Integer orderState) {
		Map<String,Object> parameter = new HashMap<String, Object>();
		parameter.put("orderNumber", orderNumber);
		parameter.put("accountId", accountId);
		parameter.put("orderState", orderState);
		return orderMapper.queryOrderByNumber(parameter);
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
	public Map<String, Object> createOrderAndMessage(ShoppingCart shoppingCart, Order order, List<OrderMessage> orderMessageList) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		boolean flag = false;
		try{
    		int accountId = SingletonLoginUtils.getLoginUserId(ServletUtils.getRequest());
    		order.setAccountId(accountId);//用户ID
    		String orderNumber = Long.toString(new Date().getTime()+(new Random().nextInt(9999-1000+1)+1000));
    		order.setOrderNumber(orderNumber);//订单编号
    		order.setTotalMoney(shoppingCart.getTotalMoney());//订单金额
    		order.setOrderDate(new Date());
			// 插入订单，返回订单ID
			this.createOrder(order);
			
			//创建订单日志
			orderLogService.createOrderLog("1", String.valueOf(order.getAccountId()), "w" , order.getOrderId(), order.getOrderNumber());
			
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
				goodsService.updateGoodsCountList(orderMessage);
			}
			flag = true;
			returnMap.put("flag", flag);
			returnMap.put("orderNumber", order.getOrderNumber());
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
