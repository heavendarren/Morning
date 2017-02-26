package com.pussinboots.morning.os.modules.product.enums;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：CategoryStatusEnum   
* 类描述：CategoryStatusEnum 目录状态枚举表述常量数据字段   
* 创建人：陈星星   
* 创建时间：2017年2月4日 下午11:02:16
 */
public enum CategoryStatusEnum {
	
	SHOW(1, "显示"), 
	HIDDEN(0, "隐藏");

    private Integer status;
    
    private String stateInfo;
    
	private CategoryStatusEnum(Integer status, String stateInfo) {
		this.status = status;
		this.stateInfo = stateInfo;
	}

	public Integer getStatus() {
		return status;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public static CategoryStatusEnum stateOf(int index) {
		for (CategoryStatusEnum statusEnum : values()) {
			if (statusEnum.getStatus() == index) {
				return statusEnum;
			}
		}
		return null;
	}
}
