package com.pussinboots.morning.cms.modules.administrator.enums;

/**
 * 
* 项目名称：morning-cms-pojo   
* 类名称：UserStatusEnum   
* 类描述：UserStatusEnum 用户状态枚举表述常量数据字段   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午5:15:45
 */
public enum UserStatusEnum {

	NORMAL(1,"正常"),
	FREEZE(0,"冻结");

    private Integer status;
    
    private String stateInfo;
    
	private UserStatusEnum(Integer status, String stateInfo) {
		this.status = status;
		this.stateInfo = stateInfo;
	}

	public Integer getStatus() {
		return status;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public static UserStatusEnum stateOf(int index) {
		for (UserStatusEnum statusEnum : values()) {
			if (statusEnum.getStatus() == index) {
				return statusEnum;
			}
		}
		return null;
	}
}