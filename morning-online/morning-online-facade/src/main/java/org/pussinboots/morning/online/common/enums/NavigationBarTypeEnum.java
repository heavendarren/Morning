package org.pussinboots.morning.online.common.enums;

/**
 * 
* 项目名称：morning-online-facade   
* 类名称：NavigationBarTypeEnum   
* 类描述：NavigationBarTypeEnum  导航栏类型枚举表述常量数据字段      
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午8:57:56   
*
 */
public enum NavigationBarTypeEnum {

	INDEX_TOP(1L, "首页-顶部", "indexTop"), 
	INDEX_ADVERT_LEFT(2L, "首页-广告栏-左部", "indexAdvertLeft"), 
	INDEX_BOTTOM(3L, "首页-底部","indexBottom"), 
	LOGIN_TOP(4L, "登录-顶部", "loginTop"),
	INDEX_CLASSIFY(5L, "首页-分类", "indexClassify");

	private Long type;

	private String typeInfo;
	
	private String code;

	private NavigationBarTypeEnum(Long type, String typeInfo, String code) {
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

	public static NavigationBarTypeEnum typeOf(int index) {
		for (NavigationBarTypeEnum typeEnum : values()) {
			if (typeEnum.getType() == index) {
				return typeEnum;
			}
		}
		return null;
	}
}
