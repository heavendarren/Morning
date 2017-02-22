package com.pussinboots.morning.os.modules.email.controller;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.result.ResponseResult;
import com.pussinboots.morning.common.util.RegexUtils;
import com.pussinboots.morning.os.modules.email.entity.Email;
import com.pussinboots.morning.os.modules.email.enums.EmailTypeEnum;
import com.pussinboots.morning.os.modules.email.service.IEmailSendService;
import com.pussinboots.morning.os.modules.email.service.IEmailService;

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
	private IEmailSendService emailSendService;
	@Autowired
	private IEmailService emailService;
	
	/**
	 * POST 找回密码,发送邮件
	 * @return
	 */
	@PostMapping(value = "/sendEmailTicket")
	@ResponseBody
	public ResponseResult sendEmailTicket(@RequestParam("email") String email) {
		if (!RegexUtils.isEmail(email)) {
			return fail(false, "请输入正确的邮箱地址");
		}

		Map<String, Object> returnMap = emailSendService.sendMailByVelocity(email, EmailTypeEnum.FORGET.getType());

		if ((boolean) returnMap.get("result")) {
			return success(true, "邮件发送成功!", returnMap.get("emailSign"));
		} else {
			return fail(false, "邮件发送失败,请联系管理员处理!");
		}
	}
	
	/**
	 * POST 注册账号,发送邮件
	 * @return
	 */
	@PostMapping(value = "/sendEmailRegister")
	@ResponseBody
	public ResponseResult sendEmailRegister(@RequestParam("email") String email) {
		if (!RegexUtils.isEmail(email)) {
			return fail(false, "请输入正确的邮箱地址");
		}

		Map<String, Object> returnMap = emailSendService.sendMailByVelocity(email, EmailTypeEnum.REGISTER.getType());

		if ((boolean) returnMap.get("result")) {
			return success(true, "邮件发送成功!", returnMap.get("emailSign"));
		} else {
			return fail(false, "邮件发送失败,请联系管理员处理!");
		}
	}
	
	/**
	 * POST 验证邮箱验证码
	 * @return
	 */
	@PostMapping(value = "/verifyEmail")
	@ResponseBody
	public ResponseResult verifyEmail(@RequestParam("email") String email, @RequestParam("captcha") String captcha,
			@RequestParam("emailSign") Long emailSign) {
		Email queryEmail = emailService.selectByEmailSign(emailSign);
		if (queryEmail == null) {
			return fail(false, "该邮件不存在,请重新发送邮件!");
		}
		boolean result = queryEmail.getUserEmail().equals(email) && queryEmail.getCaptcha().equals(captcha);
		if (!result) {
			return fail(false, "验证码错误,请重新输入!");
		}
		if (new Date().after(queryEmail.getEndTime())) { // 验证验证时间是否过期
			return fail(false, "验证码已过期,请重新输入验证码");
		}
		return success(true);
	}
}
