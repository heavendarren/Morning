package org.pussinboots.morning.os.controller.user;

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
import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.constant.CommonReturnCode;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.common.exception.ValidateException;
import org.pussinboots.morning.common.util.RSAUtils;
import org.pussinboots.morning.common.util.RegexUtils;
import org.pussinboots.morning.online.common.constant.EmailReturnCode;
import org.pussinboots.morning.online.common.enums.NavigationBarTypeEnum;
import org.pussinboots.morning.online.entity.Email;
import org.pussinboots.morning.online.entity.NavigationBar;
import org.pussinboots.morning.online.service.IEmailService;
import org.pussinboots.morning.online.service.INavigationBarService;
import org.pussinboots.morning.os.common.result.OsResult;
import org.pussinboots.morning.os.common.util.ServletUtils;
import org.pussinboots.morning.os.common.util.SingletonLoginUtils;
import org.pussinboots.morning.user.common.constant.UserReturnCode;
import org.pussinboots.morning.user.entity.User;
import org.pussinboots.morning.user.entity.UserLoginLog;
import org.pussinboots.morning.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-os-web Maven Webapp   
* 类名称：UserLoginController   
* 类描述：用户登录表示层控制器    
* 创建人：陈星星   
* 创建时间：2017年4月7日 下午10:54:11   
*
 */
@Controller
@RequestMapping(value = "/pass")
@Api(value = "用户登录", description = "用户登录")
public class UserLoginController extends BaseController {
	
	@Autowired
	private IUserService userService;
	@Autowired
	private IEmailService emailService;
	@Autowired
	private INavigationBarService navigationBarService;
	
	/**
	 * GET 登录页面
	 * @return
	 */
	@ApiOperation(value = "用户登录页面", notes = "用户登录首页,向前台传送网站公钥及登录页面导航栏")  
	@GetMapping(value = "/login")
	public String login(Model model) {
		// 将公钥的 modulus 和 exponent 传给页面
		Map<String, Object> publicKeyMap = RSAUtils.getPublicKeyMap();
		model.addAttribute("publicKeyMap", publicKeyMap);
		// 顶部导航栏
		List<NavigationBar> loginTop = navigationBarService
				.listByNavigationId(NavigationBarTypeEnum.LOGIN_TOP.getType());
		model.addAttribute(NavigationBarTypeEnum.LOGIN_TOP.getCode(), loginTop);
		return "/modules/user/user_login";
	}
	
	
	/**
	 * POST 登录
	 * @return
	 */
	@ApiOperation(value = "用户登录", notes = "根据登录名和登录密码确认用户登录信息")  
	@PostMapping(value = "/login")
	@ResponseBody
	public Object login(@RequestParam("loginName") String loginName,
			@RequestParam("loginPassword") String loginPassword) {
		// 服务器端，使用RSAUtils工具类对密文进行解密
		String passWord = RSAUtils.decryptStringByJs(loginPassword);
		
		Subject currentUser = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(loginName, passWord);
		token.setRememberMe(false);// 默认不记住我
		try{
			currentUser.login(token);
			UserLoginLog userLoginLog = new UserLoginLog(new Date(), ServletUtils.getIpAddr(),
					SingletonLoginUtils.getUserId(), ServletUtils.getUserOperatingSystem(),
					ServletUtils.getUserBrowser());
			Integer count = userService.updateLogById(SingletonLoginUtils.getUserId(), userLoginLog);
			return new OsResult(CommonReturnCode.SUCCESS, count);
		} catch (UnknownAccountException e) {
			logger.error(UserReturnCode.USER_NOT_EXIST.getMessage(), e);
			return new OsResult(UserReturnCode.USER_NOT_EXIST);
		} catch (DisabledAccountException e) {
			logger.error(UserReturnCode.USER_SUSPEND.getMessage(), e);
			return new OsResult(UserReturnCode.USER_SUSPEND);
		} catch (IncorrectCredentialsException e) {
			logger.error(UserReturnCode.WRONG_PASSWORD.getMessage(), e);
			return new OsResult(UserReturnCode.WRONG_PASSWORD);
		} catch (ExcessiveAttemptsException e) {
			logger.error(UserReturnCode.ACCOUNT_LOCK.getMessage(), e);
			return new OsResult(UserReturnCode.ACCOUNT_LOCK);
		}catch (RuntimeException e) {
			logger.error(CommonReturnCode.UNKNOWN_ERROR.getMessage(), e);
			return new OsResult(CommonReturnCode.UNKNOWN_ERROR);
		}
	}
	
