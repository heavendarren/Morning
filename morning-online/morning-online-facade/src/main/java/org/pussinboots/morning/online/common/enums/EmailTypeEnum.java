package org.pussinboots.morning.online.common.enums;

/**
 * 
* 项目名称：morning-online-facade   
* 类名称：EmailTypeEnum   
* 类描述： EmailTypeEnum 邮箱类型枚举表述常量数据字段     
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午4:15:51   
*
 */
public enum EmailTypeEnum {

	FORGET(0, "找回密码", "『但行好事·莫问前程』猫宁帐号安全验证", "PswCaptcha.vm"), 
	REGISTER(1, "账号注册", "『但行好事·莫问前程』很高兴遇见您!", "EmailCaptcha.vm"), 
	CHANGE(2, "邮箱更改", "『但行好事·莫问前程』猫宁邮箱认证验证", "PswCaptcha.vm"), 
	INFORM(3, "通知", "自定义", null);

    private Integer type;
    
    private String typeInfo;
    
    private String emailSubject;
    
    private String velocityTemplate;

	private EmailTypeEnum(Integer type, String typeInfo, String emailSubject, String velocityTemplate) {
		this.type = type;
		this.typeInfo = typeInfo;
		this.emailSubject = emailSubject;
		this.velocityTemplate = velocityTemplate;
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
	
	public String getVelocityTemplate() {
		return velocityTemplate;
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