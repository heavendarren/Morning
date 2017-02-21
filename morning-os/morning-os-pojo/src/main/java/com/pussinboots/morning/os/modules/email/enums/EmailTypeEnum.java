package com.pussinboots.morning.os.modules.email.enums;

/**
 * 
* 项目名称：morning-cms-pojo   
* 类名称：EmailTypeEnum   
* 类描述：EmailTypeEnum 邮箱类型枚举表述常量数据字段   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午5:15:45
 */
public enum EmailTypeEnum {

	FORGET(0, "找回密码", "『但行好事·莫问前程』猫宁帐号安全验证"), 
	REGISTER(1, "账号注册","『但行好事·莫问前程』很高兴遇见您!"), 
	CHANGE(2, "邮箱更改","『但行好事·莫问前程』猫宁邮箱认证验证"), 
	INFORM(3, "通知","自定义");

    private Integer type;
    
    private String typeInfo;
    
    private String emailSubject;

	private EmailTypeEnum(Integer type, String typeInfo, String emailSubject) {
		this.type = type;
		this.typeInfo = typeInfo;
		this.emailSubject = emailSubject;
	}

	public Integer getType() {
		return type;
	}

	public String getTypeInfo() {
		return typeInfo;
	}
	
	public String getEmailSubject() {
		return emailSubject;
	}

	public static EmailTypeEnum stateOf(int index) {
		for (EmailTypeEnum statusEnum : values()) {
			if (statusEnum.getType() == index) {
				return statusEnum;
			}
		}
		return null;
	}
}