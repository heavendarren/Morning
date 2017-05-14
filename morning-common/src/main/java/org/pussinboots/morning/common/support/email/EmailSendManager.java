package org.pussinboots.morning.common.support.email;

import java.io.File;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.pussinboots.morning.common.util.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.velocity.VelocityEngineUtils;

/**
 * 
* 项目名称：morning-common-provider   
* 类名称：EmailSendManager   
* 类描述：邮件发送支持类   
* 创建人：陈星星   
* 创建时间：2017年3月6日 下午10:40:59   
*
 */
@SuppressWarnings("deprecation")
public class EmailSendManager {
	
	private static Logger logger = LoggerFactory.getLogger(EmailSendManager.class);
	
	ApplicationContext context = new FileSystemXmlApplicationContext("classpath:spring/applicationContext-mail.xml");
	
	JavaMailSenderImpl javaMailSender = (JavaMailSenderImpl) context.getBean("javaMailSender");
	
	VelocityEngine velocityEngine = (VelocityEngine) context.getBean("velocityEngine");
	
	public boolean sendMail(EmailMsg emailMsg) {
		try{
			//使用JavaMail的MimeMessage，支付更加复杂的邮件格式和内容
			MimeMessage mime = javaMailSender.createMimeMessage();
			
			//创建MimeMessageHelper对象，处理MimeMessage的辅助类  
			MimeMessageHelper helper = new MimeMessageHelper(mime, true, javaMailSender.getDefaultEncoding());
            
			// 设置发件人邮箱
            Address address = new InternetAddress(javaMailSender.getUsername(),emailMsg.getFromName());   
            helper.setFrom((InternetAddress) address);
			
            //设置收件人
			if (emailMsg.getToEmails() != null && emailMsg.getToEmails().trim().length() > 0) {
				String[]  to= emailMsg.getToEmails().split(";");
				helper.setTo(to);
			}
			
			//设置抄送
			if (emailMsg.getCcEmails() != null && emailMsg.getCcEmails().trim().length() > 0) {
				String[] cc = emailMsg.getCcEmails().split(";");
				helper.setCc(cc);
			}
			
			// 设置邮件主题
			helper.setSubject(emailMsg.getSubject());
			
			// 设置邮件内容：true表示设定html格式
            if (emailMsg.getContent()!=null) {
            	helper.setText(emailMsg.getContent(), true);
            } else {
            	this.sendWithTemplate(emailMsg, helper);
            }
            
            //设置邮件图片
            if (null != emailMsg.getPictures()) {
                this.setAddInline(emailMsg, helper);
            }
            
            //设置邮件附件
            if (null != emailMsg.getAttachments()) {
                this.setAddAttachment(emailMsg, helper);           	
            }

            //设置邮件发送时间
            if (null != emailMsg.getSendTime()) {
            	helper.setSentDate(emailMsg.getSendTime());
            }else {
                helper.setSentDate(new Date());           	
            }

            // 发送邮件 
			javaMailSender.send(mime);
			
			logger.info("发送了一封邮件<" + emailMsg.getToEmails() + ">,主题为<" + emailMsg.getSubject() + ">,时间为<" + DateUtils.formatDateTime(new Date()) + ">");
			return true;
		}catch(Exception e){
			logger.error("EmailSendManager.sendMail", e);
			return false;
		}
	}

	/**
	 * 加入图片文件
	 * @param emailMsg
	 * @param helper
	 */
	private void setAddInline(EmailMsg emailMsg, MimeMessageHelper helper){
        // 添加图片
        for (Iterator<Map.Entry<String, String>> it = emailMsg.getPictures().entrySet().iterator(); it.hasNext();) {
            Map.Entry<String, String> entry = it.next();
            String cid = entry.getKey();
            String filePath = entry.getValue();
            File file = new File(filePath);
            FileSystemResource img = new FileSystemResource(file);
            try {
				helper.addInline(cid, img);
			} catch (MessagingException e) {
				logger.error("EmailSendManager.setAddInline={}", e);
			}
        }
	}
	
	/**
	 * 加入附件
	 * @param emailMsg
	 * @param helper
	 */
	private void setAddAttachment(EmailMsg emailMsg, MimeMessageHelper helper) {
		for (Iterator<Map.Entry<String, String>> it = emailMsg.getAttachments().entrySet().iterator(); it.hasNext();) {
			Map.Entry<String, String> entry = it.next();
			String cid = entry.getKey();
			String filePath = entry.getValue();
			File file = new File(filePath);
			FileSystemResource fileResource = new FileSystemResource(file);
			try {
				helper.addAttachment(cid, fileResource);
			} catch (MessagingException e) {
				logger.info("EmailSendManager.setAddAttachment={}", e);
			}
		}
	}
	
	/**
	 * 以velocity为模板发送邮件
	 * @param emailMsg
	 * @param helper
	 */
	private void sendWithTemplate(EmailMsg emailMsg, MimeMessageHelper helper) {
		try {
			// Spring提供的VelocityEngineUtils将模板进行数据填充，并转换成普通的String对象
			String emailText = VelocityEngineUtils.mergeTemplateIntoString(
					velocityEngine,
					"templates/" + emailMsg.getVelocityTemplate(),
					javaMailSender.getDefaultEncoding(),
					emailMsg.getModel());
			helper.setText(emailText, true);
		} catch (Exception e) {
			logger.error("EmailSendManager.sendWithTemplate={}", e);
		}
	}

}
