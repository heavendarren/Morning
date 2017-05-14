package org.pussinboots.morning.common.exception;

/**
 * 
* 项目名称：morning-common   
* 类名称：ValidateException   
* 类描述：ValidateException 验证异常   
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午12:55:39   
*
 */
public class ValidateException extends BaseException {

	private static final long serialVersionUID = 1L;
	
	/** 返回状态码 */
	private Integer code;
	
	public ValidateException() {
		super();
	}
	
	public ValidateException(String message) {
		super(message);
	}
	
	public ValidateException(Throwable cause) {
		super(cause);
	}
	
	public ValidateException(String message, Throwable cause) {
		super(message, cause);
	}
	
	public ValidateException(Integer code, String message) {
		super(message);
		this.code = code;
	}
	
	public ValidateException(ReturnCode returnCode) {
		super(returnCode.getMessage());
		this.code = returnCode.getCode();
	}
	
	public ValidateException(ReturnCode returnCode, Throwable cause) {
		super(returnCode.getMessage(), cause);
		this.code = returnCode.getCode();
	}
	
	public ValidateException(Integer code, String message, Throwable cause) {
		super(message, cause);
		this.code = code;
	}
	
	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

}
