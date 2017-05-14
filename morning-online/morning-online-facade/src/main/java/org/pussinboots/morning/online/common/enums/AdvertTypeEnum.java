package org.pussinboots.morning.online.common.enums;

/**
 * 
* 项目名称：morning-online-facade   
* 类名称：AdvertTypeEnum   
* 类描述：AdvertTypeEnum 广告位类型枚举表述常量数据字段      
* 创建人：陈星星   
* 创建时间：2017年4月10日 上午12:38:14   
*
 */
public enum AdvertTypeEnum {

	INDEX_CAROUSEL(1L, "首页-轮播广告", "indexCarousel"), 
	INDEX_HOT_ADVERT (2L, "首页-热点广告", "indexHotAdvert");

	private Long type;

	private String typeInfo;
	
	private String code;

	private AdvertTypeEnum(Long type, String typeInfo, String code) {
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

	public static AdvertTypeEnum stateOf(int index) {
		for (AdvertTypeEnum typeEnum : values()) {
			if (typeEnum.getType() == index) {
				return typeEnum;
			}
		}
		return null;
	}
}
