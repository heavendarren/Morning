package com.morning.controller.main;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Constants;
import com.morning.common.util.MD5Utils;
import com.morning.common.util.RSAUtils;
import com.morning.controller.BaseController;
import com.morning.entity.system.SystemUser;
import com.morning.service.system.SystemUserService;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：LoginController   
* 类描述：后台管理员登录表示层   
* 创建人：陈星星   
* 创建时间：2016年9月14日  上午12:16:42  
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:26:35   
* 修改备注：   
* @version    
*
 */
@Controller
@RequestMapping("/system")
public class LoginController extends BaseController{
	
	// 后台管理登录页面
	private static final String ADMIN_LOGIN = getViewPath("admin/login/admin_login");
	
	@Autowired
	private SystemUserService systemUserService;

	
	@InitBinder({ "systemUser" })
	public void initBinderSystemUser(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("systemUser.");
	}
	
	/**
	 * GET 登录
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String login(HttpServletRequest request, Model model) {
		// 将公钥的 modulus 和 exponent 传给页面
		Map<String, Object> publicKeyMap = RSAUtils.getPublicKeyMap();
		model.addAttribute("publicKeyMap", publicKeyMap);
		return ADMIN_LOGIN;
	}
	
	/**
	 * POST 登录
	 * @param request
	 * @param systemUser
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> login(HttpServletRequest request, @ModelAttribute("systemUser") SystemUser systemUser) {
		Map<String, Object> json = new HashMap<String, Object>();
		// 获取Session中验证码
		Object captcha = this.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		String registerCode = request.getParameter("registerCode") == null ? "" : request.getParameter("registerCode");
		if (captcha == null || !registerCode.equalsIgnoreCase(captcha.toString())) {
			json = this.setJson(false, "验证码错误");
			return json;
		}
		// 服务器端，使用RSAUtils工具类对密文进行解密
		String passWord = RSAUtils.decryptStringByJs(systemUser.getLoginPassword());
		systemUser.setLoginPassword(MD5Utils.getMD5(passWord));
		
		Subject currentUser = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(systemUser.getLoginName(), systemUser.getLoginPassword());
		token.setRememberMe(true);
		try{
			currentUser.login(token);
		} catch (UnknownAccountException e) {
			json = this.setJson(false, "该账号不存在!");
			return json;
		} catch (DisabledAccountException e) {
			json = this.setJson(false, "该账号已被冻结!");
			return json;
		} catch (IncorrectCredentialsException e) {
			json = this.setJson(false, "密码错误");
			return json;
		} catch (RuntimeException e) {
			json = this.setJson(false, "未知错误,请联系管理员!");
			return json;
		}
		json = this.setJson(true);
		return json;
	}
	
	/**
	 * 退出
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return redirectTo("/system");
	}
}
