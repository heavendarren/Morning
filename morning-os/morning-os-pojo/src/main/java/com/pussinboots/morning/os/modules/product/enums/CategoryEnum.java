package com.pussinboots.morning.os.modules.product.enums;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：CategoryTypeEnum   
* 类描述：CategoryTypeEnum 产品目录枚举表述常量数据字段      
* 创建人：陈星星   
* 创建时间：2017年2月4日 下午11:02:04
 */
public enum CategoryEnum {

	MOBILE_PHONE(2L, "手机"), 
	SMART_HARDWARE(3L, "智能硬件"), 
	HARDWARE_ACCESSORIES (6L, "周边配件"), 
	LIFE_PERIPHERY(9L, "生活周边");

	private Long type;

	private String typeInfo;

	private CategoryEnum(Long type, String typeInfo) {
		this.type = type;
		this.typeInfo = typeInfo;
	}

	public Long getType() {
		return type;
	}

	public String getTypeInfo() {
		return typeInfo;
	}

	public static CategoryEnum stateOf(Long index) {
		for (CategoryEnum typeEnum : values()) {
			if (typeEnum.getType() == index) {
				return typeEnum;
			}
		}
		return null;
	}
}
