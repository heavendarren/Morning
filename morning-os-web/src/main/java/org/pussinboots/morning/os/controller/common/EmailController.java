package org.pussinboots.morning.os.controller.common;

import java.util.Date;

import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.constant.CommonReturnCode;
import org.pussinboots.morning.common.util.RegexUtils;
import org.pussinboots.morning.online.common.constant.EmailReturnCode;
import org.pussinboots.morning.online.common.enums.EmailTypeEnum;
import org.pussinboots.morning.online.entity.Email;
import org.pussinboots.morning.online.pojo.dto.EmailSendResultDTO;
import org.pussinboots.morning.online.service.IEmailSendService;
import org.pussinboots.morning.online.service.IEmailService;
import org.pussinboots.morning.os.common.result.OsResult;
import org.pussinboots.morning.user.entity.User;
import org.pussinboots.morning.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

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
@RequestMapping(value = "/pass")
@Api(value = "邮件发送", description = "邮件发送")
public class EmailController extends BaseController {
	
	@Autowired
	private IEmailSendService emailSendService;
	@Autowired
	private IEmailService emailService;
	@Autowired
	private IUserService userService;
	
	/**
	 * POST 找回密码,发送邮件
	 * @return
	 */
	@ApiOperation(value = "找回密码,发送邮件", notes = "根据url中的邮箱地址,发送邮件") 
	@PostMapping(value = "/sendEmailTicket")
	@ResponseBody
	public Object sendEmailTicket(@RequestParam("email") String email) {
		if (!RegexUtils.isEmail(email)) {
			return new OsResult(EmailReturnCode.EMAIL_FORMAT_ERROR);
		}

		User user = userService.getByLoginName(email);
		if (user == null) {
			return new OsResult(EmailReturnCode.EMAIL_NOT_EXIST);
		}

		EmailSendResultDTO emailSendResult = emailSendService.sendMailByVelocity(email, user.getUserName(),
				EmailTypeEnum.FORGET.getType());

		if (emailSendResult.getResult()) {
			return new OsResult(CommonReturnCode.SUCCESS, emailSendResult.getEmailSign());
		} else {
			return new OsResult(CommonReturnCode.UNKNOWN_ERROR);
		}
	}
	
	/**
	 * POST 注册账号,发送邮件
	 * @return
	 */
	@ApiOperation(value = "注册账号,发送邮件", notes = "根据url中的邮箱地址,发送邮件")  
	@PostMapping(value = "/sendEmailRegister")
	@ResponseBody
	public Object sendEmailRegister(@RequestParam("email") String email) {
		if (!RegexUtils.isEmail(email)) {
			return new OsResult(EmailReturnCode.EMAIL_FORMAT_ERROR);
		}

		User user = userService.getByLoginName(email);
		if(user == null) {
			return new OsResult(EmailReturnCode.EMAIL_NOT_EXIST);
		}
		EmailSendResultDTO emailSendResult = emailSendService.sendMailByVelocity(email, user.getUserName(),
				EmailTypeEnum.REGISTER.getType());

		if (emailSendResult.getResult()) {
			return new OsResult(CommonReturnCode.SUCCESS, emailSendResult.getEmailSign());
		} else {
			return new OsResult(CommonReturnCode.UNKNOWN_ERROR);
		}
	}
	
	/**
	 * POST 验证邮箱验证码
	 * @return
	 */
	@ApiOperation(value = "验证邮箱验证码", notes = "根据url中的邮箱地址,验证码,邮件标识号验证邮箱中验证码")  
	@PostMapping(value = "/verifyEmail")
	@ResponseBody
	public Object verifyEmail(@RequestParam("email") String email, @RequestParam("captcha") String captcha,
			@RequestParam("emailSign") Long emailSign) {
		Email queryEmail = emailService.getByEmailSign(emailSign);
		if (queryEmail == null) {
			return new OsResult(EmailReturnCode.SEND_EMAIL_NOT_EXIST);
		}
		boolean result = queryEmail.getUserEmail().equals(email) && queryEmail.getCaptcha().equals(captcha);
		if (!result) {
			return new OsResult(EmailReturnCode.CAPTCHA_ERROR);
		}
		if (new Date().after(queryEmail.getEndTime())) { // 验证验证时间是否过期
			return new OsResult(EmailReturnCode.CAPTCHA_OVERDUE);
		}
		return new OsResult(CommonReturnCode.SUCCESS);
	}
}
