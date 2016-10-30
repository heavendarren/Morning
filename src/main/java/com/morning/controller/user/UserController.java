package com.morning.controller.user;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.morning.common.util.FileUtils;
import com.morning.common.util.MD5Utils;
import com.morning.common.util.RSAUtils;
import com.morning.common.util.ServletUtils;
import com.morning.common.util.SingletonLoginUtils;
import com.morning.common.util.WebUtil;
import com.morning.controller.BaseController;
import com.morning.entity.user.User;
import com.morning.entity.user.UserAddress;
import com.morning.entity.user.UserLoginLog;
import com.morning.service.user.UserAddressService;
import com.morning.service.user.UserLoginLogService;
import com.morning.service.user.UserService;

import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;

/**
 * 
 * @description：前台学员  Controller
 * @author CXX
 * @version 创建时间：2016年7月16日  下午4:14:20
 */
//让控制器成为一个bean，声明controller，这个控制器是接受页面传过来的参数去操作数据库
@Controller
//根URL下 user都会被controller（类级别的RequestMapping）
@RequestMapping("/user")
public class UserController extends BaseController {
	
	private static final Logger logger = Logger.getLogger(UserController.class);
	
	//@Resource默认按照ByName自动注入，由J2EE提供，需要导入包javax.annotation.Resource。
	@Autowired
	private UserService userService;
	@Autowired
	private UserLoginLogService userLoginLogService;
	@Autowired
	private UserAddressService userAddressService;
	
	// 账户管理
	private static final String userinfo = getViewPath("/web/usercentre/user-info");
	// 收货地址
	private static final String useraddress = getViewPath("/web/usercentre/user-address");
	// 用户注册
	private static final String usersignin = getViewPath("/web/user/user-signin");
	// 用户登录
	private static final String userlogin = getViewPath("/web/user/user-login");
	// 找回密码
	private static final String usergetpsw = getViewPath("/web/user/user-getPsw");
	
    // 绑定变量名字和属性，参数封装进类
    @InitBinder("userAddress")
    public void initBinderUserAddress(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("userAddress.");
    }
    @InitBinder("user")
    public void initBinderUser(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("user.");
    }
    
    /**
     * 登陆页面
     * @param request
     * @return
     */
    @RequestMapping(value="/userLogin", method = RequestMethod.GET)
    public ModelAndView getUserLogin(HttpServletRequest request){
    	ModelAndView modelAndView = new ModelAndView();
		try {
			modelAndView = new ModelAndView(userlogin);
			//将公钥的 modulus 和 exponent 传给页面
			Map<String, Object> publicKeyMap = RSAUtils.getPublicKeyMap();
			modelAndView.addObject("publicKeyMap", publicKeyMap);
			return modelAndView;
		} catch (Exception e) {
			logger.info("UserController.getUserLogin", e);
		}
    	return modelAndView;
    }
    
    /**
     * 用户登录
     * @param request
     * @param user
     * @return
     */
    @RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> userLogin(HttpServletRequest request, @ModelAttribute("user") User user){
		Map<String,Object> json = new HashMap<String,Object>();
    	try{
			// 服务器端，使用RSAUtils工具类对密文进行解密
			String passWord = RSAUtils.decryptStringByJs(user.getLoginPassword());
			User findUser = userService.getLoginUser(user.getLoginName(), MD5Utils.getMD5(passWord));
			//查到用户了，执行登录成功的操作
			if(findUser == null){
				json = this.setJson(false, "你输入的密码和账户名不匹配，请确认后重新输入。", user);
				return json;
			}
			// 判断用户是否是可用状态
			if (findUser.getStatus() != 1) {
				json = this.setJson(false, "该用户已经冻结!", null);
				return json;
			}
			//创建用户信息模型
			SingletonLoginUtils.updateLoginUser(request, findUser);
			
    		//修改用户登录记录
    		userService.updateUserLoginLog(findUser.getAccountId(), new Date(), ServletUtils.getIpAddr(request));
			//添加用户登录日志
			UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
			Browser browser = userAgent.getBrowser(); 
			OperatingSystem operatingSystem = userAgent.getOperatingSystem();
			
			UserLoginLog loginLog =new UserLoginLog();
			loginLog.setBrowser(browser.toString());
			loginLog.setOperatingSystem(operatingSystem.toString());
			loginLog.setUserIp(ServletUtils.getIpAddr(request));
			loginLog.setLoginTime(new Date());
			loginLog.setUserId(findUser.getAccountId());
			userLoginLogService.createLoginLog(loginLog);
			json = this.setJson(true, "登录成功!", null);
		}catch(Exception e){
			logger.error("UserController.userLogin", e);
		}
		return json;
	}
    
