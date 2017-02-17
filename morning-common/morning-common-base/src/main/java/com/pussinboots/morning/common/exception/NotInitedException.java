package com.pussinboots.morning.common.exception;

import com.pussinboots.morning.common.util.StringUtils;

/**
 * 
* 项目名称：morning-common-base 
* 类名称：NotInitedException 
* 类描述：自定义异常类：未初始化异常
* 创建人：陈星星   
* 创建时间：2017年1月18日 下午3:53:34   
* @version
 */
public class NotInitedException extends RuntimeException {

	private static final long serialVersionUID = 8247610319171014183L;

	public NotInitedException(Throwable e) {
		super(e);
	}

	public NotInitedException(String message) {
		super(message);
	}

	public NotInitedException(String messageTemplate, Object... params) {
		super(StringUtils.format(messageTemplate, params));
	}

	public NotInitedException(String message, Throwable throwable) {
		super(message, throwable);
	}

	public NotInitedException(Throwable throwable, String messageTemplate, Object... params) {
		super(StringUtils.format(messageTemplate, params), throwable);
	}
}
