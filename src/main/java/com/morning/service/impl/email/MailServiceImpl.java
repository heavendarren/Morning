package com.morning.service.impl.email;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.xml.rpc.ServiceException;

import org.apache.log4j.Logger;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.task.TaskExecutor;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.morning.entity.email.EmailEntity;
import com.morning.entity.email.UserEmailMsg;
import com.morning.service.email.MailService;

/**
 * 
 * @description：邮箱发送业务层实现
 * @author CXX
 * @version 创建时间：2016年9月4日  下午10:36:56
 */
@Service("mailService")
public class MailServiceImpl implements MailService{
    
	private static Logger logger = Logger.getLogger(MailServiceImpl.class);
	
	//创建邮件发送器
    private ApplicationContext context = new FileSystemXmlApplicationContext("classpath:/app-mail.xml");
    
    private JavaMailSenderImpl javaMailSender = (JavaMailSenderImpl)context.getBean("javaMailSender"); 
	
    private VelocityEngine velocityEngine = (VelocityEngine)context.getBean("velocityEngine");
    
    private TaskExecutor taskExecutor =(TaskExecutor)context.getBean("taskExecutor");
    
	/**
	 * 判断同步或者异步发送
	 * @param userEmailMsg
	 * @throws Exception
	 */
	public void sendMail(UserEmailMsg userEmailMsg) throws Exception {
		
		if (userEmailMsg.getToEmails() == null || userEmailMsg.getAddressArray().length == 0) {
			throw new ServiceException("收件人邮箱不得为空！");
		}
		
		if (userEmailMsg.getAddressArray().length > 5) {// 收件地址大于5时，异步发送
			sendMailByAsynchronousMode(userEmailMsg);
		} else {
			try {
				sendMailBySynchronizationMode(userEmailMsg);
			} catch (Exception e) {
				throw new Exception(e);
			}
		}
	}

