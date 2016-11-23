package com.morning.controller.user;

import java.util.Date;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.morning.common.dto.AjaxResult;
import com.morning.common.util.MD5Utils;
import com.morning.common.util.toolbox.DateUtil;
import com.morning.common.util.toolbox.WebUtil;
import com.morning.controller.BaseController;
import com.morning.entity.user.QueryUser;
import com.morning.entity.user.User;
import com.morning.entity.user.UserLoginLog;
import com.morning.service.user.UserLoginLogService;
import com.morning.service.user.UserService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：AdminUserController   
* 类描述：后台管理员表示层
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
	public String list(Model model, @ModelAttribute("queryUser") QueryUser queryUser) {
		//用户总数量
		int userNumber = userService.getUserNumber();
		model.addAttribute("userNumber", userNumber);
		String updateTime = DateUtil.formatDateTime(new Date());
		model.addAttribute("updateTime", updateTime);
		//用户列表
		List<User> userList = userService.queryUserList(queryUser);
		model.addAttribute("userList", userList);
		return USER_LIST;
	}
	
	/**
	 * POST 启用/禁止用户
	 * @param request
	 * @return
	 */
	@RequiresPermissions("user:list:audit")
	@RequestMapping(value = "/list/audit", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult audit(@ModelAttribute("user") User user) {
		userService.updateUserStates(user);
		return success(true);
	}
	
	/**
	 * 删除用户
	 * @return
	 */
	@RequiresPermissions("user:list:delete")
	@RequestMapping(value = "/list/{accountId}/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public AjaxResult delete(@PathVariable Integer accountId){
		userService.deleteUser(accountId);
		return success(true);
	}
	/**
	 * GET 用户个人资料
	 * @param accountId
	 * @return
	 */
	@RequiresPermissions("user:list:view")
	@RequestMapping(value = "/list/{accountId}/detail", method = RequestMethod.GET)
	public String detail(Model model, @PathVariable Integer accountId) {
		User user = userService.queryUserById(accountId);
		model.addAttribute("user", user);
		return USER_DETAIL;
	}
	
	/**
	 * GET 查看用户登录日志
	 * @param accountId
	 * @return
	 */
	@RequiresPermissions("user:list:view")
	@RequestMapping(value = "/list/{accountId}/log", method = RequestMethod.GET)
	public String listLog(Model model, @PathVariable Integer accountId){
		List<UserLoginLog> userLoginLogList = userLoginLogService.queryUserLoginLog(accountId);
		model.addAttribute("userLoginLogList", userLoginLogList);
		return USER_LOGIN_LOG;
	}
	
	/**
	 * GET 修改用户页面
	 * @return
	 */
	@RequiresPermissions("user:list:edit")
	@RequestMapping(value="/list/{accountId}/edit" ,method=RequestMethod.GET)
	public String edit(Model model, @PathVariable Integer accountId){
		User user = userService.queryUserById(accountId);
		model.addAttribute("user", user);
		return ADD_USER;
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
	public AjaxResult update(@ModelAttribute("user") User user){
		if(user.getAccountId() == null){
			if(user.getEmail()==null || user.getEmail().trim().length()==0 || !WebUtil.isEmail(user.getEmail())){
				return fail(false, "请输入正确的邮箱号");
			}
			if(userService.checkEmail(user.getEmail().trim())){
				return fail(false, "该邮箱号已被使用");
			}
			if(user.getTelephone()==null || user.getTelephone().trim().length()==0 || !WebUtil.isTelephone(user.getTelephone())){
				return fail(false, "请输入正确的手机号");
			}
			if(userService.checkMobile(user.getTelephone())){
				return fail(false, "该手机号已被使用");
			}
			if(user.getUserIdentity()==null || !WebUtil.isUserIdentity(user.getUserIdentity())){
				return fail(false, "请输入正确的身份证号");
			}
			user.setLoginPassword(MD5Utils.getMD5(user.getLoginPassword()));
			userService.createUser(user);
			return success(true, "用户创建成功!");
		}else{
			if(user.getEmail()==null || user.getEmail().trim().length()==0 || !WebUtil.isEmail(user.getEmail())){
				return fail(false, "请输入正确的邮箱号");
			}
			if(user.getTelephone()==null || user.getTelephone().trim().length()==0 || !WebUtil.isTelephone(user.getTelephone())){
				return fail(false, "请输入正确的手机号");
			}
			if(user.getUserIdentity()==null || !WebUtil.isUserIdentity(user.getUserIdentity())){
				return fail(false, "请输入正确的身份证号");
			}
			userService.updateUser(user);
			return success(true, "用户信息修改成功!");
		}
	}
}
