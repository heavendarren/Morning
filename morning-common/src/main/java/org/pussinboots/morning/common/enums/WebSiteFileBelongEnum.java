package org.pussinboots.morning.common.enums;

/**
 * 
* 项目名称：morning-common    
* 类名称：WebSiteFileBelongEnum   
* 类描述：WebSiteFileBelongEnum 网站文件存放归属枚举表述常量数据字段      
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午12:57:39  
*
 */
public enum WebSiteFileBelongEnum {
	
	DEFAULT(1, "一级目录", "default", "网站默认"),
	IMAGES(1, "一级目录", "images", "网站图片"),
	VIDEO(1, "一级目录", "video", "网站视频"),
	AVATAR(2, "二级目录", "avatar", "用户头像"),
	ICO(2, "二级目录", "ico", "网站缩略标志"),
	GOODS(2, "二级目录", "goods", "网站商品"),
	ADVERT(2, "二级目录", "advert", "网站广告");
	
	private Integer type;
	
	private String typeInfo;
	
	private String belong;
	
	private String belongInfo;

	private WebSiteFileBelongEnum(Integer type, String typeInfo, String belong, String belongInfo) {
		this.type = type;
		this.typeInfo = typeInfo;
		this.belong = belong;
		this.belongInfo = belongInfo;
	}

	public Integer getType() {
		return type;
	}

	public String getTypeInfo() {
		return typeInfo;
	}

	public String getBelong() {
		return belong;
	}

	public String getBelongInfo() {
		return belongInfo;
	}
}
