package org.pussinboots.morning.product.common.enums;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：ProductSortEnum   
* 类描述：ProductSortEnum  产品排序方式枚举表述常量数据字段        
* 创建人：陈星星   
* 创建时间：2017年4月13日 下午1:31:47   
*
 */
public enum ProductSortEnum {
	
	/** 推荐 */
	RECOMMEND(0, "推荐", "商品平均评价分", "comment_average", "DESC"),

	/** 新品 */
	NEW(1, "新品", "商品上架时间", "shelve_time" , "DESC"),
	
	/** 销量 */
	SALES(2, "新品", "商品销售数量", "sales_volume", "DESC"),
	
	/** 评论最多 */
	COMMENT(3, "评论最多", "商品评论数量", "comment_number", "DESC"),
	
	/** 价格正序 */
	SALES_ASC(6, "价格", "商品价格正序", "show_price", "ASC"),
	
	/** 价格倒序 */
	SALES_DESC(7, "价格", "商品价格倒序", "show_price", "DESC");
	
	private Integer type;
	
	private String typeInfo;
	
	private String typeMessage;
	
	private String sort;
	
	private String order;
	
	private ProductSortEnum(Integer type, String typeInfo, String typeMessage, String sort, String order) {
		this.type = type;
		this.typeInfo = typeInfo;
		this.typeMessage = typeMessage;
		this.sort = sort;
		this.order = order;
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
	
	public String getSort() {
		return sort;
	}

	public String getOrder() {
		return order;
	}

	public static ProductSortEnum typeOf(int index) {
		for (ProductSortEnum sortEnum : values()) {
			if (sortEnum.getType() == index) {
				return sortEnum;
			}
		}
		return RECOMMEND;
	}
}
