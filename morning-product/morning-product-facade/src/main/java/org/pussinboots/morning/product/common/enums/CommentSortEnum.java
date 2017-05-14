package org.pussinboots.morning.product.common.enums;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：CommentSortEnum   
* 类描述：CommentSortEnum  商品评论排序方式枚举表述常量数据字段           
* 创建人：陈星星   
* 创建时间：2017年4月25日 下午7:05:08   
*
 */
public enum CommentSortEnum {
	
	/** 最新的评价 */
	NEWEST(0, "最新的评价", "create_time", "DESC"),
	
	/** 最有帮助的评价 */
	HELP(1, "最有帮助的评价", "good_count", "DESC");
	
	private Integer type;
	
	private String typeMessage;
	
	private String sort;
	
	private String order;

	private CommentSortEnum(Integer type, String typeMessage, String sort, String order) {
		this.type = type;
		this.typeMessage = typeMessage;
		this.sort = sort;
		this.order = order;
	}

	public Integer getType() {
		return type;
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
	
	public static CommentSortEnum typeOf(int index) {
		for (CommentSortEnum sortEnum : values()) {
			if (sortEnum.getType() == index) {
				return sortEnum;
			}
		}
		return NEWEST;
	}
}
