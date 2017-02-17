package com.pussinboots.morning.cms.modules.system.enums;

/**
 * 
* 项目名称：morning-cms-pojo   
* 类名称：MenuStatusEnum   
* 类描述：MenuStatusEnum 目录状态枚举表述常量数据字段   
* 创建人：陈星星   
* 创建时间：2017年2月4日 下午11:02:16
 */
public enum MenuStatusEnum {
	
	SHOW(1,"显示"),
	HIDDEN(0,"隐藏");

    private Integer status;
    
    private String stateinfo;
    
	private MenuStatusEnum(Integer status, String stateinfo) {
		this.status = status;
		this.stateinfo = stateinfo;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getStateinfo() {
		return stateinfo;
	}

	public void setStateinfo(String stateinfo) {
		this.stateinfo = stateinfo;
	}

	public static MenuStatusEnum stateOf(int index) {
		for (MenuStatusEnum statusEnum : values()) {
			if (statusEnum.getStatus() == index) {
				return statusEnum;
			}
		}
		return null;
	}
}