    /**
     * 注册页面
     * @param request
     * @return
     */
    @RequestMapping(value="/userSignin", method = RequestMethod.GET)
    public ModelAndView getUserSignin(HttpServletRequest request){
    	ModelAndView modelAndView = new ModelAndView(usersignin);
    	return modelAndView;
    }
    
    /**
     * 验证用户信息
     * @param request
     * @param user
     * @return
     */
    @RequestMapping(value="/userSignin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> verifyUser(HttpServletRequest request, @ModelAttribute("user") User user){
    	Map<String, Object> json = new HashMap<String,Object>();
    	try{
    		Object captcha = request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
    		String registerCode = request.getParameter("registerCode")==null?"":request.getParameter("registerCode");
    		if(captcha==null || !registerCode.equalsIgnoreCase(captcha.toString())){
				json = this.setJson(false, "请输入正确的验证码", null);
				return json;
			}
			if(user.getEmail()==null || user.getEmail().trim().length()==0 || !WebUtil.isEmail(user.getEmail())){
				json = this.setJson(false, "请输入正确的邮箱号", null);
				return json;
			}
			if(userService.checkEmail(user.getEmail().trim())){
				json = this.setJson(false, "该邮箱号已被使用", null);
				return json;
			}
			if(user.getTelephone()==null || user.getTelephone().trim().length()==0 || !WebUtil.isTelephone(user.getTelephone())){
				json = this.setJson(false, "请输入正确的手机号", null);
				return json;
			}
			if(userService.checkMobile(user.getTelephone())){
				json = this.setJson(false, "该手机号已被使用", null);
				return json;
			}
			if(user.getLoginPassword()==null || user.getLoginPassword().trim().length()==0 || !WebUtil.isPassword(user.getLoginPassword())){
				json = this.setJson(false, "密码长度6~20位，其中数字，字母和符号至少包含两种!", null);
				return json;
			}
			request.getSession().removeAttribute(Constants.KAPTCHA_SESSION_KEY);
			json = this.setJson(true, "信息验证成功!", user.getEmail());
    	}catch(Exception e){
    		logger.error("UserController.verifyUser", e);
    	}
    	return json;
    }
    
    /**
     * 创建用户
     * @param request
     * @param user
     * @return
     */
    @RequestMapping(value="/creatUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> creatUser(HttpServletRequest request, @ModelAttribute("user") User user){
    	Map<String, Object> json = new HashMap<String,Object>();
    	try{
    		//验证验证码
    		String emailCaptcha = request.getParameter("emailCaptcha")==null?"":request.getParameter("emailCaptcha");
    		Object sessionCaptcha = request.getSession().getAttribute("emailCaptcha");
    		if(sessionCaptcha==null || !emailCaptcha.equalsIgnoreCase(sessionCaptcha.toString())){
				json = this.setJson(false, "请输入正确的验证码", null);
				return json;
			}
			if(user.getUserIdentity()==null || !WebUtil.isUserIdentity(user.getUserIdentity())){
				json = this.setJson(false, "请输入正确的身份证号", null);
				return json;
			}
    		request.getSession().removeAttribute("emailCaptcha");
    		request.getSession().removeAttribute("registerTime");
    		user.setLoginPassword(MD5Utils.getMD5(user.getLoginPassword()));
			userService.createUser(user);
			
			json = this.setJson(true, "注册成功!", user.getLoginName());
    	}catch(Exception e){
    		logger.error("UserController.creatUser", e);
    	}
    	return json;
    }
    
    /**
     * 找回密码页面
     * @param request
     * @return
     */
    @RequestMapping(value="/userGetPsw", method = RequestMethod.GET)
    public ModelAndView userGetPsw(HttpServletRequest request){
    	ModelAndView modelAndView = new ModelAndView(usergetpsw);
    	return modelAndView;
    }
    
