package org.pussinboots.morning.administrator.provider;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 
* 项目名称：morning-administrator-service   
* 类名称：DubboProviders   
* 类描述：DubboProviders 启动类:不用dubbo的main方法将项目运行起来   
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午4:00:34   
*
 */
public class DubboProviders {
	
	private static final Logger logger = LoggerFactory.getLogger(DubboProviders.class);
	
	private DubboProviders() {
		throw new AssertionError();
	}
    
	public static void main(String[] args) {
		try {
			@SuppressWarnings("resource")
			ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
					"classpath:spring/applicationContext-spring.xml");
			context.start();
			logger.info("Dubbo started!");
		} catch (Exception e) {
			logger.error("== DubboProvider context start error:{} ==", e);
		}
		synchronized (DubboProviders.class) {
			while (true) {
				try {
					DubboProviders.class.wait();
				} catch (InterruptedException e) {
					logger.error("== synchronized error:{} ==", e);
				}
			}
		}
	}
}
