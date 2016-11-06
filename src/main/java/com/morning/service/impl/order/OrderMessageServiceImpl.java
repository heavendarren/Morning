package com.morning.service.impl.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.order.OrderMessageMapper;
import com.morning.entity.order.OrderMessage;
import com.morning.service.order.OrderMessageService;

/**
 * 
 * @description：订单详情业务层实现
 * @author CXX
 * @version 创建时间：2016年8月30日  上午12:13:51
 */
@Service("orderMessageService")
public class OrderMessageServiceImpl implements OrderMessageService {

	@Autowired
	private OrderMessageMapper  orderMessageMapper;
	
	@Override
	public void createOrderMessage(List<OrderMessage> orderMessageList) {
		orderMessageMapper.createOrderMessage(orderMessageList);
	}

	@Override
	public void updateShoppingCartList(List<OrderMessage> cartMessageList,OrderMessage orderMessage) {
		//判断购物车是否已存在商品
		boolean flag = true;
		for(int i = 0; i<cartMessageList.size();i++){
			OrderMessage cartOrder =  cartMessageList.get(i);
			if(orderMessage.getGoodsId().equals(cartOrder.getGoodsId())
					&&orderMessage.getGoodsColor().equals(cartOrder.getGoodsColor())
					&&orderMessage.getGoodsStandard().equals(cartOrder.getGoodsStandard())
					){
				//&&orderMessage.getPublicType().equals(cartOrder.getPublicType())
				int orderNumber = cartOrder.getOrderNumber()+ orderMessage.getOrderNumber();
				cartOrder.setOrderNumber(orderNumber);
				cartMessageList.set(i, cartOrder);
				flag = false;
			}
		}
		if(flag){
			orderMessage.setCartId(cartMessageList.size()+1);
			cartMessageList.add(orderMessage);
		}
	}

}
