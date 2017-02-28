package com.pussinboots.morning.os.modules.product.enums;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：CategoryInIndexEnum   
* 类描述：CategoryInIndexEnum 类目显示主页枚举表述常量数据字段      
* 创建人：陈星星   
* 创建时间：2017年2月4日 下午11:02:04
 */
public enum CategoryInIndexEnum {

	HIDE(0, "隐藏"), 
	SHOW_PRODUCT_AREA(1, "主产品区"), 
	SHOW_CATEGORY_AREA(2, "分栏产品区");
	
	private Integer type;

	private String typeInfo;

	private CategoryInIndexEnum(Integer type, String typeInfo) {
		this.type = type;
		this.typeInfo = typeInfo;
	}

	public Integer getType() {
		return type;
	}

	public String getTypeInfo() {
		return typeInfo;
	}

	public static CategoryInIndexEnum stateOf(Integer index) {
		for (CategoryInIndexEnum typeEnum : values()) {
			if (typeEnum.getType() == index) {
				return typeEnum;
			}
		}
		return null;
	}
}
