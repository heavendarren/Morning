package org.pussinboots.morning.product.common.enums;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：ProductRecommendTypeEnum   
* 类描述：ProductRecommendTypeEnum  推荐产品类型枚举表述常量数据字段         
* 创建人：陈星星   
* 创建时间：2017年4月11日 下午3:50:04   
*
 */
public enum ProductRecommendTypeEnum {
	
	/** 明星产品 */
	STAR(1L, "明星产品", "star"),

	/** 为你推荐 */
	POPULAR(2L, "为你推荐", "popular"),

	/** 热评产品 */
	COMMENT(3L, "热评产品", "comment"),

	/** 新品推荐 */
	NEW(4L, "新品推荐", "new");
	
	private Long type;

	private String typeInfo;
	
	private String code;
	
	private ProductRecommendTypeEnum(Long type, String typeInfo, String code) {
		this.type = type;
		this.typeInfo = typeInfo;
		this.code = code;
	}

	public Long getType() {
		return type;
	}

	public String getTypeInfo() {
		return typeInfo;
	}

	public String getCode() {
		return code;
	}

	public static ProductRecommendTypeEnum typeOf(int index) {
		for (ProductRecommendTypeEnum typeEnum : values()) {
			if (typeEnum.getType() == index) {
				return typeEnum;
			}
		}
		return null;
	}
}
