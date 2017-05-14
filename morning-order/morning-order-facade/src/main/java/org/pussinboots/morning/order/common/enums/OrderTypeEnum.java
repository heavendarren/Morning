package org.pussinboots.morning.order.common.enums;

/**
 * 
* 项目名称：morning-order-facade   
* 类名称：OrderTypeEnum   
* 类描述：OrderStatusEnum 订单类型枚举表述常量数据字段      
* 创建人：陈星星   
* 创建时间：2017年5月10日 上午10:39:44   
*
 */
public enum OrderTypeEnum {

	ALL_VALID(0, "1,2,3,4,5,6", "全部有效订单"), 
	TO_BE_PAID(1, "1", "待支付"), 
	WAIT_FOR_RECEIVING(2, "3,4,5", "待收货"), 
	CLOSE(3, "11,12", "已关闭"),
	ALL_ORDER(4,"1,2,3,4,5,6,11,12","全部订单");
	
	private Integer type;
	
	private String typeValue;

	private String typeInfo;

	private OrderTypeEnum(Integer type, String typeValue, String typeInfo) {
		this.type = type;
		this.typeValue = typeValue;
		this.typeInfo = typeInfo;
	}

	public Integer getType() {
		return type;
	}

	public String getTypeValue() {
		return typeValue;
	}

	public String getTypeInfo() {
		return typeInfo;
	}

	public static OrderTypeEnum typeOf(Integer index) {
		for (OrderTypeEnum statusEnum : values()) {
			if (statusEnum.getType() == index) {
				return statusEnum;
			}
		}
		return ALL_VALID;
	}
}
