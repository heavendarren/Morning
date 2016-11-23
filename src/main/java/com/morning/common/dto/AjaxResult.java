package com.morning.common.dto;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：AjaxResult   
* 类描述：封装Ajax结果,所有Ajax请求返回类型   
* 创建人：陈星星   
* 创建时间：2016年11月10日 下午11:40:54   
* 修改人：陈星星   
* 修改时间：2016年11月10日 下午11:40:54   
* @version
 */
public class AjaxResult {
	
	/** 返回结果 */
	private boolean success;
	
	/** 返回信息 */
	private String message;
	
	/** 返回数据 */
	private Object data;
	

	public AjaxResult(boolean success) {
		super();
		this.success = success;
	}

	public AjaxResult(boolean success, String message) {
		super();
		this.success = success;
		this.message = message;
	}
	
	public AjaxResult(boolean success, Object data) {
		super();
		this.success = success;
		this.data = data;
	}

	public AjaxResult(boolean success, String message, Object data) {
		super();
		this.success = success;
		this.message = message;
		this.data = data;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
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
