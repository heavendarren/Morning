package com.pussinboots.morning.os.modules.content.enums;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：AdvertTypeEnum   
* 类描述：AdvertTypeEnum 广告位类型枚举表述常量数据字段   
* 创建人：陈星星   
* 创建时间：2017年2月24日 下午5:01:16   
*
 */
public enum AdvertTypeEnum {

	INDEX_CAROUSEL(1, "首页-轮播广告", "indexCarousel"), 
	INDEX_HOT_ADVERT (2, "首页-热点广告", "indexHotAdvert");

	private Integer type;

	private String typeInfo;
	
	private String code;

	private AdvertTypeEnum(Integer type, String typeInfo, String code) {
		this.type = type;
		this.typeInfo = typeInfo;
		this.code = code;
	}

	public Integer getType() {
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
