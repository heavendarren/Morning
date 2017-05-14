package org.pussinboots.morning.common.base;

import java.io.Serializable;

/**
 * 
* 项目名称：morning-common   
* 类名称：BaseResult   
* 类描述：BaseResult 统一返回结果类   
* 创建人：陈星星   
* 创建时间：2017年3月31日 上午11:55:46   
*
 */
public class BaseResult implements Serializable{
	
	private static final long serialVersionUID = 1L;

	/** 返回状态码 */
	private Integer code;
	
	/** 返回信息 */
	private String message;
	
	/** 返回数据 */
	private Object data;
	
	public BaseResult(Integer code, String message) {
		super();
		this.code = code;
		this.message = message;
	}

	public BaseResult(Integer code, String message, Object data) {
		super();
		this.code = code;
		this.message = message;
		this.data = data;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