	/**
	 * 实现异步只需把同步发送放到Concurrent里面执行
	 * @param userEmailMsg
	 * @throws Exception
	 */
	public void sendMailByAsynchronousMode(final UserEmailMsg userEmailMsg) throws Exception {
		taskExecutor.execute(new Runnable() {
			public void run() {
				try {
					logger.error("正在执行异步发送邮件！");
					sendMailBySynchronizationMode(userEmailMsg);
				} catch (Exception e) {
				  try {
					throw new Exception(e);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				}
			}
		});
	}
	
	/**
	 * 同步发送邮件
	 * @param userEmailMsg
	 * @throws Exception
	 */
	public void sendMailBySynchronizationMode(UserEmailMsg userEmailMsg)throws Exception {
		try{
			//使用JavaMail的MimeMessage，支付更加复杂的邮件格式和内容
			MimeMessage mime = javaMailSender.createMimeMessage();
			
			//创建MimeMessageHelper对象，处理MimeMessage的辅助类  
			MimeMessageHelper helper = new MimeMessageHelper(mime, true, javaMailSender.getDefaultEncoding());
			
            // 设置发件人邮箱
            Address address = new InternetAddress(EmailEntity.EMAIL_FROM,EmailEntity.EMAIL_USERNAME_NAME );   
            helper.setFrom((InternetAddress) address);
			
            //设置收件人
            setToEmails(userEmailMsg,helper);
           
			//设置抄送
			if (userEmailMsg.getCcEmails() != null && userEmailMsg.getCcEmails().trim().length() > 0) {
				String cc[] = userEmailMsg.getCcEmails().split(";");
				helper.setCc(cc);// 抄送
			}
			// 设置邮件主题
			helper.setSubject(userEmailMsg.getSubject());
			
			// 设置邮件内容：true表示设定html格式
            if (userEmailMsg.getContent()!=null) {
            	helper.setText(userEmailMsg.getContent(), true);
            } else {
            	sendWithTemplate(userEmailMsg, helper);
            }
            
            //设置邮件图片
            setAddInline(userEmailMsg, helper);
            
            //设置邮件附件
            setAddAttachment(userEmailMsg, helper);
            
            //设置邮件发送时间
            helper.setSentDate(new Date());
           
            // 发送邮件 
			javaMailSender.send(mime);
			logger.info("发送了一封邮件<" + userEmailMsg.getToEmails() + ">,主题为<" + userEmailMsg.getSubject() + ">,时间为<" + new Date() + ">");
		}catch(Exception e){
			throw new Exception(e);
		}
	}
	
	/**
	 * 
	 * @description：配置邮件服务器
	 * @author CXX
	 * @version 创建时间：2016年8月6日  下午2:32:55
	 */
	public  static class JavaMailFactory {
		private static JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
		static{
			senderImpl.setHost(EmailEntity.EMAIL_HOST);
			senderImpl.setUsername(EmailEntity.EMAIL_USERNAME); 
			senderImpl.setPassword(EmailEntity.EMAIL_PASSWORD); 		
			senderImpl.setJavaMailProperties(EmailEntity.safetyProperties);
		}
		public static JavaMailSenderImpl getJavaMail(){	
			return senderImpl;
		}
	}
	
	/**
	 * 接受人地址
	 * @param userEmailMsg
	 * @param helper
	 * @throws Exception
	 */
	public  void setToEmails(UserEmailMsg userEmailMsg,MimeMessageHelper helper) throws Exception{
        // 设置收件人邮箱
        if (userEmailMsg.getToEmails()!=null) {
            String[] toEmailArray = userEmailMsg.getAddressArray();

            List<String> toEmailList = new ArrayList<String>();
            if (null == toEmailArray || toEmailArray.length <= 0) {
            	throw new ServiceException("收件人邮箱不得为空！");
            } else {
                for (String s : toEmailArray) {
                    if (s!=null&&!s.equals("")) {
                        toEmailList.add(s);
                    }
                }
                if (null == toEmailList || toEmailList.size() <= 0) {
                	throw new ServiceException("收件人邮箱不得为空！");
                } else {
                    toEmailArray = new String[toEmailList.size()];
                    for (int i = 0; i < toEmailList.size(); i++) {
                        toEmailArray[i] = toEmailList.get(i);
                    }
                }
            }
            helper.setTo(toEmailArray);
        } else {
        	helper.setTo(EmailEntity.EMAIL_TO); //如果失败，发邮件给properties设置的收件人
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
	public void setAddInline(UserEmailMsg userEmailMsg,MimeMessageHelper helper) throws ServiceException, MessagingException {
        // 添加图片
        if (null != userEmailMsg.getPictures()) {
            for (Iterator<Map.Entry<String, String>> it = userEmailMsg.getPictures().entrySet().iterator(); it.hasNext();) {
                Map.Entry<String, String> entry = it.next();
                String cid = entry.getKey();
                String filePath = entry.getValue();
                if (null == cid || null == filePath) {
                	throw new ServiceException("请确认每张图片的ID和图片地址是否齐全！");
                }
                File file = new File(filePath);
                if (!file.exists()) {
                	throw new ServiceException("请确认每张图片的ID和图片地址是否齐全！");
                }
                FileSystemResource img = new FileSystemResource(file);
                helper.addInline(cid, img);
            }
        }
	}
	/**
	 * 加入附件文件
	 * @param userEmailMsg
	 * @param helper
	 * @throws MessagingException
	 * @throws Exception
	 */
	public void setAddAttachment(UserEmailMsg userEmailMsg,MimeMessageHelper helper) throws MessagingException, Exception{
        // 添加附件
        if (null != userEmailMsg.getAttachments()) {
            for (Iterator<Map.Entry<String, String>> it = userEmailMsg.getAttachments().entrySet().iterator(); it.hasNext();) {
                Map.Entry<String, String> entry = it.next();
                String cid = entry.getKey();
                String filePath = entry.getValue();
                if (null == cid || null == filePath) {
                	throw new ServiceException("请确认每个附件的ID和地址是否齐全！");
                }
                File file = new File(filePath);
                if (!file.exists()) {
                	throw new ServiceException("请确认每个附件的ID和地址是否齐全！");
                }
                FileSystemResource fileResource = new FileSystemResource(file);
                helper.addAttachment(cid, fileResource);
            }
        }
	}
	
    /**
	 * 验证邮箱格式 去重
	 * 
	 * @param emailStr
	 */
	public Map<String, Object> checkEmail(String emailStr) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		emailStr = emailStr.trim();
		emailStr = emailStr.replaceAll("\r\n", "");// 去除空格回车
		emailStr = emailStr.replaceAll(" ", "");// 去除空格回车
		emailStr = emailStr.replaceAll("；", ";");
		emailStr = emailStr.replaceAll(",", ";");
		emailStr = emailStr.replaceAll("，", ";");

		String[] lm = emailStr.split(";");// 定义数组
		
		List<String> list = new ArrayList<String>();// new一个arralist
		Set<String> set = new HashSet<String>();// new 一个hashset
		set.addAll(Arrays.asList(lm));// 将数组转为list并存入set中，就可以去掉重复项了
		for (Iterator<String> it = set.iterator(); it.hasNext();) {
			list.add((String) it.next());// 遍历set 将所有元素键入list中
		}
		String noRepeatList = list.toString();
		noRepeatList = noRepeatList.replace("[", "");
		noRepeatList = noRepeatList.replace("]", "");
		noRepeatList = noRepeatList.replace(" ", "");
		noRepeatList = noRepeatList.trim();
		
		boolean flag = true;
		String errorMessage = "";
		String[] lms = noRepeatList.split(",");
		if (lms.length > 0) {
			for (int i = 0; i < lms.length; i++) {
				if (!lms[i].trim().matches("^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$")) {
					flag = false;
					errorMessage = lms[i] + "格式有误";
					break;
				}
			}
		}

		returnMap.put("flag", flag);
		returnMap.put("returnList", noRepeatList);
		returnMap.put("errorMessage", errorMessage);
		return returnMap;
	}
	
	/**
	 * 以velocity为模板发送邮件
	 * @param userEmailMsg
	 * @param helper
	 * @param model
	 */
	public void sendWithTemplate(UserEmailMsg userEmailMsg,MimeMessageHelper helper){  
		try {  
			// Spring提供的VelocityEngineUtils将模板进行数据填充，并转换成普通的String对象  
			String emailText = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,"templates/"+userEmailMsg.getVelocityTemplate() , EmailEntity.EMAIL_ENCODING,userEmailMsg.getModel());  
			helper.setText(emailText, true); 
		} catch (Exception e) {
			logger.error("MailServiceImpl.sendWithTemplate", e);
		}  	
	}
}