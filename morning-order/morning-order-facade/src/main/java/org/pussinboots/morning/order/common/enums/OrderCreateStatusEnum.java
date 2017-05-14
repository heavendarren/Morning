package org.pussinboots.morning.order.common.enums;

/**
 * 
* 项目名称：morning-order-facade   
* 类名称：OrderCreateStatusEnum   
* 类描述：OrderCreateStatusEnum 订单操作类型枚举表述常量数据字段      
* 创建人：陈星星   
* 创建时间：2017年5月11日 上午12:14:53   
*
 */
public enum OrderCreateStatusEnum {

	MEMBER(0, "会员"), 
	ADMINISTRATOR(1, "管理员"),
	EXCEPTION_NOTIFICATION(2, "管理员");
	
	private Integer status;

	private String stateInfo;

	private OrderCreateStatusEnum(Integer status, String stateInfo) {
			this.status = status;
			this.stateInfo = stateInfo;
	}

	public Integer getStatus() {
		return status;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public static OrderCreateStatusEnum stateOf(int index) {
		for (OrderCreateStatusEnum statusEnum : values()) {
			if (statusEnum.getStatus() == index) {
				return statusEnum;
			}
		}
		return null;
	}
}
