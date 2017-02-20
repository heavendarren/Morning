package com.pussinboots.morning.cms.modules.administrator.controller;

import java.awt.image.BufferedImage;
import java.util.Date;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.pussinboots.morning.cms.common.util.SingletonLoginUtils;
import com.pussinboots.morning.cms.modules.administrator.entity.User;
import com.pussinboots.morning.cms.modules.administrator.entity.UserLoginLog;
import com.pussinboots.morning.cms.modules.administrator.service.IUserService;
import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.result.ResponseResult;
import com.pussinboots.morning.common.util.RSAUtils;
import com.pussinboots.morning.common.util.ServletUtils;

/**
 * 
* 项目名称：morning-cms-webapp   
* 类名称：LoginController   
* 类描述：管理员登录表示层控制器   
* 创建人：陈星星   
* 创建时间：2017年2月2日 下午10:58:16
 */
@Controller
public class AdministratorLoginController extends BaseController{
	
    private static final Logger LOGGER = LoggerFactory.getLogger(AdministratorLoginController.class);
	
	/** 后台管理登录页面 */
	private static final String ADMIN_LOGIN = getViewPath("modules/login/admin_login");

	@Autowired
	private Producer captchaProducer;
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
		return ADMIN_LOGIN;
	}
	
	/**
	 * POST 登录
	 * @param user
	 * @return
	 */
	@PostMapping(value = "/login")
	@ResponseBody
	public ResponseResult login(User user) {
		if (!SingletonLoginUtils.validate()) {
			return fail(false, "验证码错误");
		}
		// 服务器端，使用RSAUtils工具类对密文进行解密
		String passWord = RSAUtils.decryptStringByJs(user.getLoginPassword());
		user.setLoginPassword(passWord);
		
		Subject currentUser = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(), user.getLoginPassword());
		token.setRememberMe(true);
		try{
			currentUser.login(token);
			UserLoginLog userLoginLog = new UserLoginLog(new Date(),
					ServletUtils.getIpAddr(), SingletonLoginUtils.getUserId(),
					ServletUtils.getUserOperatingSystem(),
					ServletUtils.getUserBrowser());
			userService.updateLogByUserId(SingletonLoginUtils.getUserId(), userLoginLog);
		} catch (UnknownAccountException e) {
			LOGGER.error("该账号不存在!", e);
			return fail(false, "该账号不存在!");
		} catch (DisabledAccountException e) {
			LOGGER.error("该账号已被冻结!", e);
			return fail(false, "该账号已被冻结!");
		} catch (IncorrectCredentialsException e) {
			LOGGER.error("密码错误", e);
			return fail(false, "密码错误");
		} catch (ExcessiveAttemptsException e) {
			LOGGER.error("密码连续输入错误超过5次，锁定半小时!", e);
			return fail(false, "密码连续输入错误超过5次，锁定半小时!");
		}catch (RuntimeException e) {
			LOGGER.error("未知错误,请联系管理员!", e);
			return fail(false, "未知错误,请联系管理员!");
		}
		return success(true);
	}
	
	/**
	 * GET 未授权
	 * @return
	 */
	@RequestMapping(value = "/unauth", method = RequestMethod.GET)
    public String unauth() {
		if (!SecurityUtils.getSubject().isAuthenticated()) {
			return redirectTo("/login");
		}
        return "unauth";
    }

	/**
	 * POST 退出登录
	 * @return
	 */
    @GetMapping(value = "/logout")
    public String logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return redirectTo("/login");
    }
	
	/**
	 * GET 后台管理员登录验证码
	 */
	@GetMapping(value = "/captcha-image")
	public ModelAndView getKaptchaImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 禁止服务器端缓存
		response.setDateHeader("Expires", 0);
		
		// 设置标准的 HTTP/1.1 no-cache headers.  
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		
		// 设置IE扩展 HTTP/1.1 no-cache headers (use addHeader).  
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		
		// 设置标准 HTTP/1.0 不缓存图片  
		response.setHeader("Pragma", "no-cache");
		
		// 返回一个 jpeg 图片，默认是text/html(输出文档的MIMI类型)  
		response.setContentType("image/jpeg");
		
		// 为图片创建文本  
		String capText = captchaProducer.createText();
		
		// 将文本保存在session中，这里就使用包中的静态变量吧  
		request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
		
		// 创建带有文本的图片  
		BufferedImage bi = captchaProducer.createImage(capText);
		ServletOutputStream out = response.getOutputStream();
		
		 // 图片数据输出  
		ImageIO.write(bi, "jpg", out);
		try {
			out.flush();
		} finally {
			out.close();
		}
		return null;
	}
	
}
