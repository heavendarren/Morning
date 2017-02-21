package com.pussinboots.morning.os.modules.email.service.impl;

import java.io.File;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.pussinboots.morning.common.util.DateUtils;
import com.pussinboots.morning.os.modules.email.entity.EmailMsg;
import com.pussinboots.morning.os.modules.email.service.IEmailSendService;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：EmailSendServiceImpl   
* 类描述：EmailSend 邮件发送业务逻辑层接口实现类     
* 创建人：陈星星   
* 创建时间：2017年2月21日 下午11:39:27   
*
 */
@Service("emailSendService")
@SuppressWarnings("deprecation")
public class EmailSendServiceImpl implements IEmailSendService{
    
	private static Logger logger = LoggerFactory.getLogger(EmailSendServiceImpl.class);
	
	@Autowired
    private JavaMailSenderImpl javaMailSender; 
	@Autowired
    private VelocityEngine velocityEngine ;
	
	@Override
	public void sendMail(EmailMsg emailMsg) {
		String[] toEmail = emailMsg.getToEmails().split(",");
		for (String email : toEmail) {
			emailMsg.setToEmails(email);
			try {
				sendMail(emailMsg);
			} catch (Exception e) {
				logger.error("UserEmailMsgServiceImpl.batchSendEmail={}", e);
			}
		}
	}

	@Override
	public boolean sendMails(EmailMsg emailMsg) {
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
            helper.setSentDate(new Date());
           
            // 发送邮件 
			javaMailSender.send(mime);
			
			logger.info("发送了一封邮件<" + emailMsg.getToEmails() + ">,主题为<" + emailMsg.getSubject() + ">,时间为<" + DateUtils.formatDateTime(new Date()) + ">");
			return true;
		}catch(Exception e){
			logger.error("MailServiceImpl.sendMail", e);
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
				logger.error("MailServiceImpl.setAddInline={}", e);
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
				logger.info("MailServiceImpl.setAddAttachment={}", e);
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
			logger.error("MailServiceImpl.sendWithTemplate={}", e);
		}
	}

}