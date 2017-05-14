package org.pussinboots.morning.common.exception;

/**
 * 
* 项目名称：morning-common   
* 类名称：BusinessException   
* 类描述：BusinessException 业务异常   
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午12:53:32   
*
 */
public class BusinessException extends BaseException {

	private static final long serialVersionUID = 1L;
	
	/** 返回状态码 */
	private Integer code;
	
	public BusinessException() {
		super();
	}
	
	public BusinessException(String message) {
		super(message);
	}
	
	public BusinessException(Throwable cause) {
		super(cause);
	}
	
	public BusinessException(String message, Throwable cause) {
		super(message, cause);
	}
	
	public BusinessException(Integer code, String message) {
		super(message);
		this.code = code;
	}
	
	public BusinessException(ReturnCode returnCode) {
		super(returnCode.getMessage());
		this.code = returnCode.getCode();
	}
	
	public BusinessException(ReturnCode returnCode, Throwable cause) {
		super(returnCode.getMessage(), cause);
		this.code = returnCode.getCode();
	}
	
	public BusinessException(Integer code, String message, Throwable cause) {
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
