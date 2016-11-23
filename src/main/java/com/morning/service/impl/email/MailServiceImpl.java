package com.morning.service.impl.email;

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

import com.morning.common.util.toolbox.DateUtil;
import com.morning.entity.email.UserEmailMsg;
import com.morning.service.email.MailService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：MailServiceImpl   
* 类描述：邮箱发送业务逻辑层实现  
* 创建人：陈星星   
* 创建时间：2016年11月5日 上午2:08:52   
* 修改人：陈星星   
* 修改时间：2016年11月5日 上午2:08:52   
* 修改备注：   
* @version    
 */
@Service("mailService")
public class MailServiceImpl implements MailService{
    
	private static Logger logger = LoggerFactory.getLogger(MailServiceImpl.class);
	
	@Autowired
    private JavaMailSenderImpl javaMailSender; 
	@Autowired
    private VelocityEngine velocityEngine ;
	
	/**
	 * 发送邮箱
	 * @param userEmailMsg
	 * @throws Exception
	 */
	public void sendMail(UserEmailMsg userEmailMsg) {
		try{
			//使用JavaMail的MimeMessage，支付更加复杂的邮件格式和内容
			MimeMessage mime = javaMailSender.createMimeMessage();
			
			//创建MimeMessageHelper对象，处理MimeMessage的辅助类  
			MimeMessageHelper helper = new MimeMessageHelper(mime, true, javaMailSender.getDefaultEncoding());
            
			// 设置发件人邮箱
            Address address = new InternetAddress(javaMailSender.getUsername(),userEmailMsg.getFromName());   
            helper.setFrom((InternetAddress) address);
			
            //设置收件人
			if (userEmailMsg.getToEmails() != null && userEmailMsg.getToEmails().trim().length() > 0) {
				String[]  to= userEmailMsg.getToEmails().split(";");
				helper.setTo(to);
			}
			
			//设置抄送
			if (userEmailMsg.getCcEmails() != null && userEmailMsg.getCcEmails().trim().length() > 0) {
				String[] cc = userEmailMsg.getCcEmails().split(";");
				helper.setCc(cc);
			}
			
			// 设置邮件主题
			helper.setSubject(userEmailMsg.getSubject());
			
			// 设置邮件内容：true表示设定html格式
            if (userEmailMsg.getContent()!=null) {
            	helper.setText(userEmailMsg.getContent(), true);
            } else {
            	this.sendWithTemplate(userEmailMsg, helper);
            }
            
            //设置邮件图片
            if (null != userEmailMsg.getPictures()) {
                this.setAddInline(userEmailMsg, helper);
            }
            
            //设置邮件附件
            if (null != userEmailMsg.getAttachments()) {
                this.setAddAttachment(userEmailMsg, helper);           	
            }

            //设置邮件发送时间
            helper.setSentDate(new Date());
           
            // 发送邮件 
			javaMailSender.send(mime);
			
			logger.info("发送了一封邮件<" + userEmailMsg.getToEmails() + ">,主题为<" + userEmailMsg.getSubject() + ">,时间为<" + DateUtil.formatDateTime(new Date()) + ">,线程名为<"+ Thread.currentThread().getName() + ">" );
		}catch(Exception e){
			logger.error("MailServiceImpl.sendMail", e);
		}
	}

	
	
	/**
	 * 加入图片文件
	 * @param userEmailMsg
	 * @param helper
	 * @throws ServiceException 
	 * @throws MessagingException 
	 * @throws Exception 
	 */
	public void setAddInline(UserEmailMsg userEmailMsg,MimeMessageHelper helper){
        // 添加图片
        for (Iterator<Map.Entry<String, String>> it = userEmailMsg.getPictures().entrySet().iterator(); it.hasNext();) {
            Map.Entry<String, String> entry = it.next();
            String cid = entry.getKey();
            String filePath = entry.getValue();
            File file = new File(filePath);
            FileSystemResource img = new FileSystemResource(file);
            try {
				helper.addInline(cid, img);
			} catch (MessagingException e) {
				e.printStackTrace();
				logger.error("MailServiceImpl.setAddInline", e);
			}
        }
	}
	
	/**
	 * 加入附件
	 */
	public void setAddAttachment(UserEmailMsg userEmailMsg,
			MimeMessageHelper helper) {
		for (Iterator<Map.Entry<String, String>> it = userEmailMsg
				.getAttachments().entrySet().iterator(); it.hasNext();) {
			Map.Entry<String, String> entry = it.next();
			String cid = entry.getKey();
			String filePath = entry.getValue();
			File file = new File(filePath);
			FileSystemResource fileResource = new FileSystemResource(file);
			try {
				helper.addAttachment(cid, fileResource);
			} catch (MessagingException e) {
				logger.info("MailServiceImpl.setAddAttachment", e);
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 以velocity为模板发送邮件
	 * @param userEmailMsg
	 * @param helper
	 * @param model
	 */
	public void sendWithTemplate(UserEmailMsg userEmailMsg,
			MimeMessageHelper helper) {
		try {
			// Spring提供的VelocityEngineUtils将模板进行数据填充，并转换成普通的String对象
			String emailText = VelocityEngineUtils.mergeTemplateIntoString(
					velocityEngine,
					"templates/" + userEmailMsg.getVelocityTemplate(),
					javaMailSender.getDefaultEncoding(),
					userEmailMsg.getModel());
			helper.setText(emailText, true);
		} catch (Exception e) {
			logger.error("MailServiceImpl.sendWithTemplate", e);
		}
	}
}