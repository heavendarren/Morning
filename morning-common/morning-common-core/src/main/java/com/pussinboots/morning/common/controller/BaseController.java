package com.pussinboots.morning.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.pussinboots.morning.common.result.ResponseResult;
import com.pussinboots.morning.common.util.StringEscapeEditor;

/**
 * 
* 项目名称：morning-common-core   
* 类名称：BaseController   
* 类描述：公共表示层：控制器支持类   
* 创建人：陈星星   
* 创建时间：2017年2月2日 下午10:27:49
 */
public abstract class BaseController {
	
    @InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		/**
		 * 防止XSS攻击
		 */
		binder.registerCustomEditor(String.class, new StringEscapeEditor());
	}
	
	/** ============================     ajax    =================================================  */
	
	/**
	 * 成功,返回状态
	 * @param success 状态true/false
	 * @return
	 */
	public ResponseResult success(Boolean success) {
		return new ResponseResult(success);
	}
	
	/**
	 * 成功,返回状态
	 * @param success 状态true/false
	 * @return
	 */
	public ResponseResult success(Boolean success, String message) {
		return new ResponseResult(success, message);
	}
	
	/**
	 * 成功,返回状态
	 * @param success 状态true/false
	 * @return
	 */
	public ResponseResult success(Boolean success, String message, Object data) {
		return new ResponseResult(success, message, data);
	}
	
	/**
	 * 返回json数据
	 * @param success 状态true/false
	 * @param data 实体
	 * @return
	 */
	public ResponseResult json(Boolean success, Object data) {
		return new ResponseResult(success, data);
	}

	/**
	 * 失败,返回状态及原因
	 * @param success 状态true/false
	 * @param message 消息
	 * @return
	 */
	public ResponseResult fail(Boolean success, String message) {
		return new ResponseResult(success, message);
	}
	
	/** ============================     requset    =================================================  */

	/**
	 * 获取当前请求对象
	 * @return
	 */
	public static HttpServletRequest getRequest(){
		return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
	}
	
	/**
	 * getParameter系列的方法主要用于处理“请求数据”，是服务器端程序获取浏览器所传递参数的主要接口。
	 * @param name 表单name属性
	 * @return
	 */
	public String getParameter(String name) {
		return getRequest().getParameter(name);
	}
	
	/**
	 * getParameterValues这个方法是获得传过来的参数名相同的一个数组;
	 * @param name
	 * @return
	 */
	public String[] getParameterValues(String name){
		return getRequest().getParameterValues(name);
	}
	
	/**
	 * getAttribute这个方法是提取放置在某个共享区间的对象
	 * @param name
	 * @return
	 */
	public Object getAttribute(String name){
		return  getRequest().getSession().getAttribute(name);
	}
	
	/**
	 * 返回的是相对路径，工程的项目的相对路径
	 * @return
	 */
	public String getContextPath() {
		return getRequest().getContextPath();
	}
	
	
	/** ============================     viewPath    =================================================  */
	
	/**
	 * 重定向至地址 url
	 * @param url 请求地址
	 * @return
	 */
	protected String redirectTo(String url) {
		StringBuilder rto = new StringBuilder("redirect:");
		rto.append(url);
		return rto.toString();
	}
	
	/**
	 * 获取页面地址url
	 * @param path
	 * @return
	 */
	protected static String getViewPath(String path) {
		StringBuilder viewPath = new StringBuilder();
		viewPath.append(path);
		return viewPath.toString();
	}
	
}
 