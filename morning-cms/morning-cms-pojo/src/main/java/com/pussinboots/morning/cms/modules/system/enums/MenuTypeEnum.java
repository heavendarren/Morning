package com.pussinboots.morning.cms.modules.system.enums;

/**
 * 
* 项目名称：morning-cms-pojo   
* 类名称：MenuTypeEnum   
* 类描述：MenuTypeEnum 用户状态枚举表述常量数据字段      
* 创建人：陈星星   
* 创建时间：2017年2月4日 下午11:02:04
 */
public enum MenuTypeEnum {

	FIRST_MENU(1,"一级目录"),
	SECOND_MENU(2,"二级目录"),
	THIRD_MENU(3,"三级目录"),
	HANDLE_MENU(0,"操作目录");	

	private Integer type;

	private String typeinfo;
    
	private MenuTypeEnum(Integer type, String typeinfo) {
		this.type = type;
		this.typeinfo = typeinfo;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTypeinfo() {
		return typeinfo;
	}

	public void setTypeinfo(String typeinfo) {
		this.typeinfo = typeinfo;
	}

	public static MenuTypeEnum stateOf(int index) {
		for (MenuTypeEnum typeEnum : values()) {
			if (typeEnum.getType() == index) {
				return typeEnum;
			}
		}
		return null;
	}
}
