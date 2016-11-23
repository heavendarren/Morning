package com.morning.common.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：InitListener   
* 类描述：上下文监听器，在服务器启动时初始化onLineCount和maxOnLineCount两个变量
* 并将其置于服务器上下文（ServletContext）中，起初值都是0   
* 创建人：陈星星   
* 创建时间：2016年11月23日 下午3:07:09   
* 修改人：陈星星   
* 修改时间：2016年11月23日 下午3:07:09   
* @version
 */
public class InitListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		sce.getServletContext().setAttribute("onLineCount", 0);
		sce.getServletContext().setAttribute("maxOnLineCount", 0);
	}
	
}
