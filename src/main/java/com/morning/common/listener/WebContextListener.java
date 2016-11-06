package com.morning.common.listener;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;

import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;

import com.morning.common.constants.GlobalConstants;


/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：WebContextListener   
* 类描述：Spring监听器
* ContextLoaderListener监听器的作用就是启动Web容器时，自动装配ApplicationContext的配置信息。因为它实现了ServletContextListener这个接口，在web.xml配置这个监听器，启动容器时，就会默认执行它实现的方法。   
* 创建人：陈星星   
* 创建时间：2016年11月1日 上午1:07:42   
* 修改人：陈星星   
* 修改时间：2016年11月1日 上午1:07:42   
* 修改备注：   
* @version    
*
 */
@WebListener
public class WebContextListener extends ContextLoaderListener{
	
	@Override
	public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {
		if (!GlobalConstants.printKeyLoadMessage()){
			return null;
		}
		return super.initWebApplicationContext(servletContext);
	}

}
