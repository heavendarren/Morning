package com.morning.common.constants;

import com.morning.common.util.PropertiesUtils;

/**
 * 系统常量
 * @author 陈星星
 *
 */
public class CommonConstants {  
	
	/**获取properties配置文件属性 */
	private static final String CONSTANTSPROPERTIES = "properties/constants.properties";
	//用static修饰的代码块表示静态代码块，当Java虚拟机（JVM）加载类时，就会执行该代码块
	static {
		PropertiesUtils.readProperties(CONSTANTSPROPERTIES);
	}
	
	/**项目路径*/
	private static final String CONTEXTPATH = "contextPath";
	public static final String contextPath = PropertiesUtils.getProperty(CONTEXTPATH);
	
	/**静态资源*/
	private static final String STATICSERVER = "staticServer";
	public static final String staticServer = PropertiesUtils.getProperty(STATICSERVER);
	
}
