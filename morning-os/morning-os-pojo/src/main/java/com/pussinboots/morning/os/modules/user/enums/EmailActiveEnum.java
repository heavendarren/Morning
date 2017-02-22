package com.pussinboots.morning.os.modules.user.enums;

/**
 * 
* 项目名称：morning-cms-pojo   
* 类名称：EmailStatusEnum   
* 类描述：EmailStatusEnum 邮箱失效状态枚举表述常量数据字段   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午5:15:45
 */
public enum EmailActiveEnum {

	ACTIVATED(1, "激活"), 
	NONACTIVATED(0, "未激活");

    private Integer status;
    
    private String stateInfo;
    
	private EmailActiveEnum(Integer status, String stateInfo) {
		this.status = status;
		this.stateInfo = stateInfo;
	}

	public Integer getStatus() {
		return status;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public static EmailActiveEnum stateOf(int index) {
		for (EmailActiveEnum statusEnum : values()) {
			if (statusEnum.getStatus() == index) {
				return statusEnum;
			}
		}
		return null;
	}
}