	/**
	 * GET 注册页面
	 * @return
	 */
	@ApiOperation(value = "用户注册页面", notes = "用户注册首页,向前台传送注册页面导航栏")  
	@GetMapping(value = "/register")
	public String register(Model model) {
		// 顶部导航栏
		List<NavigationBar> loginTop = navigationBarService
				.listByNavigationId(NavigationBarTypeEnum.LOGIN_TOP.getType());
		model.addAttribute(NavigationBarTypeEnum.LOGIN_TOP.getCode(), loginTop);
		return "/modules/user/user_register";
	}
	
	/**
	 * POST 注册
	 * @return
	 */
	@ApiOperation(value = "用户注册", notes = "验证用户输入的注册信息")  
	@PostMapping(value = "/register")
	@ResponseBody
	public Object register(@ModelAttribute("user") User user, @RequestParam("registerCode") String registerCode) {
		if (!SingletonLoginUtils.validate(registerCode)) {
			return new OsResult(UserReturnCode.REGISTER_CODE_ERROR);
		}
		if (StringUtils.isEmpty(user.getEmail()) || !RegexUtils.isEmail(user.getEmail())) {
			return new OsResult(CommonReturnCode.BAD_REQUEST.getCode(), "请输入正确的电子邮箱!");
		}
		if (StringUtils.isEmpty(user.getLoginPassword()) || !RegexUtils.isPassword(user.getLoginPassword())) {
			return new OsResult(CommonReturnCode.BAD_REQUEST.getCode(), "密码长度6~20位，其中数字，字母和符号至少包含两种!");
		}
		try {
			userService.insertUser(user);
			return new OsResult(CommonReturnCode.SUCCESS, user.getEmail());
		} catch (ValidateException e) {
			logger.error(e.getMessage(), e);
			return new OsResult(e.getCode(), e.getMessage());
		}
	}
	
	/**
	 * POST 注册,邮箱激活
	 * @return
	 */
	@ApiOperation(value = "注册,邮箱激活", notes = "根据传过来的电子邮箱/验证码/邮箱标识,激活账号")  
	@PostMapping(value = "/emailActive")
	@ResponseBody
	public Object emailActive(@RequestParam("email") String email, @RequestParam("captcha") String captcha,
			@RequestParam("emailSign") Long emailSign) {
		Email queryEmail = emailService.getByEmailSign(emailSign);
		if (queryEmail == null) {
			return new OsResult(EmailReturnCode.SEND_EMAIL_NOT_EXIST);
		}
		Boolean result = queryEmail.getUserEmail().equals(email) && queryEmail.getCaptcha().equals(captcha);
		if (!result) {
			return new OsResult(EmailReturnCode.CAPTCHA_ERROR);
		}
		if (new Date().after(queryEmail.getEndTime())) { // 验证验证时间是否过期
			return new OsResult(EmailReturnCode.CAPTCHA_OVERDUE);
		}
		// 激活该账号
		Integer count = userService.updateEmailActive(email);
		// 更新链接已失效
		emailService.updateStatus(queryEmail.getEmailId(),StatusEnum.INVALID.getStatus());
		return new OsResult(CommonReturnCode.SUCCESS, count);
	}
	
