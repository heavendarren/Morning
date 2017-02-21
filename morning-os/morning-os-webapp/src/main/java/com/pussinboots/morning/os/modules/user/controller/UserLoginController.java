package com.pussinboots.morning.os.modules.user.controller;

import java.util.Date;
import java.util.Map;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.result.ResponseResult;
import com.pussinboots.morning.common.util.RSAUtils;
import com.pussinboots.morning.common.util.RegexUtils;
import com.pussinboots.morning.common.util.ServletUtils;
import com.pussinboots.morning.os.common.util.SingletonLoginUtils;
import com.pussinboots.morning.os.modules.user.entity.User;
import com.pussinboots.morning.os.modules.user.entity.UserLoginLog;
import com.pussinboots.morning.os.modules.user.service.IUserService;

/**
 * 
*    
* 项目名称：morning-os-webapp   
* 类名称：UserLoginController   
* 类描述：用户登录表示层控制器  
* 创建人：陈星星   
* 创建时间：2017年2月19日 下午8:54:38   
*
 */
@Controller
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
		token.setRememberMe(true);
		try{
			currentUser.login(token);
			UserLoginLog userLoginLog = new UserLoginLog(new Date(),
					ServletUtils.getIpAddr(), SingletonLoginUtils.getUserId(),
					ServletUtils.getUserOperatingSystem(),
					ServletUtils.getUserBrowser());
			userService.updateLogByUserId(SingletonLoginUtils.getUserId(), userLoginLog);
		} catch (UnknownAccountException e) {
			logger.error("该账号不存在!", e);
			return fail(false, "该账号不存在!");
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
	public String register() {
		return USER_REGISTER;
	}
	
	
	/**
	 * GET 找回密码
	 * @return
	 */
	@GetMapping(value = "/forgetPassword")
	public String getPorgetPassword() {
		return USER_FORGET_PASSWORD;
	}
	
	/**
	 * POST 找回密码
	 * @param model
	 * @return
	 */
	@PostMapping(value = "/forgetPassword")
	@ResponseBody
	public ResponseResult postForgetPassword() {
		if (!SingletonLoginUtils.validate()) {
			return fail(false, "请输入正确的验证码");
		}
		if (!RegexUtils.isEmail(ServletUtils.getParameter("email"))) {
			return fail(false, "请输入正确的邮箱地址");
		}
		if (!userService.checkEmail(ServletUtils.getParameter("email").trim())) {
			return fail(false, "该邮箱没有注册过帐号");
		}
		return success(true, "验证通过!", ServletUtils.getParameter("email"));
	}
	
}
