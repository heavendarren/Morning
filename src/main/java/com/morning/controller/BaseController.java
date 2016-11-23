package com.morning.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.morning.common.dto.AjaxResult;


/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：BaseController   
* 类描述： 公共表示层：控制器支持类  
* 创建人：陈星星   
* 创建时间：2016年8月15日  上午9:54:54   
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:21:29   
* 修改备注：   
* @version    
*
 */
public abstract class BaseController {
	
	/** ============================     ajax    =================================================  */
	
	/**
	 * 成功,返回状态
	 * @param success 状态true/false
	 * @return
	 */
	public AjaxResult success(Boolean success) {
		return new AjaxResult(success);
	}
	
	/**
	 * 成功,返回状态
	 * @param success 状态true/false
	 * @return
	 */
	public AjaxResult success(Boolean success, String message) {
		return new AjaxResult(success, message);
	}
	
	/**
	 * 返回json数据
	 * @param success 状态true/false
	 * @param data 实体
	 * @return
	 */
	public AjaxResult json(Boolean success, Object data) {
		return new AjaxResult(success, data);
	}

	/**
	 * 失败,返回状态及原因
	 * @param success 状态true/false
	 * @param message 消息
	 * @return
	 */
	public AjaxResult fail(Boolean success, String message) {
		return new AjaxResult(success, message);
	}
	
	/**
	 * 转换为ajax需要的 JSON
	 * @param success 状态
	 * @param message 消息	
	 * @param entity  实体
	 * @return
	 */
	protected Map<String, Object> setJson(boolean success, String message, Object entity){
		Map<String,Object> json = new HashMap<>();
		json.put("success", success);
		json.put("message", message);
		json.put("entity", entity);
		return json;
	}
	
	/**
	 * ajax成功/失败
	 * @param success 状态
	 * @return
	 */
	protected Map<String, Object> setJson(boolean success){
		Map<String,Object> json = new HashMap<>();
		json.put("success", success);
		return json;
	}
	
	/**
	 * ajax成功/失败 + 消息
	 * @param success 状态
	 * @param message 消息
	 * @return
	 */
	protected Map<String, Object> setJson(boolean success, String message){
		Map<String,Object> json = new HashMap<>();
		json.put("message", message);
		json.put("success", success);
		return json;
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
	
	/**
	 * 重定向至地址 url
	 * @param url 请求地址
	 * @return
	 */
	protected String redirectTo( String url ) {
		StringBuilder rto = new StringBuilder("redirect:");
		rto.append(url);
		return rto.toString();
	}
	
	/**
	 * 获取页面地址url
	 * @param path
	 * @return
	 */
	protected static String getViewPath( String path ){
		StringBuilder viewPath = new StringBuilder();
		viewPath.append(path);
		return viewPath.toString();
	}
	
	/**
	 * 生成随机数
	 * @param count 生成个数
	 * @return String
	 */
	protected String getRandomNum(int count) {
		Random ra = new Random();
		String random = "";
		for (int i = 0; i < count; i++) {
			random += ra.nextInt(9);
		}
		return random;
	}
	
}
 