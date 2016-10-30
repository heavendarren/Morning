package com.morning.entity.order;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class QueryOrder implements Serializable{
	
	private static final long serialVersionUID = -4092172938320503826L;
	
	/**用户ID*/
	private Integer accountId;
	/**订单状态*/
	private Integer orderState;
	/**订单搜索*/
	private String orderSearch;
}
