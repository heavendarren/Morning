package org.pussinboots.morning.common.exception;

/**
 * 
* 项目名称：morning-common   
* 类名称：ReturnCode   
* 类描述：ReturnCode 统一异常返回状态码       
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午12:49:14   
*
 */
public interface ReturnCode {
	
	public Integer getCode();

	public String getMessage();
	
}
