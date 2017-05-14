package org.pussinboots.morning.common.exception;

/**
 * 
* 项目名称：morning-common   
* 类名称：BaseException   
* 类描述：BaseException 统一异常基类    
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午12:06:06   
*
 */
public class BaseException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public BaseException() {
		super();
	}
	
	public BaseException(Throwable cause) {
		super(cause);
	}
	
	public BaseException(String message) {
		super(message);
	}
	
	public BaseException(String message, Throwable cause) {
		super(message, cause);
	}

	public BaseException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}
}
