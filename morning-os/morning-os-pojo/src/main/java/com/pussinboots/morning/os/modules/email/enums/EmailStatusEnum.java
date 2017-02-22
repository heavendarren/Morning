package com.pussinboots.morning.os.modules.email.enums;

/**
 * 
* 项目名称：morning-cms-pojo   
* 类名称：EmailStatusEnum   
* 类描述：EmailStatusEnum 邮箱失效状态枚举表述常量数据字段   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午5:15:45
 */
public enum EmailStatusEnum {

	VALID(1, "有效"), 
	INVALID(0, "无效");

    private Integer status;
    
    private String stateInfo;
    
	private EmailStatusEnum(Integer status, String stateInfo) {
		this.status = status;
		this.stateInfo = stateInfo;
	}

	public Integer getStatus() {
		return status;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public static EmailStatusEnum stateOf(int index) {
		for (EmailStatusEnum statusEnum : values()) {
			if (statusEnum.getStatus() == index) {
				return statusEnum;
			}
		}
		return null;
	}
}