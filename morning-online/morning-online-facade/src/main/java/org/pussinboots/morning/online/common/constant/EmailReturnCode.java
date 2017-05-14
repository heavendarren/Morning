package org.pussinboots.morning.online.common.constant;

import org.pussinboots.morning.common.exception.ReturnCode;

public enum EmailReturnCode implements ReturnCode {
	
	EMAIL_FORMAT_ERROR(20001, "请输入正确的电子邮箱!"),
	EMAIL_NOT_EXIST(20002, "该电子邮箱不存在!"),
	SEND_EMAIL_NOT_EXIST(20003, "该邮件不存在,请重新发送邮件!"),
	CAPTCHA_OVERDUE(20004, "验证码已过期,请重新输入验证码!"),
	CAPTCHA_ERROR(20005, "验证码错误,请重新输入!");
	
	/** 返回状态码 */
	private Integer code;

	/** 返回消息 */
	private String message;
	
	private EmailReturnCode(Integer code, String message) {
		this.code = code;
		this.message = message;
	}

	@Override
	public Integer getCode() {
		return code;
	}

	@Override
	public String getMessage() {
		return message;
	}
}
