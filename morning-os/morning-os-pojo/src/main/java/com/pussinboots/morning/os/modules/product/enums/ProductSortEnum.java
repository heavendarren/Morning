package com.pussinboots.morning.os.modules.product.enums;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：ProductSortEnum   
* 类描述：ProductSortEnum  产品排序方式枚举表述常量数据字段     
* 创建人：陈星星   
* 创建时间：2017年3月2日 上午3:02:29   
*
 */
public enum ProductSortEnum {
	
	/** 推荐 */
	RECOMMEND(0, "推荐", "商品平均评价分"),

	/** 新品 */
	New(1, "新品", "商品上架时间"),
	
	/** 销量 */
	SALES(2, "新品", "商品销售数量"),
	
	/** 评论最多 */
	COMMENT(3, "评论最多", "商品评论数量"),
	
	/** 价格正序 */
	SALES_ASC(6, "价格", "商品价格正序"),
	
	/** 价格倒序 */
	SALES_DESC(7, "价格", "商品价格倒序");
	
	private Integer type;
	
	private String typeInfo;
	
	private String typeMessage;
	
	private ProductSortEnum(Integer type, String typeInfo, String typeMessage) {
		this.type = type;
		this.typeInfo = typeInfo;
		this.typeMessage = typeMessage;
	}

	public Integer getType() {
		return type;
	}

	public String getTypeInfo() {
		return typeInfo;
	}

	public String getTypeMessage() {
		return typeMessage;
	}

	public static ProductSortEnum stateOf(int index) {
		for (ProductSortEnum sortEnum : values()) {
			if (sortEnum.getType() == index) {
				return sortEnum;
			}
		}
		return null;
	}

}
