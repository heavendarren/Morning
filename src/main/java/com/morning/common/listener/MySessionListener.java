package com.morning.common.listener;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.morning.common.util.toolbox.DateUtil;
/**
 * 
 * @description：监听器,统计在线用户人数
 * @author CXX
 * @version 创建时间：2016年8月1日  上午10:32:59
 */
@WebListener
public class MySessionListener implements HttpSessionListener {
	
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		ServletContext ctx = se.getSession().getServletContext();
		int count =Integer.parseInt(ctx.getAttribute("onLineCount").toString());
		count++;
		ctx.setAttribute("onLineCount", count);
		System.out.println("全站在线人数:"+count);
		int maxOnLineCount = Integer.parseInt(ctx.getAttribute("maxOnLineCount").toString());
		if(count > maxOnLineCount){
			ctx.setAttribute("maxOnLineCount", maxOnLineCount);
			ctx.setAttribute("date", DateUtil.now());
			System.out.println("全站最多在线人数:"+maxOnLineCount);
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		ServletContext ctx = se.getSession().getServletContext();
		int count =Integer.parseInt(ctx.getAttribute("onLineCount").toString());
		count--;
		ctx.setAttribute("onLineCount", count);
		System.out.println("全站在线人数:"+count);
	}
}
