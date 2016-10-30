package com.morning.controller.user;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
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

import com.morning.common.util.DateUtil;
import com.morning.common.util.MD5Utils;
import com.morning.common.util.WebUtil;
import com.morning.controller.BaseController;
import com.morning.entity.user.QueryUser;
import com.morning.entity.user.User;
import com.morning.entity.user.UserLoginLog;
import com.morning.service.user.UserLoginLogService;
import com.morning.service.user.UserService;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：AdminUserController   
* 类描述：   后台会员控制层Controller
* 创建人：陈星星   
* 创建时间：2016年10月11日 下午10:11:00   
* 修改人：陈星星   
* 修改时间：2016年10月29日 18:25:52  
* 修改备注：restful规则   	
* @version    
*
 */

@Controller
@RequestMapping("/system/user")
public class AdminUserController extends BaseController{
	
	/** 后台用户列表 */
	private static final String USER_LIST = getViewPath("admin/user/user_list");
	/** 用户个人资料 */
	private static final String USER_DETAIL = getViewPath("admin/user/user_detail");
	/** 用户登录日志 */
	private static final String  USER_LOGIN_LOG = getViewPath("admin/user/user_login_log");
	/** 创建或者修改用户信息 */
	private static final String ADD_USER = getViewPath("admin/user/add_user");
	
	@Autowired
	private UserService userService;
	@Autowired
	private UserLoginLogService userLoginLogService;

	@InitBinder({ "user" })
	private void initUser(WebDataBinder dinder) {
		dinder.setFieldDefaultPrefix("user.");
	}

	@InitBinder({ "queryUser" })
	private void initQueryUser(WebDataBinder dinder) {
		dinder.setFieldDefaultPrefix("queryUser.");
	}
	
	/**
	 * GET 用户列表
	 * @param request
	 * @return
	 */
	@RequiresPermissions("user:list:view")
	@RequestMapping(value = "/list")
	public ModelAndView list(HttpServletRequest request, @ModelAttribute("queryUser") QueryUser queryUser) {
		ModelAndView modelAndView = new ModelAndView(USER_LIST);
		//用户总数量
		int userNumber = userService.getUserNumber();
		modelAndView.addObject("userNumber", userNumber);
		String updateTime = DateUtil.formatDateTime(new Date());
		modelAndView.addObject("updateTime", updateTime);
		//用户列表
		List<User> userList = userService.queryUserList(queryUser);
		modelAndView.addObject("userList", userList);
		return modelAndView;
	}
	
	/**
	 * POST 启用/禁止用户
	 * @param request
	 * @return
	 */
	@RequiresPermissions("user:list:audit")
	@RequestMapping(value = "/list/audit", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> audit(@ModelAttribute("user") User user) {
		Map<String, Object> json = new HashMap<String, Object>();
		userService.updateUserStates(user);
		json = this.setJson(true);
		return json;
	}
	
	/**
	 * 删除用户
	 * @return
	 */
	@RequiresPermissions("user:list:delete")
	@RequestMapping(value = "/list/{accountId}/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> delete(@PathVariable Integer accountId){
		Map<String, Object> json = new HashMap<String, Object>();
		userService.deleteUser(accountId);
		json = this.setJson(true);
		return json;
	}
	/**
	 * GET 用户个人资料
	 * @param accountId
	 * @return
	 */
	@RequiresPermissions("user:list:view")
	@RequestMapping(value = "/list/{accountId}/detail", method = RequestMethod.GET)
	public ModelAndView detail(@PathVariable Integer accountId) {
		ModelAndView modelAndView = new ModelAndView(USER_DETAIL);
		User user = userService.queryUserById(accountId);
		modelAndView.addObject("user", user);
		return modelAndView;
	}
	
	/**
	 * GET 查看用户登录日志
	 * @param accountId
	 * @return
	 */
	@RequiresPermissions("user:list:view")
	@RequestMapping(value = "/list/{accountId}/log", method = RequestMethod.GET)
	public ModelAndView listLog(@PathVariable Integer accountId){
		ModelAndView modelAndView = new ModelAndView(USER_LOGIN_LOG);
		List<UserLoginLog> userLoginLogList = userLoginLogService.queryUserLoginLog(accountId);
		modelAndView.addObject("userLoginLogList", userLoginLogList);
		return modelAndView;
	}
	
	/**
	 * GET 修改用户页面
	 * @return
	 */
	@RequiresPermissions("user:list:edit")
	@RequestMapping(value="/list/{accountId}/edit" ,method=RequestMethod.GET)
	public ModelAndView edit(@PathVariable Integer accountId){
		ModelAndView modelAndView = new ModelAndView(ADD_USER);
		User user = userService.queryUserById(accountId);
		modelAndView.addObject("user", user);
		return modelAndView;
	}
	
	/**
	 * GET 创建用户页面
	 * @return
	 */
	@RequiresPermissions("user:list:add")
	@RequestMapping(value = "/list/add", method = RequestMethod.GET)
	public String add(){
		return ADD_USER;
	}
	
	/**
	 * POST 创建或修改用户
	 * @return
	 */
	@RequiresPermissions({"user:list:add","user:list:edit"})
	@RequestMapping(value="/list/save" ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(@ModelAttribute("user") User user){
		Map<String, Object> json = new HashMap<String, Object>(); 
		if(user.getAccountId() == null){
			if(user.getEmail()==null || user.getEmail().trim().length()==0 || !WebUtil.isEmail(user.getEmail())){
				json = this.setJson(false, "请输入正确的邮箱号");
				return json;
			}
			if(userService.checkEmail(user.getEmail().trim())){
				json = this.setJson(false, "该邮箱号已被使用");
				return json;
			}
			if(user.getTelephone()==null || user.getTelephone().trim().length()==0 || !WebUtil.isTelephone(user.getTelephone())){
				json = this.setJson(false, "请输入正确的手机号");
				return json;
			}
			if(userService.checkMobile(user.getTelephone())){
				json = this.setJson(false, "该手机号已被使用");
				return json;
			}
			if(user.getUserIdentity()==null || !WebUtil.isUserIdentity(user.getUserIdentity())){
				json = this.setJson(false, "请输入正确的身份证号");
				return json;
			}
			user.setLoginPassword(MD5Utils.getMD5(user.getLoginPassword()));
			userService.createUser(user);
			json = this.setJson(true, "用户创建成功!");
		}else{
			if(user.getEmail()==null || user.getEmail().trim().length()==0 || !WebUtil.isEmail(user.getEmail())){
				json = this.setJson(false, "请输入正确的邮箱号");
				return json;
			}
			if(user.getTelephone()==null || user.getTelephone().trim().length()==0 || !WebUtil.isTelephone(user.getTelephone())){
				json = this.setJson(false, "请输入正确的手机号");
				return json;
			}
			if(user.getUserIdentity()==null || !WebUtil.isUserIdentity(user.getUserIdentity())){
				json = this.setJson(false, "请输入正确的身份证号");
				return json;
			}
			json = this.setJson(true, "用户信息修改成功!");
			userService.updateUser(user);
		}
		return json;
	}
}
