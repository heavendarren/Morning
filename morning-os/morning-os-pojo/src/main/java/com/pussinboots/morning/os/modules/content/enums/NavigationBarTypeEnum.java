package com.pussinboots.morning.os.modules.content.enums;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：NavigationBarTypeEnum   
* 类描述：NavigationBarTypeEnum  导航栏类型枚举表述常量数据字段   
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午11:25:55   
*
 */
public enum NavigationBarTypeEnum {

	INDEX_TOP(1, "首页-顶部", "indexTop"), 
	INDEX_ADVERT_LEFT(2, "首页-广告栏-左部", "indexAdvertLeft"), 
	INDEX_BOTTOM(3, "首页-底部","indexBottom"), 
	LOGIN_TOP(4, "登录-顶部", "loginTop"),
	INDEX_CLASSIFY(5, "首页-分类", "indexClassify");

	private Integer type;

	private String typeInfo;
	
	private String code;

	private NavigationBarTypeEnum(Integer type, String typeInfo, String code) {
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

	public static NavigationBarTypeEnum stateOf(int index) {
		for (NavigationBarTypeEnum typeEnum : values()) {
			if (typeEnum.getType() == index) {
				return typeEnum;
			}
		}
		return null;
	}
}
