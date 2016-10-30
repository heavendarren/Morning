package com.morning.entity.email;

import java.util.Properties;

import com.morning.common.util.PropertiesUtils;

/**
 * 
 * @description：默认的邮件发送类信息
 * @author CXX
 * @version 创建时间：2016年8月5日  下午10:17:18
 */
public class EmailEntity {
	
	/**获取properties配置文件属性 */
	private static final String EMAILPROPERTIES = "properties/mail.properties";
	//用static修饰的代码块表示静态代码块，当Java虚拟机（JVM）加载类时，就会执行该代码块
	static {
		PropertiesUtils.readProperties(EMAILPROPERTIES);
	}
	
	/**邮件服务器*/
	private static final String EMAIL_HOST_KEY = "mail.smtp.host";
	public static final String EMAIL_HOST = PropertiesUtils.getProperty(EMAIL_HOST_KEY);
	
	/**用户名*/
	private static final String EMAIL_USERNAME_KEY = "mail.smtp.username";
	public static final String EMAIL_USERNAME = PropertiesUtils.getProperty(EMAIL_USERNAME_KEY);
	
	/**用户昵称*/
	private static final String EMAIL_USERNAME_NAME_KEY = "mail.smtp.from.name";
	public static final String EMAIL_USERNAME_NAME = PropertiesUtils.getProperty(EMAIL_USERNAME_NAME_KEY);
	
	/**用户密码*/
	private static final String EMAIL_PASSWORD_KEY = "mail.smtp.password";
	public static final String EMAIL_PASSWORD = PropertiesUtils.getProperty(EMAIL_PASSWORD_KEY);	
	
	/**接收人*/
	private static final String EMAIL_TO_KEY = "mail.smtp.to";
	public static final String EMAIL_TO = PropertiesUtils.getProperty(EMAIL_TO_KEY);
	
	/**发送人*/
	private static final String EMAIL_FROM_KEY = "mail.smtp.from";
	public static final String EMAIL_FROM = PropertiesUtils.getProperty(EMAIL_FROM_KEY);	
	
	/**服务器进行认证,认证用户名和密码是否正确*/
	private static final String EMAIL_SMTP_AUTH_KEY = "mail.smtp.auth";
	public static final String EMAIL_SMTP_AUTH = PropertiesUtils.getProperty(EMAIL_SMTP_AUTH_KEY);
	
	/**超时时间设定*/
	private static final String EMAIL_SMTP_TIMEOUT_KEY = "mail.smtp.timeout";
	public static final String EMAIL_SMTP_TIMEOUT = PropertiesUtils.getProperty(EMAIL_SMTP_TIMEOUT_KEY);
	
	/**编码设置*/
	private static final String EMAIL_ENCODING_KEY = "mail.smtp.encoding";
	public static final String EMAIL_ENCODING = PropertiesUtils.getProperty(EMAIL_ENCODING_KEY);
	
	/**STARTTLS是对纯文本通信协议的扩展。*/
	private static final String EMAIL_SMTP_STARTTLS_KEY = "mail.smtp.starttls.enable";
	public static final String EMAIL_SMTP_STARTTLS = PropertiesUtils.getProperty(EMAIL_SMTP_STARTTLS_KEY);
	
	//private static final String EMAIL_SMTP_SOCKETFACTORY_CLASS_KEY = "mail.smtp.socketFactory.class";
	//public static final String EMAIL_SMTP_SOCKETFACTORY_CLASS = ReadConfigEmail.getPropertyByKey(EMAIL_SMTP_SOCKETFACTORY_CLASS_KEY);
	
	/**安全认证设置*/
	public static Properties safetyProperties = new Properties();
	
	static{
		//调试信息,可以取消
		//System.setProperty( "javax.net.debug", "ssl");		
		/**
		 * #配置JavaMail的Properties时，不要指定“mail.smtp.socketFactory.class”，
		   #因为TLS使用的是普通的Socket。然后指定属性“mail.smtp.starttls.enable”为“true”。
		 * */		
		safetyProperties.put(EMAIL_SMTP_AUTH_KEY, EMAIL_SMTP_AUTH); 
		safetyProperties.put(EMAIL_SMTP_TIMEOUT_KEY, EMAIL_SMTP_TIMEOUT); 
		safetyProperties.put(EMAIL_SMTP_STARTTLS_KEY, EMAIL_SMTP_STARTTLS); 
		//safetyProperties.put(EMAIL_SMTP_SOCKETFACTORY_CLASS_KEY, EMAIL_SMTP_SOCKETFACTORY_CLASS);
	}	
}
