package org.pussinboots.morning.product.common.constant;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：CategoryConstantEnum   
* 类描述：CategoryConstantEnum 类目参数枚举表述常量数据字段            
* 创建人：陈星星   
* 创建时间：2017年4月12日 下午5:11:04   
*
 */
public enum CategoryConstantEnum {
	
	/** 分类推荐显示产品数量 */
	CATEGORY_RECOMMEND_PRODUCT(8, "分类推荐显示产品数量"),
	
	/** 分类推荐显示广告数量 */
	CATEGORY_RECOMMEND_ADVERT(2, "类目广告显示数量"),
	
	/** 分类导航显示产品数量 */
	CATEGORY_NAV_PRODUCT(24, "分类推荐显示产品数量"),
	
	/** 导航栏分类显示数量 */
	CATEGORY_NAV_NUMBER(10, "导航栏分类显示数量");
	
	private Integer value;
	
	private String valueInfo;

	private CategoryConstantEnum(Integer value, String valueInfo) {
		this.value = value;
		this.valueInfo = valueInfo;
	}

	public Integer getValue() {
		return value;
	}

	public String getValueInfo() {
		return valueInfo;
	}

}
