package org.pussinboots.morning.product.common.enums;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：CategoryRecommendTypeEnum   
* 类描述：CategoryRecommendTypeEnum  推荐分类类型枚举表述常量数据字段         
* 创建人：陈星星   
* 创建时间：2017年4月11日 下午3:50:04   
*
 */
public enum CategoryRecommendTypeEnum {
	
	/** 是否置顶 */
	SHOW_IN_TOP(1, "是"),
	HIDE_IN_top(0,"否"),

	/** 是否导航栏*/
	SHOW_IN_NAV(1, "是"),
	HIDE_IN_NAV(0, "否"),
	
	/** 是否热门 */
	SHOW_IN_HOT(1, "是"),
	HIDE_IN_HOT(0, "否");
	
	private Integer type;

	private String typeInfo;
	
	private CategoryRecommendTypeEnum(Integer type, String typeInfo) {
		this.type = type;
		this.typeInfo = typeInfo;
	}

	public Integer getType() {
		return type;
	}

	public String getTypeInfo() {
		return typeInfo;
	}
}
