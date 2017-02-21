package com.pussinboots.morning.os.modules.email.service;

import com.pussinboots.morning.os.modules.email.entity.EmailMsg;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：MailService   
* 类描述：邮箱发送业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年9月4日  上午1:47:28 
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:54:01   
* @version
 */
/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IEmailSendService   
* 类描述：EmailSend 邮件发送业务逻辑层接口         
* 创建人：陈星星   
* 创建时间：2017年2月21日 下午11:20:24   
*
 */
public interface IEmailSendService {
	
	
	/**
	 * 邮件发送统一入口（群发）
	 * @param email String toEmails;// 收件人邮箱，多个邮箱以“,”分隔
	 * @return boolean true:成功/falase:失败
	 */
	boolean sendMails(EmailMsg emailMsg);
	
	/**
	 * 邮件发送（个人）
	 * @param emailMsg String toEmails;// 收件人邮箱，多个邮箱以“,”分隔
	 */
	void sendMail(EmailMsg emailMsg);
	
}
