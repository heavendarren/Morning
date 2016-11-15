package com.morning.controller.main;

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

import com.morning.common.dto.AjaxResult;
import com.morning.common.util.MD5Utils;
import com.morning.common.util.RSAUtils;
import com.morning.common.util.ServletUtils;
import com.morning.common.util.SingletonLoginUtils;
import com.morning.controller.BaseController;
import com.morning.entity.system.SystemUser;
import com.morning.service.system.ISystemUserService;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：LoginController   
* 类描述：后台管理员登录表示层   
* 创建人：陈星星   
* 创建时间：2016年9月14日  上午12:16:42  
* 修改人：陈星星   
* 修改时间：2016年11月14日 00:35:17   
* 修改备注：mybatis-plus整合完毕   
* @version    
*
 */
@Controller
@RequestMapping("/system")
public class LoginController extends BaseController{
	
	/** 后台管理登录页面 */
	private static final String ADMIN_LOGIN = getViewPath("admin/login/admin_login");

	@Autowired
	private ISystemUserService systemUserService;

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
	 * @param systemUser
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult login(@ModelAttribute("systemUser") SystemUser systemUser) {
		if (!SingletonLoginUtils.validate()) {
			return fail(false, "验证码错误");
		}
		// 服务器端，使用RSAUtils工具类对密文进行解密
		String passWord = RSAUtils.decryptStringByJs(systemUser.getLoginPassword());
		systemUser.setLoginPassword(MD5Utils.getMD5(passWord));
		
		Subject currentUser = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(systemUser.getLoginName(), systemUser.getLoginPassword());
		token.setRememberMe(true);
		try{
			currentUser.login(token);
			SystemUser user = systemUserService.selectByLoginName(systemUser.getLoginName());
			systemUserService.updateLogByLoginName(user.getAccountId(), ServletUtils.getIpAddr(), ServletUtils.getUserBrowser(), ServletUtils.getUserOperatingSystem());
		} catch (UnknownAccountException e) {
			return fail(false, "该账号不存在!");
		} catch (DisabledAccountException e) {
			return fail(false, "该账号已被冻结!");
		} catch (IncorrectCredentialsException e) {
			return fail(false, "密码错误");
		} catch (RuntimeException e) {
			return fail(false, "未知错误,请联系管理员!");
		}
		return success(true);
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
