package org.pussinboots.morning.user.common.constant;

import org.pussinboots.morning.common.exception.ReturnCode;

public enum UserReturnCode implements ReturnCode {
	
	USER_NOT_EXIST(1000, "该账号不存在!"),
	USER_SUSPEND(10001, "该账号已被冻结!"),
	WRONG_PASSWORD(10002, "您输入的密码不正确!"),
	ACCOUNT_LOCK(10004, "密码连续输入错误超过5次，锁定半小时!"),
	REGISTER_CODE_ERROR(10005, "验证码错误!"),
	ENTERED_PASSWORDS_DIFFER(10006, "两次输入的密码不一致"),
	PASSWORD_AUTHENTICATION_ERROR(10007, "密码长度8~16位，其中数字，字母和符号至少包含两种!"),
	ACCOUNT_ERROR(10008, "该用户名已被使用!");
	
	/** 返回状态码 */
	private Integer code;

	/** 返回消息 */
	private String message;
	
	private UserReturnCode(Integer code, String message) {
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
