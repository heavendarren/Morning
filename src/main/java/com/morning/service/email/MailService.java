package com.morning.service.email;

import java.util.Map;

import javax.mail.MessagingException;
import javax.xml.rpc.ServiceException;

import org.springframework.mail.javamail.MimeMessageHelper;

import com.morning.entity.email.UserEmailMsg;

/**
 * 
 * @description：邮箱发送业务层接口
 * @author CXX
 * @version 创建时间：2016年9月4日  上午1:47:28
 */
public interface MailService {
	
	/**
	 * 邮件发送统一入口
	 * @param email
	 * 
	 */
	public abstract void sendMail(UserEmailMsg userEmailMsg) throws Exception;

	/**
	 * 异步发送
	 */
	public abstract void sendMailByAsynchronousMode(final UserEmailMsg userEmailMsg) throws Exception;

	/**
	 * 同步发送
	 */
	public abstract void sendMailBySynchronizationMode(UserEmailMsg userEmailMsg) throws Exception;
	
	/**
	 * 接受人地址
	 * @param userEmailMsg
	 * @param helper
	 * @throws Exception
	 */
	public abstract void setToEmails(UserEmailMsg userEmailMsg,MimeMessageHelper helper) throws Exception;
	
	/**
	 * 加入图片文件
	 * @param userEmailMsg
	 * @param helper
	 * @throws ServiceException
	 * @throws MessagingException
	 */
	public void setAddInline(UserEmailMsg userEmailMsg,MimeMessageHelper helper) throws ServiceException, MessagingException;
	
	/**
	 * 加入附件文件
	 * @param userEmailMsg
	 * @param helper
	 * @throws MessagingException
	 * @throws Exception
	 */
	public void setAddAttachment(UserEmailMsg userEmailMsg,MimeMessageHelper helper) throws MessagingException, Exception;
	
	/**
	 * 验证邮箱格式 去重
	 * @param emailStr
	 * @return
	 */
	public Map<String, Object> checkEmail(String emailStr);
	
	/**
	 * 以velocity为模板发送邮件
	 * @param userEmailMsg
	 * @param helper
	 */
	public void sendWithTemplate(UserEmailMsg userEmailMsg,MimeMessageHelper helper);
}
