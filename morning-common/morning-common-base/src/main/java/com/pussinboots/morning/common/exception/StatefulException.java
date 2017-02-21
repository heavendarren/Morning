package com.pussinboots.morning.common.exception;

import com.pussinboots.morning.common.util.StringUtils;

/**
 * 
* 项目名称：morning-common-base 
* 类名称：StatefulException 
* 类描述：自定义异常类：带有状态码的异常
* 创建人：陈星星   
* 创建时间：2017年1月18日 下午3:56:47   
* @version
 */
public class StatefulException extends RuntimeException {

	private static final long serialVersionUID = 6057602589533840889L;

	/** 异常状态码 */
	private int status;

	public StatefulException() {
		super();
	}

	public StatefulException(String msg) {
		super(msg);
	}

	public StatefulException(String messageTemplate, Object... params) {
		super(StringUtils.format(messageTemplate, params));
	}

	public StatefulException(Throwable throwable) {
		super(throwable);
	}

	public StatefulException(String msg, Throwable throwable) {
		super(msg, throwable);
	}

	public StatefulException(int status, String msg) {
		super(msg);
		this.status = status;
	}

	public StatefulException(int status, Throwable throwable) {
		super(throwable);
		this.status = status;
	}

	public StatefulException(int status, String msg, Throwable throwable) {
		super(msg, throwable);
		this.status = status;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
}
