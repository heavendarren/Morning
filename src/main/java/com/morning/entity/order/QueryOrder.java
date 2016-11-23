package com.morning.entity.order;

import java.io.Serializable;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：QueryOrder   
* 类描述：订单查询条件实体类   
* 创建人：陈星星   
* 创建时间：2016年11月6日 下午10:53:20   
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:53:20   
* @version
 */
public class QueryOrder implements Serializable{
	
	private static final long serialVersionUID = -4092172938320503826L;
	
	/** 用户ID */
	private Integer accountId;

	/** 订单状态 */
	private Integer orderState;

	/** 订单搜索 */
	private String orderSearch;
	
	public Integer getAccountId() {
		return accountId;
	}
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}
	public Integer getOrderState() {
		return orderState;
	}
	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}
	public String getOrderSearch() {
		return orderSearch;
	}
	public void setOrderSearch(String orderSearch) {
		this.orderSearch = orderSearch;
	}
}
