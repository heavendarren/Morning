package com.pussinboots.morning.os.modules.order.dto;

import java.io.Serializable;
import java.util.List;

import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.order.vo.OrderVO;

public class OrderPageDTO implements Serializable{
	
	private static final long serialVersionUID = 1L;

	/**
	 * 订单列表
	 */
	private List<OrderVO> orderVOs;
	
	/**
	 * 分页信息
	 */
	private PageInfo pageInfo;
	
	public OrderPageDTO() {
		super();
	}

	public OrderPageDTO(List<OrderVO> orderVOs, PageInfo pageInfo) {
		super();
		this.orderVOs = orderVOs;
		this.pageInfo = pageInfo;
	}

	public List<OrderVO> getOrderVOs() {
		return orderVOs;
	}

	public void setOrderVOs(List<OrderVO> orderVOs) {
		this.orderVOs = orderVOs;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
	
}
