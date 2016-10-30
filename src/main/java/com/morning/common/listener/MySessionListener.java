package com.morning.common.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
/**
 * 
 * @description：监听器,统计在线用户人数
 * @author CXX
 * @version 创建时间：2016年8月1日  上午10:32:59
 */
public class MySessionListener implements HttpSessionListener {
	
	//全站在线人数
	public static int userNumber;
	//创建session的时候+1

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		userNumber++;
		System.out.println("全站在线人数:"+userNumber);
		se.getSession().getServletContext().setAttribute("userNumber", userNumber);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		userNumber--;
		System.out.println("全站在线人数:"+userNumber);
		se.getSession().getServletContext().setAttribute("userNumber", userNumber);
	}

}
