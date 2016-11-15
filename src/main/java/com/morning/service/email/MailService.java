package com.morning.service.email;

import javax.mail.MessagingException;

import org.springframework.mail.javamail.MimeMessageHelper;

import com.morning.entity.email.UserEmailMsg;

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
public interface MailService {
	
	/**
	 * 邮件发送统一入口
	 * @param email
	 * 
	 */
	public void sendMail(UserEmailMsg userEmailMsg);
	
	/**
	 * 加入图片文件
	 * @param userEmailMsg
	 * @param helper
	 * @throws ServiceException
	 * @throws MessagingException
	 */
	public void setAddInline(UserEmailMsg userEmailMsg,MimeMessageHelper helper);
	
	/**
	 * 加入附件文件
	 * @param userEmailMsg
	 * @param helper
	 * @throws MessagingException
	 * @throws Exception
	 */
	public void setAddAttachment(UserEmailMsg userEmailMsg,MimeMessageHelper helper);

	/**
	 * 以velocity为模板发送邮件
	 * @param userEmailMsg
	 * @param helper
	 */
	public void sendWithTemplate(UserEmailMsg userEmailMsg,MimeMessageHelper helper);
}