	/**
	 * POST 注册,完善个人信息
	 * @param email 邮箱
	 * @param telephone 手机号码
	 * @param realName 真实姓名
	 * @return
	 */
	@ApiOperation(value = "注册,完善个人信息", notes = "根据传过来的电子邮箱/手机号码/真实姓名,完善账号信息")  
	@PostMapping(value = "/perfectUser")
	@ResponseBody
	public Object perfectUser(@RequestParam("email") String email, @RequestParam("telephone") String telephone,
			@RequestParam("realName") String realName) {
		if (StringUtils.isEmpty(telephone) || !RegexUtils.isTelephone(telephone)) {
			return new OsResult(CommonReturnCode.BAD_REQUEST.getCode(), "请输入正确的手机号码!");
		}
		if (StringUtils.isEmpty(realName)) {
			return new OsResult(CommonReturnCode.BAD_REQUEST.getCode(), "请输入正确的真实姓名!");
		}
		try {
			userService.updatePerfectUser(email, telephone, realName);
			return new OsResult(CommonReturnCode.SUCCESS, email);
		} catch (ValidateException e) {
			logger.error(e.getMessage(), e);
			return new OsResult(e.getCode(), e.getMessage());
		}
	}
	
	/**
	 * GET 找回密码页面
	 * @return
	 */
	@ApiOperation(value = "找回密码页面", notes = "找回密码页面,向前台传送找回密码页面导航栏")  
	@GetMapping(value = "/forgetPassword")
	public String getPorgetPassword(Model model) {
		// 顶部导航栏
		List<NavigationBar> loginTop = navigationBarService
				.listByNavigationId(NavigationBarTypeEnum.LOGIN_TOP.getType());
		model.addAttribute(NavigationBarTypeEnum.LOGIN_TOP.getCode(), loginTop);
		return "/modules/user/user_forget_password";
	}
	
	/**
	 * POST 找回密码
	 * @return
	 */
	@ApiOperation(value = "找回密码", notes = "根据传过来的电子邮箱,验证该电子邮箱是否存在")  
	@PostMapping(value = "/forgetPassword")
	@ResponseBody
	public Object postForgetPassword(@RequestParam("email") String email,
			@RequestParam("registerCode") String registerCode) {
		if (!SingletonLoginUtils.validate(registerCode)) {
			return new OsResult(UserReturnCode.REGISTER_CODE_ERROR);
		}
		if (!RegexUtils.isEmail(email)) {
			return new OsResult(EmailReturnCode.EMAIL_FORMAT_ERROR);
		}
		if (userService.getByEmail(email) == null) {
			return new OsResult(EmailReturnCode.EMAIL_NOT_EXIST);
		}
		return new OsResult(CommonReturnCode.SUCCESS, email);
	}
	
	/**
	 * POST 重置密码
	 * @param email 邮箱
	 * @param captcha 验证码
	 * @param emailSign 邮箱标识
	 * @param loginPassword 密码
	 * @return
	 */
	@ApiOperation(value = "重置密码", notes = "重置密码")  
	@PostMapping(value = "/resetPassword")
	@ResponseBody
	public Object resetPassword(@RequestParam("email") String email, @RequestParam("captcha") String captcha,
			@RequestParam("emailSign") Long emailSign, @RequestParam("loginPassword") String loginPassword) {
		Email queryEmail = emailService.getByEmailSign(emailSign);
		if (queryEmail == null) {
			return new OsResult(EmailReturnCode.SEND_EMAIL_NOT_EXIST);
		}
		Boolean result = queryEmail.getUserEmail().equals(email) && queryEmail.getCaptcha().equals(captcha);
		if (!result) {
			return new OsResult(EmailReturnCode.CAPTCHA_ERROR);
		}
		if (new Date().after(queryEmail.getEndTime())) { // 验证验证时间是否过期
			return new OsResult(EmailReturnCode.CAPTCHA_OVERDUE);
		}
		if (!RegexUtils.isPassword(loginPassword)) {
			return new OsResult(CommonReturnCode.BAD_REQUEST.getCode(), "密码长度6~20位，其中数字，字母和符号至少包含两种!");
		}
		
		emailService.updateStatus(queryEmail.getEmailId(),StatusEnum.INVALID.getStatus());
		
		// 更新账户密码
		userService.updatePasswordByEmail(loginPassword, email);
		return new OsResult(CommonReturnCode.SUCCESS, email);
	}	
	
	/**
	 * GET 退出登录
	 * @return
	 */
	@ApiOperation(value = "退出登录", notes = "退出登录")  
    @GetMapping(value = "/logout")
    public String logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return redirectTo("/index");
    }
}
