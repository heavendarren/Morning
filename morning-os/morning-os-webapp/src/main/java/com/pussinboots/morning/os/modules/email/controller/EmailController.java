package com.pussinboots.morning.os.modules.email.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.result.ResponseResult;
import com.pussinboots.morning.common.util.DateUtils;
import com.pussinboots.morning.common.util.RegexUtils;
import com.pussinboots.morning.common.util.ServletUtils;
import com.pussinboots.morning.os.common.util.EmailUtils;
import com.pussinboots.morning.os.modules.email.entity.Email;
import com.pussinboots.morning.os.modules.email.entity.EmailMsg;
import com.pussinboots.morning.os.modules.email.enums.EmailStatusEnum;
import com.pussinboots.morning.os.modules.email.enums.EmailTypeEnum;
import com.pussinboots.morning.os.modules.email.service.IEmailSendService;
import com.pussinboots.morning.os.modules.email.service.IEmailService;
import com.pussinboots.morning.os.modules.user.service.IUserService;

/**
 * 
* 项目名称：morning-os-webapp   
* 类名称：EmailController   
* 类描述：邮件发送表示层控制器     
* 创建人：陈星星   
* 创建时间：2017年2月21日 下午11:05:30   
*
 */
@Controller
public class EmailController extends BaseController {
	
	@Autowired
	private IUserService userService;
	@Autowired
	private IEmailSendService emailSendService;
	@Autowired
	private IEmailService emailService;
	
	@PostMapping(value = "/sendEmailTicket")
	@ResponseBody
	public ResponseResult sendEmailTicket() {
		String email = ServletUtils.getParameter("email");
		
		if (!RegexUtils.isEmail(email)) {
			return fail(false, "请输入正确的邮箱地址");
		}
		
		Date startTime = new Date(); // 发送时间
		Date endTime = DateUtils.getOffsiteDate(startTime, Calendar.MINUTE, EmailUtils.getCaptchaTime());// 验证时间向后偏移3分钟
		String captcha = EmailUtils.getCaptcha(); // 验证码
		Map<String, Object> model = new HashMap<>();
		model.put("createTime", startTime);
		model.put("captcha", captcha);
		model.put("email", ServletUtils.getParameter("email"));
		model.put("userNumber", userService.selectByLoginName(email).getUserNumber());
		
		EmailMsg emailMsg = new EmailMsg();
		emailMsg.setToEmails(ServletUtils.getParameter("email")); // 收件人
		emailMsg.setSubject(EmailTypeEnum.FORGET.getEmailSubject());// 邮件主题
		emailMsg.setVelocityTemplate("PswCaptcha.vm");// 模版
		emailMsg.setModel(model);// 邮件正文
		
		boolean result = emailSendService.sendMails(emailMsg);
		Email emailRecord = new Email(EmailUtils.getEmailSign(), email, EmailTypeEnum.FORGET.getType(), startTime,
				startTime, endTime, EmailStatusEnum.resultOf(result).getStatus(), captcha,
				EmailTypeEnum.FORGET.getEmailSubject(), JSON.toJSON(model).toString());
		emailService.insertByEmail(emailRecord);
		if(result){
			return success(true, "邮件发送成功!");
		}else {
			return fail(false, "邮件发送失败,请联系管理员处理!");
		}
	}

}
