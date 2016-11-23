package com.morning.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.morning.entity.order.OrderMessage;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：ShoppingCart   
* 类描述：购物车实体类   
* 创建人：陈星星   
* 创建时间：2016年11月6日 下午10:41:15   
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:41:15   
* @version
 */
public class ShoppingCart implements Serializable {

	private static final long serialVersionUID = -7276470537380076596L;

	/** 订单总数量 */
	private Integer totalNumber;
	
	/** 订单总价格 */
	private Double totalMoney;
	
	/** 购物车订单 */
	private List<OrderMessage> cartMessageList;
	
	public ShoppingCart(){
		cartMessageList = new ArrayList<>();
	}

	public Integer getTotalNumber() {
		return totalNumber;
	}

	public void setTotalNumber(Integer totalNumber) {
		this.totalNumber = totalNumber;
	}

	public Double getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}

	public List<OrderMessage> getCartMessageList() {
		return cartMessageList;
	}

	public void setCartMessageList(List<OrderMessage> cartMessageList) {
		this.cartMessageList = cartMessageList;
	}
	
}
