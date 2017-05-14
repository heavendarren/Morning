package org.pussinboots.morning.online.common.enums;

/**
 * 
* 项目名称：morning-online-facade   
* 类名称：EmailSendStatusEnum   
* 类描述：EmailSendStatusEnum 邮箱状态枚举表述常量数据字段      
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午4:42:29   
*
 */
public enum EmailSendStatusEnum {

	SUCCESS(1, "发送成功", true), 
	FAILURE(0, "发送失败", false);

    private Integer status;
    
    private String stateInfo;
    
    private Boolean result;
    
	private EmailSendStatusEnum(Integer status, String stateInfo, Boolean result) {
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

	public static EmailSendStatusEnum stateOf(int index) {
		for (EmailSendStatusEnum statusEnum : values()) {
			if (statusEnum.getStatus() == index) {
				return statusEnum;
			}
		}
		return null;
	}
	
	public static EmailSendStatusEnum resultOf(boolean result) {
		for (EmailSendStatusEnum statusEnum : values()) {
			if (statusEnum.getResult() == result) {
				return statusEnum;
			}
		}
		return null;
	}
}