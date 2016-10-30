package com.morning.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.morning.entity.order.OrderMessage;

/**
 * 
 * @description：购物车实体类
 * @author CXX
 * @version 创建时间：2016年8月29日  下午2:42:24
 */
@Data
public class ShoppingCart implements Serializable {

	private static final long serialVersionUID = -7276470537380076596L;

	/**订单总数量*/
	private Integer totalNumber;
	/**订单总价格*/
	private Double totalMoney;
	/**购物车订单*/
	private List<OrderMessage> cartMessageList;
	
	public ShoppingCart(){
		cartMessageList = new ArrayList<OrderMessage>();
	}

}
