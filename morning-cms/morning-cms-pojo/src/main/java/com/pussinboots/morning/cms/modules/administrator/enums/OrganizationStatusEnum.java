package com.pussinboots.morning.cms.modules.administrator.enums;

/**
 * 
* 项目名称：morning-cms-pojo   
* 类名称：RoleStatusEnum   
* 类描述：RoleStatusEnum 角色状态枚举表述常量数据字段   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午5:15:45
 */
public enum OrganizationStatusEnum {

	NORMAL(1,"正常"),
	FREEZE(0,"冻结");

    private Integer status;
    
    private String stateinfo;
    
	private OrganizationStatusEnum(Integer status, String stateinfo) {
		this.status = status;
		this.stateinfo = stateinfo;
	}

	public Integer getStatus() {
		return status;
	}

	public String getStateinfo() {
		return stateinfo;
	}

	public static OrganizationStatusEnum stateOf(int index) {
		for (OrganizationStatusEnum statusEnum : values()) {
			if (statusEnum.getStatus() == index) {
				return statusEnum;
			}
		}
		return null;
	}
}