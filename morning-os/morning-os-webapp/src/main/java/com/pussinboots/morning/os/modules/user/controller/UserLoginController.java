package com.pussinboots.morning.os.modules.user.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.enums.StatusEnum;
import com.pussinboots.morning.common.exception.ValidateException;
import com.pussinboots.morning.common.result.ResponseResult;
import com.pussinboots.morning.common.util.RSAUtils;
import com.pussinboots.morning.common.util.RegexUtils;
import com.pussinboots.morning.common.util.ServletUtils;
import com.pussinboots.morning.os.common.util.SingletonLoginUtils;
import com.pussinboots.morning.os.modules.content.entity.NavigationBar;
import com.pussinboots.morning.os.modules.content.enums.NavigationBarTypeEnum;
import com.pussinboots.morning.os.modules.content.service.INavigationBarService;
import com.pussinboots.morning.os.modules.email.entity.Email;
import com.pussinboots.morning.os.modules.email.service.IEmailService;
import com.pussinboots.morning.os.modules.user.entity.User;
import com.pussinboots.morning.os.modules.user.entity.UserLoginLog;
import com.pussinboots.morning.os.modules.user.service.IUserService;

/**
 * 
* 项目名称：morning-os-webapp   
* 类名称：UserLoginController   
* 类描述：用户登录表示层控制器  
* 创建人：陈星星   
* 创建时间：2017年2月19日 下午8:54:38   
*
 */
