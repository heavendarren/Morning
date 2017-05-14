package org.pussinboots.morning.cms.common.result;

import org.pussinboots.morning.common.base.BaseResult;
import org.pussinboots.morning.common.exception.ReturnCode;

/**
 * 
* 项目名称：morning-cms-web Maven Webapp   
* 类名称：CmsResult   
* 类描述：CmsResult 后台管理系统返回结果类      
* 创建人：陈星星   
* 创建时间：2017年4月1日 上午4:31:09   
*
 */
public class CmsResult extends BaseResult {

	private static final long serialVersionUID = 1L;

	public CmsResult(ReturnCode returnCode) {
		super(returnCode.getCode(), returnCode.getMessage());
	}
	
	public CmsResult(ReturnCode returnCode, Object data) {
		super(returnCode.getCode(), returnCode.getMessage(), data);
	}
	
	public CmsResult(Integer code, String message) {
		super(code, message);
	}
}
