package org.pussinboots.morning.os.common.result;

import org.pussinboots.morning.common.base.BaseResult;
import org.pussinboots.morning.common.exception.ReturnCode;

/**
 * 
* 项目名称：morning-os-web Maven Webapp   
* 类名称：OsResult   
* 类描述：OsResult 电子商城系统返回接口类   
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午2:18:27   
*
 */
public class OsResult extends BaseResult {

	private static final long serialVersionUID = 1L;

	public OsResult(ReturnCode returnCode) {
		super(returnCode.getCode(), returnCode.getMessage());
	}
	
	public OsResult(ReturnCode returnCode, Object data) {
		super(returnCode.getCode(), returnCode.getMessage(), data);
	}
	
	public OsResult(Integer code, String message) {
		super(code, message);
	}
}
