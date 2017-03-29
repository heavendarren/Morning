package com.pussinboots.morning.os.common.enums;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：CommonConstantEnum   
* 类描述：CommonConstantEnum 公共参数枚举表述常量数据字段         
* 创建人：陈星星   
* 创建时间：2017年3月4日 上午5:31:24   
*
 */
public enum CommonConstantEnum {
	
	/** 明星产品显示数量 */
	STAR_PRODUCT_NUMBER(10, "明星产品显示数量"),
	
	/** 首页默认显示产品数量 */
	DEFAULT_PRODUCT_NUMBER(8, "首页默认显示产品数量"),
	
	/** 分类页面每页显示记录数 */
	CATEGORY_PRODUCT_NUMBER(12, "分类页面每页显示记录数"),
	
	/** 类目广告显示数量 */
	CATEGORY_ADVERT_NUMBER(2, "类目广告显示数量"),
	
	/** 商品最新评价显示数量*/
	NEW_COMMENT_NUMBER(10, "商品最新评价显示数量"),
	
	/** 商品有帮助评价显示数量 */
	HIGH_COMMENT_NUMBER(5, "商品有帮助评价显示数量"),
	
	/** 商品详情页显示图片数量 */
	ITEM_PRODUCT_NUMBER(5, "商品详情页显示图片数量"),
	
	/** 商品详情页显示提问数量 */
	QUESTION_NUMBER(6, "商品详情页显示提问数量"),
	
	/** 商品评论页每页显示评论数 */
	COMMENT_PAGE_NUMBER(10, "商品评论页每页显示评论数"),
	
	/** 商品提问页每页显示评论数 */
	QUESTION_PAGE_NUMBER(10, "商品提问页每页显示评论数"),
	
	/** 商品提问页每页显示评论数 */
	FAVORITE_NUMBER(12, "商品提问页每页显示评论数"),
	
	/** 我的订单每页显示订单数 */
	ORDER_NUMBER(8, "我的订单每页显示订单数");
	
	private Integer value;
	
	private String valueInfo;

	private CommonConstantEnum(Integer value, String valueInfo) {
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
