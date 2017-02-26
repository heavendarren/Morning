package com.pussinboots.morning.os.modules.product.enums;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：CategoryTypeEnum   
* 类描述：CategoryTypeEnum 目录类型枚举表述常量数据字段      
* 创建人：陈星星   
* 创建时间：2017年2月4日 下午11:02:04
 */
public enum CategoryTypeEnum {

	FIRST_CATEGORY(1, "一级目录"), 
	SECOND_CATEGORY(2, "二级目录"), 
	THIRD_CATEGORY(3, "三级目录"), 
	ALL_CATEGORY(0, "操作目录");

	private Integer type;

	private String typeInfo;
    
	private CategoryTypeEnum(Integer type, String typeInfo) {
		this.type = type;
		this.typeInfo = typeInfo;
	}

	public Integer getType() {
		return type;
	}

	public String getTypeInfo() {
		return typeInfo;
	}

	public static CategoryTypeEnum stateOf(int index) {
		for (CategoryTypeEnum typeEnum : values()) {
			if (typeEnum.getType() == index) {
				return typeEnum;
			}
		}
		return null;
	}
}