    /**
     * 验证邮箱信息
     * @param request
     * @return
     */
    @RequestMapping(value="/userGetPsw", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> userGetEmail(HttpServletRequest request){
    	Map<String, Object> json = new HashMap<String,Object>();
    	try{
    		Object captcha = request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
    		String registerCode = request.getParameter("registerCode")==null?"":request.getParameter("registerCode");
    		if(captcha==null || !registerCode.equalsIgnoreCase(captcha.toString())){
				json = this.setJson(false, "请输入正确的验证码", null);
				return json;
			}
    		String email = request.getParameter("email")==null?"":request.getParameter("email");
			if(userService.checkEmail(email.trim()) == false){
				json = this.setJson(false, "该邮箱没有注册过帐号", null);
				return json;
			}
			request.getSession().setAttribute("email", email);
			json = this.setJson(true, null, email);
    	}catch(Exception e){
    		logger.error("UserController.userGetEmail", e);
    	}
    	return json;
    }
    
    /**
     * 找回密码
     * @param request
     * @return
     */
    @RequestMapping(value="/updatePsw", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updatePsw(HttpServletRequest request){
    	Map<String, Object> json = new HashMap<String,Object>();
    	try{
    		//验证验证码
    		String emailCaptcha = request.getParameter("emailCaptcha")==null?"":request.getParameter("emailCaptcha");
    		Object sessionCaptcha = request.getSession().getAttribute("emailCaptchaPsw");
    		if(sessionCaptcha==null || !emailCaptcha.equalsIgnoreCase(sessionCaptcha.toString())){
				json = this.setJson(false, "请输入正确的验证码", null);
				return json;
			}
    		String loginPassword = request.getParameter("loginPassword")==null?"":request.getParameter("loginPassword");
			if(loginPassword=="" || loginPassword.trim().length()==0 || !WebUtil.isPassword(loginPassword)){
				json = this.setJson(false, "密码长度6~20位，其中数字，字母和符号至少包含两种!", null);
				return json;
			}
			Object email = request.getSession().getAttribute("email");
			User user = userService.queryUserByEmail((String) email);
			user.setLoginPassword(MD5Utils.getMD5(loginPassword));
			userService.updateUserPwd(user);
    		request.getSession().removeAttribute("emailCaptchaPsw");
    		request.getSession().removeAttribute("registerTimePsw");
			json = this.setJson(true, "找回密码成功!", user.getLoginName());
    	}catch(Exception e){
    		logger.error("UserController.updatePsw", e);
    	}
    	return json;
    }
    
    
	/**
	 * 操作：用户退出销毁session
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/userExit")
	@ResponseBody
	public Map<String,Object> userExit(HttpServletRequest request){
		Map<String,Object> json = new HashMap<String,Object>();
		try{
			request.getSession().invalidate();
			json = this.setJson(true, null, null);
		}catch(Exception e){
			logger.error("UserController.userExit", e );
		}
		return json;
	}
	
	/**
	 * 初始化修改用户信息页面
	 * @param request
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/initUpdateUser/{index}")
	public ModelAndView initUpdateUser(@PathVariable("index") int index,HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView(userinfo);
		try{
			modelAndView.addObject("index",index);
		}catch(Exception e){
			logger.error("UserController.initUpdateUser", e );
		}
		return modelAndView;
	}
	
	/**
	 * 修改用户信息
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/updateUser")
	@ResponseBody
	public Map<String, Object> updateUserInfo(HttpServletRequest request,@ModelAttribute("user") User user){
		Map<String,Object> json = new HashMap<String,Object>();
		try{
			if(user.getAccountId()>=0){
				userService.updateUser(user);
				int accountId = SingletonLoginUtils.getLoginUserId(request);
				User updateUser = userService.queryUserById(accountId);
				SingletonLoginUtils.updateLoginUser(request, updateUser);
				json = this.setJson(true, "修改成功!", user);
			}else{
				json = this.setJson(false, "基本资料修改失败!", null);
			}
		}catch(Exception e){
			logger.error("UserController.updateUserInfo", e);
		}
		return json;	
	}
	
	/**
	 * 修改用户头像
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping("/updateImg")
	@ResponseBody
	public Map<String,Object> updatePicImg(HttpServletRequest request,@ModelAttribute("user") User user){
		Map<String,Object> json = new HashMap<String,Object>();
		try{
			if(user.getAccountId()>0){
				//删除旧头像
				User findUser = userService.queryUserById(user.getAccountId());
		    	String picImgPath = findUser.getPicImg();
		    	if(picImgPath !=null){
			    	StringBuffer uploadPath = new StringBuffer(request.getSession().getServletContext().getRealPath(picImgPath));
			    	FileUtils.deleteFile(uploadPath.toString());//删除该头像
			    	FileUtils.deleteFolder(uploadPath.toString());//如果该目录为空，则删除该目录
		    	}
				//保存新头像
				userService.updateImg(user);
				int accountId = SingletonLoginUtils.getLoginUserId(request);
				User updateUser = userService.queryUserById(accountId);
				SingletonLoginUtils.updateLoginUser(request, updateUser);
				json = this.setJson(true, null, null);
			}else{
				json = this.setJson(true, "头像修改失败!", null);
			}
		}catch (Exception e) {
			logger.error("UserController.updatePicImg", e);
		}
		return json;
	}
	
	/**
	 * 修改密码
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/updatePwd")
	@ResponseBody
	public Map<String, Object> updatePwdInfo(HttpServletRequest request,@ModelAttribute("user") User user){
		Map<String, Object> json = new HashMap<String, Object>();
		try{
			user = userService.queryUserById(user.getAccountId());
			if(user != null){
				//原密码
				String nowPassword = request.getParameter("nowPassword")==null?"":request.getParameter("nowPassword");
				//新密码
				String newPassword = request.getParameter("newPassword")==null?"":request.getParameter("newPassword");
				//确认密码
				String confirmPwd = request.getParameter("confirmPwd")==null?"":request.getParameter("confirmPwd");
				if(nowPassword.equals("")||nowPassword.trim().length() == 0){
					json = this.setJson(false, "原密码不能为空!", null);
					return json;
				}
				if(!MD5Utils.getMD5(nowPassword).equals(user.getLoginPassword())){
					json = this.setJson(false, "原密码不正确!", null);
					return json;
				}
				if(newPassword.equals("")||newPassword.trim().length() == 0){
					json = this.setJson(false, "新密码不能为空!", null);
					return json;
				}
				if(!WebUtil.isPassword(newPassword)){
					json = this.setJson(false, "密码长度8~16位，其中数字，字母和符号至少包含两种!", null);
					return json;
				}
				if(!newPassword.equals(confirmPwd)){
					json = this.setJson(false, "两次输入的新密码不一致!", null);
					return json;
				}
				user.setLoginPassword(MD5Utils.getMD5(newPassword));
				userService.updateUserPwd(user);
				json = this.setJson(true, "修改成功", null);
				
			}
		}catch(Exception e){
			logger.error("UserController.updatePwdInfo", e);
		}
		return json;
	}
	
	
	/**
	 * 跳转我的订单页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/myaddress/list")
	public ModelAndView getMyAddrssList(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView(useraddress);
 		try{
 			int accountId = SingletonLoginUtils.getLoginUserId(request);
 			List<UserAddress> userAddressList = userAddressService.queryAddressByUser(accountId);
 			modelAndView.addObject("userAddressList", userAddressList);
 		}catch(Exception e){
 			logger.error("UserController.getMyAddrssList", e);
 		}
		return modelAndView;
	}
	/**
	 * 保存收货地址
	 * @param request
	 * @param userAddress
	 * @return
	 */
	@RequestMapping(value="/saveAddress")
	@ResponseBody
	public Map<String, Object> saveAddress(HttpServletRequest request, @ModelAttribute("userAddress") UserAddress userAddress){
		Map<String, Object> json = new HashMap<String, Object>();
		try{
			int accountId = SingletonLoginUtils.getLoginUserId(request);
			if(accountId >= 0){
				userAddress.setAccountId(accountId);
			}else{
				json = this.setJson(false, "您未登录或者登录已超时,请先登录!", null);
				return json;
			}
			if(userAddress.getAddressId() != null){
				userAddressService.updateAddress(userAddress);
				json = this.setJson(true, "收货地址修改成功!", null);
			}else{
				userAddressService.creatAddress(userAddress);
				json = this.setJson(true, "收货地址创建成功!", null);
			}
		}catch(Exception e){
			logger.error("UserController.saveAddress", e);
		}
		return json;
	}
	
	/**
	 * 删除用户收货地址
	 * @param request
	 * @param userAddress
	 * @return
	 */
	@RequestMapping(value="/myorder/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteAddress(HttpServletRequest request, @ModelAttribute("userAddress") UserAddress userAddress){
		Map<String, Object> json = new HashMap<String, Object>();
		try{
			userAddressService.deleteAddress(userAddress.getAddressId());
			json = this.setJson(true, "删除成功!", null);
		}catch(Exception e){
			logger.error("UserController.deleteAddress", e);
		}
		return json;
	}
	
	/**
	 * 获取登录用户
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getloginUser")
	@ResponseBody
	public Map<String,Object> getLoginUser(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> json = new HashMap<String,Object>();
		try{
			User user = SingletonLoginUtils.getLoginUser(request);
			if(user == null){
				json = this.setJson(false,null,null);
			}else{
				json = this.setJson(true,null,user);
			}
		}catch (Exception e) {
			logger.error("UserController.getLoginUser", e);
		}
		return json;
	}
}
