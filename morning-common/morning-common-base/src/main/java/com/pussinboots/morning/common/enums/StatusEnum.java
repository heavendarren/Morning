package com.pussinboots.morning.common.enums;

/**
 * 
* 项目名称：morning-common-base   
* 类名称：StatusEnum   
* 类描述：StatusEnum 状态枚举表述常量数据字段    
* 创建人：陈星星   
* 创建时间：2017年2月28日 上午1:13:23   
*
 */
public enum StatusEnum {
	
	/** 正常 */
	NORMAL(1, "正常"),
	/** 冻结 */
	FREEZE(0, "冻结"),
	
	/** 激活 */
	ACTIVATED(1, "激活"),
	/** 未激活 */
	NONACTIVATED(0, "未激活"),
	
	/** 显示 */
	SHOW(1, "显示"),
	/** 隐藏 */
	HIDDEN(0, "隐藏"),
	
	/** 有效 */
	VALID(1, "有效"), 
	/** 无效 */
	INVALID(0, "无效");
	
	private Integer status;

	private String stateInfo;

	private StatusEnum(Integer status, String stateInfo) {
		this.status = status;
		this.stateInfo = stateInfo;
	}

	public Integer getStatus() {
		return status;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public static StatusEnum stateOf(int index) {
		for (StatusEnum statusEnum : values()) {
			if (statusEnum.getStatus() == index) {
				return statusEnum;
			}
		}
		return null;
	}
}
