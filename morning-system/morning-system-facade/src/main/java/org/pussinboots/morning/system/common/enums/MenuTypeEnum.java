package org.pussinboots.morning.system.common.enums;

/**
 * 
* 项目名称：morning-system-facade   
* 类名称：MenuTypeEnum   
* 类描述：MenuTypeEnum 用户状态枚举表述常量数据字段         
* 创建人：陈星星   
* 创建时间：2017年4月7日 下午4:16:54   
*
 */
public enum MenuTypeEnum {

	FIRST_MENU(1,"一级目录"),
	SECOND_MENU(2,"二级目录"),
	THIRD_MENU(3,"三级目录"),
	HANDLE_MENU(0,"操作目录");	

	private Integer type;

	private String typeInfo;
    
	private MenuTypeEnum(Integer type, String typeInfo) {
		this.type = type;
		this.typeInfo = typeInfo;
	}

	public Integer getType() {
		return type;
	}

	public String getTypeInfo() {
		return typeInfo;
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
