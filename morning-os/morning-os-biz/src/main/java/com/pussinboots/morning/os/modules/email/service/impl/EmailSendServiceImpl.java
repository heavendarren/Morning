package com.pussinboots.morning.os.modules.email.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.pussinboots.morning.common.email.EmailMsg;
import com.pussinboots.morning.common.email.EmailSendManager;
import com.pussinboots.morning.common.util.DateUtils;
import com.pussinboots.morning.os.common.util.EmailUtils;
import com.pussinboots.morning.os.modules.email.entity.Email;
import com.pussinboots.morning.os.modules.email.enums.EmailSendStatusEnum;
import com.pussinboots.morning.os.modules.email.enums.EmailTypeEnum;
import com.pussinboots.morning.os.modules.email.mapper.EmailMapper;
import com.pussinboots.morning.os.modules.email.service.IEmailSendService;
import com.pussinboots.morning.os.modules.user.mapper.UserMapper;

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
public class EmailSendServiceImpl implements IEmailSendService{
    
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private EmailMapper emailMapper;
	
	@Override
	public Map<String, Object> sendMailByVelocity(String email, Integer type) {
		Map<String, Object> returnMap = new HashMap<>();
		Date startTime = new Date(); // 发送时间
		Date endTime = DateUtils.getOffsiteDate(startTime, Calendar.MINUTE, EmailUtils.getCaptchaTime());// 验证时间向后偏移3分钟
		String captcha = EmailUtils.getCaptcha(); // 验证码
		Map<String, Object> model = new HashMap<>();
		model.put("createTime", startTime);
		model.put("captcha", captcha);
		model.put("email", email);
		model.put("userNumber", userMapper.selectByLoginName(email).getUserNumber());
		
		EmailMsg emailMsg = new EmailMsg();
		emailMsg.setToEmails(email); // 收件人
		emailMsg.setSubject(EmailTypeEnum.stateOf(type).getEmailSubject());// 邮件主题
		emailMsg.setVelocityTemplate(EmailTypeEnum.stateOf(type).getVelocityTemplate());// 模版
		emailMsg.setModel(model);// 邮件正文
		
		EmailSendManager emailSendManager = new EmailSendManager();
		boolean result = emailSendManager.sendMail(emailMsg);
		Email emailRecord = new Email(EmailUtils.getEmailSign(), email, EmailTypeEnum.stateOf(type).getType(), startTime,
				startTime, endTime, EmailSendStatusEnum.resultOf(result).getStatus(), captcha,
				EmailTypeEnum.stateOf(type).getEmailSubject(), JSON.toJSON(model).toString());
		emailMapper.insert(emailRecord);
		returnMap.put("result", result);
		returnMap.put("emailSign", emailRecord.getEmailSign());
		return returnMap;
	}
	
}