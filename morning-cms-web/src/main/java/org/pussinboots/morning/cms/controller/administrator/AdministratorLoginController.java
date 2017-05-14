package org.pussinboots.morning.cms.controller.administrator;

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
import org.pussinboots.morning.administrator.common.constant.UserReturnCode;
import org.pussinboots.morning.administrator.entity.UserLoginLog;
import org.pussinboots.morning.administrator.service.IUserService;
import org.pussinboots.morning.cms.common.result.CmsResult;
import org.pussinboots.morning.cms.common.util.ServletUtils;
import org.pussinboots.morning.cms.common.util.SingletonLoginUtils;
import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.constant.CommonReturnCode;
import org.pussinboots.morning.common.util.RSAUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-cms-web Maven Webapp   
* 类名称：AdministratorLoginController   
* 类描述：管理员登录表示层控制器      
* 创建人：陈星星   
* 创建时间：2017年4月1日 上午1:23:59   
*
 */
@Controller
@Api(value = "管理员登录", description = "管理员登录")
public class AdministratorLoginController extends BaseController{
	
	@Autowired
	private Producer captchaProducer;
	@Autowired
	private IUserService userService;

	/**
	 * GET 登录
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "管理员登录", notes = "管理员登录首页,向前台传送网站公钥")  
	@GetMapping(value = "/login")
	public String getLoginPage(Model model) {
		// 将公钥的 modulus 和 exponent 传给页面
		Map<String, Object> publicKeyMap = RSAUtils.getPublicKeyMap();
		model.addAttribute("publicKeyMap", publicKeyMap);
		return "/modules/login/admin_login";
	}
	
	/**
	 * POST 登录
	 * @param user
	 * @return
	 */
	@ApiOperation(value = "管理员登录", notes = "根据登录名、加密登录密码、验证码登录账号")  
	@PostMapping(value = "/login")
	@ResponseBody
	public Object login(@RequestParam("loginName") String loginName,
			@RequestParam("loginPassword") String loginPassword, @RequestParam("registerCode") String registerCode) {
		if (!SingletonLoginUtils.validate(registerCode)) {
			return new CmsResult(UserReturnCode.REGISTER_CODE_ERROR);
		}
		// 服务器端,使用RSAUtils工具类对密文进行解密
		String passWord = RSAUtils.decryptStringByJs(loginPassword);
		
		Subject currentUser = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(loginName, passWord);
		token.setRememberMe(false);// 默认不记住密码
		try{
			currentUser.login(token);
			UserLoginLog userLoginLog = new UserLoginLog(new Date(), ServletUtils.getIpAddr(),
					SingletonLoginUtils.getUserId(), ServletUtils.getUserOperatingSystem(),
					ServletUtils.getUserBrowser());
			Integer count = userService.updateLogById(SingletonLoginUtils.getUserId(), userLoginLog);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} catch (UnknownAccountException e) {
			logger.error(UserReturnCode.USER_NOT_EXIST.getMessage(), e);
			return new CmsResult(UserReturnCode.USER_NOT_EXIST);
		} catch (DisabledAccountException e) {
			logger.error(UserReturnCode.USER_SUSPEND.getMessage(), e);
			return new CmsResult(UserReturnCode.USER_SUSPEND);
		} catch (IncorrectCredentialsException e) {
			logger.error(UserReturnCode.WRONG_PASSWORD.getMessage(), e);
			return new CmsResult(UserReturnCode.WRONG_PASSWORD);
		} catch (ExcessiveAttemptsException e) {
			logger.error(UserReturnCode.ACCOUNT_LOCK.getMessage(), e);
			return new CmsResult(UserReturnCode.ACCOUNT_LOCK);
		}catch (RuntimeException e) {
			logger.error(CommonReturnCode.UNKNOWN_ERROR.getMessage(), e);
			return new CmsResult(CommonReturnCode.UNKNOWN_ERROR);
		}
	}
	
	
	/**
	 * GET 未授权
	 * @return
	 */
	@ApiOperation(value = "管理员未授权", notes = "未授权跳转登录首页")  
	@RequestMapping(value = "/unauth", method = RequestMethod.GET)
	public String unauth() {
		if (!SecurityUtils.getSubject().isAuthenticated()) {
			return redirectTo("/login");
		}
		return "unauth";
	}

	/**
	 * GET 退出登录
	 * @return
	 */
	@ApiOperation(value = "管理员退出", notes = "管理员退出")  
	@GetMapping(value = "/logout")
	public String logout() {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return redirectTo("/login");
	}
	
	/**
	 * GET 验证码
	 */
	@ApiOperation(value = "登录验证码", notes = "登录验证码")  
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
