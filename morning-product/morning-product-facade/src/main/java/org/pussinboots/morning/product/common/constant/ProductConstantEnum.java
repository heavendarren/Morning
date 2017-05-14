package org.pussinboots.morning.product.common.constant;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：ProductConstantEnum   
* 类描述：ProductConstantEnum 产品参数枚举表述常量数据字段            
* 创建人：陈星星   
* 创建时间：2017年4月12日 下午5:11:04   
*
 */
public enum ProductConstantEnum {
	
	/** 分类页面每页显示记录数 */
	//CATEGORY_PRODUCT_NUMBER(12, "分类页面每页显示记录数"),
	
	/** 商品详情展示图片数量 */
	PRODUCT_PICIMG_NUMBER(6, "商品详情展示图片数量");
	
	private Integer value;
	
	private String valueInfo;

	private ProductConstantEnum(Integer value, String valueInfo) {
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
