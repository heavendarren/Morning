package org.pussinboots.morning.order.common.enums;

/**
 * 
* 项目名称：morning-order-facade   
* 类名称：OrderStatusEnum   
* 类描述：OrderStatusEnum 订单状态枚举表述常量数据字段      
* 创建人：陈星星   
* 创建时间：2017年5月10日 上午10:40:21   
*
 */
public enum OrderStatusEnum {

	SUBMIT_ORDERS(1, "订单提交"), 
	PAY_TO_COMPLETE(2, "支付完成"), 
	PICKING(3, "拣取配货"),
	OUTBOUND_GOODS(4, "商品出库"), 
	WAITS_FOR_DELIVERY(5,"等待收货"), 
	TAKE_DELIVERY(6, "确认收货"),
	
	AUTOMATICALLY_CANCEL_THE_ORDER(11, "自动取消订单"), 
	MANUALLY_CANCEL_THE_ORDER(12, "手动取消订单");
	
	private Integer status;

	private String stateInfo;

	private OrderStatusEnum(Integer status, String stateInfo) {
			this.status = status;
			this.stateInfo = stateInfo;
	}

	public Integer getStatus() {
		return status;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public static OrderStatusEnum stateOf(int index) {
		for (OrderStatusEnum statusEnum : values()) {
			if (statusEnum.getStatus() == index) {
				return statusEnum;
			}
		}
		return null;
	}
}
