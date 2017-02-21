package com.pussinboots.morning.os.modules.email.enums;

/**
 * 
* 项目名称：morning-cms-pojo   
* 类名称：EmailStatusEnum   
* 类描述：EmailStatusEnum 邮箱状态枚举表述常量数据字段   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午5:15:45
 */
public enum EmailStatusEnum {

	SUCCESS(1,"发送成功",true),
	FAILURE(0,"发送失败",false);

    private Integer status;
    
    private String stateInfo;
    
    private Boolean result;
    
	private EmailStatusEnum(Integer status, String stateInfo, Boolean result) {
		this.status = status;
		this.stateInfo = stateInfo;
		this.result = result;
	}

	public Integer getStatus() {
		return status;
	}

	public String getStateInfo() {
		return stateInfo;
	}
	
	public Boolean getResult() {
		return result;
	}

	public static EmailStatusEnum stateOf(int index) {
		for (EmailStatusEnum statusEnum : values()) {
			if (statusEnum.getStatus() == index) {
				return statusEnum;
			}
		}
		return null;
	}
	
	public static EmailStatusEnum resultOf(boolean result) {
		for (EmailStatusEnum statusEnum : values()) {
			if (statusEnum.getResult() == result) {
				return statusEnum;
			}
		}
		return null;
	}
}