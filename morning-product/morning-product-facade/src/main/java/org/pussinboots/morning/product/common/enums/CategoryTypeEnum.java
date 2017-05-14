package org.pussinboots.morning.product.common.enums;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：CategoryTypeEnum   
* 类描述：CategoryTypeEnum 类型枚举表述常量数据字段        
* 创建人：陈星星   
* 创建时间：2017年4月12日 下午5:48:28   
*
 */
public enum CategoryTypeEnum {

	FIRST_CATEGORY(1, "一级目录"), 
	SECOND_CATEGORY(2, "二级目录"), 
	ALL_CATEGORY(0, "总目录");

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
