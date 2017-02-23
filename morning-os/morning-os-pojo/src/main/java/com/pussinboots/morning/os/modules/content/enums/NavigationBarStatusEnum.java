package com.pussinboots.morning.os.modules.content.enums;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：NavigationBarStatusEnum   
* 类描述：NavigationBarStatusEnum 导航状态枚举表述常量数据字段   
* 创建人：陈星星   
* 创建时间：2017年2月24日 上午12:16:04   
*
 */
public enum NavigationBarStatusEnum {
	
	SHOW(1,"显示"),
	HIDDEN(0,"隐藏");

    private Integer status;
    
    private String stateInfo;
    
	private NavigationBarStatusEnum(Integer status, String stateInfo) {
		this.status = status;
		this.stateInfo = stateInfo;
	}

	public Integer getStatus() {
		return status;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public static NavigationBarStatusEnum stateOf(int index) {
		for (NavigationBarStatusEnum statusEnum : values()) {
			if (statusEnum.getStatus() == index) {
				return statusEnum;
			}
		}
		return null;
	}
}
