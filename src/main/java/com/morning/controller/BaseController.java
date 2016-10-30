package com.morning.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 
 * @description：基础控制器Controller
 * @author CXX
 * @version 创建时间：2016年8月15日  上午9:54:54
 */
public class BaseController {
	
	
	/** ============================     ajax    =================================================  */
	
	/**
	 * 转换为ajax需要的 JSON
	 * @param success 状态
	 * @param message 消息	
	 * @param entity  实体
	 * @return
	 */
	protected Map<String, Object> setJson(boolean success, String message, Object entity){
		Map<String,Object> json = new HashMap<String,Object>();
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
		Map<String,Object> json = new HashMap<String,Object>();
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
		Map<String,Object> json = new HashMap<String,Object>();
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
		try{
			return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		}catch(Exception e){
			return null;
		}
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
		StringBuffer rto = new StringBuffer("redirect:");
		rto.append(url);
		return rto.toString();
	}
	
	/**
	 * 获取页面地址url
	 * @param path
	 * @return
	 */
	protected static String getViewPath( String path ){
		StringBuffer viewPath = new StringBuffer();
		viewPath.append(path);
		return viewPath.toString();
	}
	
	/**
	 * 生成随机数
	 * @param count 生成个数
	 * @return String
	 */
	protected String getRandomNum(int count){
		Random ra = new Random();
		String random="";
		for(int i=0;i<count;i++){
			random+=ra.nextInt(9);
		}
		return random;
	}
	
}
 