@Controller
@RequestMapping(value = "/pass")
public class UserLoginController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserLoginController.class);
	
	/** 前台用户注册 */
	private static final String USER_REGISTER = getViewPath("modules/user/user_register");
	/** 前台用户登录 */
	private static final String USER_LOGIN = getViewPath("modules/user/user_login");
	/** 找回密码 */
	private static final String USER_FORGET_PASSWORD = getViewPath("modules/user/user_forget_password");
	
	@Autowired
	private IUserService userService;
	@Autowired
	private IEmailService emailService;
	@Autowired
	private INavigationBarService navigationBarService;	
	
	/**
	 * GET 登录
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/login")
	public String login(Model model) {
		// 将公钥的 modulus 和 exponent 传给页面
		Map<String, Object> publicKeyMap = RSAUtils.getPublicKeyMap();
		model.addAttribute("publicKeyMap", publicKeyMap);
		// 顶部导航栏
		List<NavigationBar> loginTop = navigationBarService.selectNavigationBarByType(
				NavigationBarTypeEnum.LOGIN_TOP.getType(), StatusEnum.SHOW.getStatus());
		model.addAttribute(NavigationBarTypeEnum.LOGIN_TOP.getCode(), loginTop);
		return USER_LOGIN;
	}
	
	/**
	 * POST 登录
	 * @param user
	 * @return
	 */
	@PostMapping(value = "/login")
	@ResponseBody
	public ResponseResult login(User user) {
		// 服务器端，使用RSAUtils工具类对密文进行解密
		String passWord = RSAUtils.decryptStringByJs(user.getLoginPassword());
		user.setLoginPassword(passWord);
		
		Subject currentUser = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken((String) ServletUtils.getParameter("loginName"), user.getLoginPassword());
		token.setRememberMe(false);// 默认不记住我
		try{
			currentUser.login(token);
			UserLoginLog userLoginLog = new UserLoginLog(new Date(),
					ServletUtils.getIpAddr(), SingletonLoginUtils.getUserId(),
					ServletUtils.getUserOperatingSystem(),
					ServletUtils.getUserBrowser());
			userService.updateLogByUserId(SingletonLoginUtils.getUserId(), userLoginLog);
		} catch (UnknownAccountException e) {
			logger.error("该账号不存在或者该账号未被激活!", e);
			return fail(false, "该账号不存在或者该账号未被激活!");
		} catch (DisabledAccountException e) {
			logger.error("该账号已被冻结!", e);
			return fail(false, "该账号已被冻结!");
		} catch (IncorrectCredentialsException e) {
			logger.error("密码错误", e);
			return fail(false, "密码错误");
		} catch (ExcessiveAttemptsException e) {
			logger.error("密码连续输入错误超过5次，锁定半小时!", e);
			return fail(false, "密码连续输入错误超过5次，锁定半小时!");
		}catch (RuntimeException e) {
			logger.error("未知错误,请联系管理员!", e);
			return fail(false, "未知错误,请联系管理员!");
		}
		return success(true);
	}
	
	/**
	 * GET 注册
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/register")
	public String register(Model model) {
		// 顶部导航栏
		List<NavigationBar> loginTop = navigationBarService.selectNavigationBarByType(
				NavigationBarTypeEnum.LOGIN_TOP.getType(), StatusEnum.SHOW.getStatus());
		model.addAttribute(NavigationBarTypeEnum.LOGIN_TOP.getCode(), loginTop);
		return USER_REGISTER;
	}
	
	/**
	 * POST 注册
	 * @param user
	 * @return
	 */
	@PostMapping(value = "/register")
	@ResponseBody
	public ResponseResult register(@ModelAttribute("user") User user) {
		if (!SingletonLoginUtils.validate()) {
			return fail(false, "请输入正确的验证码");
		}
		if (StringUtils.isEmpty(user.getEmail()) || !RegexUtils.isEmail(user.getEmail())) {
			return fail(false, "请输入正确的电子邮箱");
		}
		if (StringUtils.isEmpty(user.getLoginPassword()) || !RegexUtils.isPassword(user.getLoginPassword())) {
			return fail(false, "密码长度6~20位，其中数字，字母和符号至少包含两种!");
		}
		try {
			userService.insertUser(user);
			return success(true,"验证成功!",user.getEmail());
		} catch (ValidateException e) {
			logger.error(e.getMessage(), e);
			return fail(false, e.getMessage());
		}
	}
	
	/**
	 * POST 注册,邮箱激活
	 * @param user
	 * @return
	 */
	@PostMapping(value = "/emailActive")
	@ResponseBody
	public ResponseResult emailActive(@RequestParam("email") String email, @RequestParam("captcha") String captcha,
			@RequestParam("emailSign") Long emailSign) {
		Email queryEmail = emailService.selectByEmailSign(emailSign);
		if (queryEmail == null) {
			return fail(false, "该邮件不存在,请重新发送邮件!");
		}
		boolean result = queryEmail.getUserEmail().equals(email) && queryEmail.getCaptcha().equals(captcha);
		if (!result) {
			return fail(false, "验证码错误,请重新输入!");
		}
		if(!StatusEnum.VALID.getStatus().equals(queryEmail.getStatus())) {
			return fail(false, "该验证码已失效,请重新发送邮件!");
		}
		userService.updateEmailActive(email);// 激活该账号
		emailService.updateStatus(emailSign);// 更新链接已失效
		return success(true);
	}
	
	/**
	 * POST 注册,完善个人信息
	 * @param email 邮箱
	 * @param telephone 手机号码
	 * @param realName 真实姓名
	 * @return
	 */
	@PostMapping(value = "/perfectUser")
	@ResponseBody
	public ResponseResult perfectUser(@RequestParam("email") String email, @RequestParam("telephone") String telephone,
			@RequestParam("realName") String realName) {
		if (StringUtils.isEmpty(telephone) || !RegexUtils.isTelephone(telephone)) {
			return fail(false, "请输入正确的手机号码");
		}
		if (StringUtils.isEmpty(realName)) {
			return fail(false, "请输入正确的真实姓名");
		}
		userService.updatePerfectUser(email, telephone, realName);
		return success(true, "注册成功!", email);
	}
	
	
	/**
	 * GET 找回密码
	 * @return
	 */
	@GetMapping(value = "/forgetPassword")
	public String getPorgetPassword(Model model) {
		// 顶部导航栏
		List<NavigationBar> loginTop = navigationBarService.selectNavigationBarByType(
				NavigationBarTypeEnum.LOGIN_TOP.getType(), StatusEnum.SHOW.getStatus());
		model.addAttribute(NavigationBarTypeEnum.LOGIN_TOP.getCode(), loginTop);
		return USER_FORGET_PASSWORD;
	}
	
	/**
	 * POST 找回密码
	 * @param model
	 * @return
	 */
	@PostMapping(value = "/forgetPassword")
	@ResponseBody
	public ResponseResult postForgetPassword(@RequestParam("email") String email) {
		if (!SingletonLoginUtils.validate()) {
			return fail(false, "请输入正确的验证码");
		}
		if (!RegexUtils.isEmail(email)) {
			return fail(false, "请输入正确的邮箱地址");
		}
		if (!userService.checkEmail(email)) {
			return fail(false, "该邮箱没有注册过帐号");
		}
		return success(true, "验证通过!", email);
	}
	
	/**
	 * POST 重置密码
	 * @param email 邮箱
	 * @param captcha 验证码
	 * @param emailSign 邮箱标识
	 * @param loginPassword 密码
	 * @return
	 */
	@PostMapping(value = "/resetPassword")
	@ResponseBody
	public ResponseResult resetPassword(@RequestParam("email") String email, @RequestParam("captcha") String captcha,
			@RequestParam("emailSign") Long emailSign, @RequestParam("loginPassword") String loginPassword) {
		Email queryEmail = emailService.selectByEmailSign(emailSign);
		if (queryEmail == null) {
			return fail(false, "该邮件不存在,请重新发送邮件!");
		}
		boolean result = queryEmail.getUserEmail().equals(email) && queryEmail.getCaptcha().equals(captcha);
		if (!result) {
			return fail(false, "验证码错误,请重新输入!");
		}
		if(!StatusEnum.VALID.getStatus().equals(queryEmail.getStatus())) {
			return fail(false, "该验证码已失效,请重新发送邮件!");
		}
		if (!RegexUtils.isPassword(loginPassword)) {
			return fail(false, "密码长度6~20位，其中数字，字母和符号至少包含两种!");
		}
		userService.updatePasswordByEmail(loginPassword, email);// 更新账户密码
		emailService.updateStatus(emailSign);// 更新链接已失效
		return success(true, "重置密码成功!", email);
	}
	
	
	/**
	 * GET 退出登录
	 * @return
	 */
    @GetMapping(value = "/logout")
    public String logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return redirectTo("/index");
    }
}
