package com.pussinboots.morning.common.exception;

import com.pussinboots.morning.common.util.StringUtils;

/**
 * 
* 项目名称：morning-common-base 
* 类名称：ValidateException 
* 类描述：自定义异常类：验证异常
* 创建人：陈星星   
* 创建时间：2017年1月18日 下午3:57:26   
* @version
 */
public class ValidateException extends StatefulException {
	
	private static final long serialVersionUID = 6057602589533840889L;

	public ValidateException(String msg) {
		super(msg);
	}
	
	public ValidateException(String messageTemplate, Object... params) {
		super(StringUtils.format(messageTemplate, params));
	}

	public ValidateException(Throwable throwable) {
		super(throwable);
	}

	public ValidateException(String msg, Throwable throwable) {
		super(msg, throwable);
	}

	public ValidateException(int status, String msg) {
		super(status, msg);
	}

	public ValidateException(int status, Throwable throwable) {
		super(status, throwable);
	}

	public ValidateException(int status, String msg, Throwable throwable) {
		super(status, msg, throwable);
	}
}
