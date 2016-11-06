package com.morning.controller.system;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.ModelAndView;

import com.morning.common.util.DateUtil;
import com.morning.common.util.MD5Utils;
import com.morning.common.util.WebUtil;
import com.morning.controller.BaseController;
import com.morning.entity.system.SystemRole;
import com.morning.entity.system.SystemUser;
import com.morning.entity.system.SystemUserLoginLog;
import com.morning.entity.user.QueryUser;
import com.morning.service.system.SystemRoleService;
import com.morning.service.system.SystemUserLoginLogService;
import com.morning.service.system.SystemUserService;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：SystemUserController   
* 类描述：系统管理员表示层   
* 创建人：陈星星   
* 创建时间：2016年10月18日 下午5:00:03   
* 修改人：陈星星   
* 修改时间：2016年10月31日 00:37:19
* 修改备注：Resful规范设计   
* @version    
*
 */
@Controller
@RequestMapping("/system/sysuser")
public class SystemUserController extends BaseController {

	/** 系统管理员列表 */
	private static final String SYSTEM_USER_LIST = getViewPath("admin/system/system_user_list");
	/** 用户个人资料 */
	private static final String SYSTEM_USER_MESSAGE = getViewPath("admin/system/system_user_message");
	/** 用户登录日志 */
	private static final String  USER_LOGIN_LOG = getViewPath("admin/user/user_login_log");
	/** 管理员分类查看 */
	private static final String SYSTEM_USER_ROLE = getViewPath("admin/system/system_user_role");
	/** 创建或者修改用户界面 */
	private static final String SYSTEM_USER_ADDUSER = getViewPath("admin/system/system_user_addUser");
	/** 系统管理员信息界面 */
	private static final String SYSTEM_USER_INFO = getViewPath("admin/system/system_user_info");

	@Autowired
	private SystemUserService systemUserService;
	@Autowired
	private SystemUserLoginLogService systemUserLoginLogService;
	@Autowired
	private SystemRoleService systemRoleService;

	@InitBinder("systemUser")
	public void initBinderSystemUser(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("systemUser.");
	}

	@InitBinder("queryUser")
	private void initQueryUser(WebDataBinder dinder) {
		dinder.setFieldDefaultPrefix("queryUser.");
	}
	
	/**
	 * GET 管理员列表
	 * @param request
	 * @return
	 */
	@RequiresPermissions("sysuser:list:view")
	@RequestMapping(value = "/list")
	public ModelAndView list(HttpServletRequest request, @ModelAttribute("queryUser") QueryUser queryUser) {
		ModelAndView modelAndView = new ModelAndView(SYSTEM_USER_LIST);
		int sysUserNumber = systemUserService.querySysUserNumber();
		modelAndView.addObject("sysUserNumber", sysUserNumber);// 用户总数量
		String updateTime = DateUtil.formatDateTime(new Date());
		modelAndView.addObject("updateTime", updateTime);// 查询时间
		List<SystemUser> systemUsers = systemUserService.querySysUserList(queryUser);
		modelAndView.addObject("systemUsers", systemUsers);// 用户列表
		List<SystemRole> systemRoles = systemRoleService.queryRoles();
		modelAndView.addObject("systemRoles", systemRoles);//权限列表
		return modelAndView;
	}
	
	/**
	 * POST 启用/禁止用户
	 * @param request
	 * @return
	 */
	@RequiresPermissions("sysuser:list:audit")
	@RequestMapping(value = "/list/audit", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> audit(@ModelAttribute("systemUser") SystemUser systemUser) {
		Map<String, Object> json = new HashMap<String, Object>();
		systemUserService.updateSysUserStates(systemUser);
		json = this.setJson(true);
		return json;
	}
	
	/**
	 * GET 个人资料
	 * @param accountId 用户编号
	 * @return
	 */
	@RequiresPermissions("user:list:view")
	@RequestMapping(value = "/list/{accountId}/detail", method = RequestMethod.GET)
	public ModelAndView detail(@PathVariable Integer accountId){
		ModelAndView modelAndView = new ModelAndView(SYSTEM_USER_MESSAGE);
		SystemUser user = systemUserService.querySysUserByUserId(accountId);
		modelAndView.addObject("user", user);//用户信息
		List<SystemRole> systemRoles = systemRoleService.queryRoleByUserId(accountId);
		StringBuffer userRole = new StringBuffer();
		for(SystemRole role : systemRoles){
			userRole.append(role.getRoleName());
			userRole.append("&nbsp");
		}
		modelAndView.addObject("userRole",userRole);//用户权限
		return modelAndView;
	}
	
	/**
	 * DELETE 删除用户
	 * @return
	 */
	@RequiresPermissions("sysuser:list:delete")
	@RequestMapping(value = "/list/{accountId}/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> delete(@PathVariable Integer accountId) {
		Map<String, Object> json = new HashMap<String, Object>();
		systemUserService.deleteSysUser(accountId);
		json = this.setJson(true);
		return json;
	}
	
	/**
	 * Get 用户登录日志
	 * @param accountId
	 * @return
	 */
	@RequiresPermissions("sysuser:list:view")
	@RequestMapping(value = "/list/{accountId}/log", method = RequestMethod.GET)
	public ModelAndView userLog(@PathVariable Integer accountId){
		ModelAndView modelAndView = new ModelAndView(USER_LOGIN_LOG);
		List<SystemUserLoginLog> systemUserLoginLogList = systemUserLoginLogService.querySysUserLoginLog(accountId);
		modelAndView.addObject("userLoginLogList", systemUserLoginLogList);
		return modelAndView;
	}
	
	/**
	 * GET 角色分类下管理员列表
	 * @param roleId
	 * @return
	 */
	@RequiresPermissions("sysuser:list:view")
	@RequestMapping(value = "/list/{roleId}/role", method = RequestMethod.GET)
	public ModelAndView listrole(@PathVariable Integer roleId){
		ModelAndView modelAndView = new ModelAndView(SYSTEM_USER_ROLE);
		List<SystemUser> systemUsers = systemUserService.querySysUsersByRole(roleId);
		modelAndView.addObject("systemUsers", systemUsers);
		return modelAndView;
	}
	
	/**
	 * GET 修改用户页面
	 * @return
	 */
	@RequiresPermissions("sysuser:list:edit")
	@RequestMapping(value = "/list/{accountId}/edit", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable Integer accountId){
		ModelAndView modelAndView = new ModelAndView(SYSTEM_USER_ADDUSER);
		SystemUser systemUser = systemUserService.querySysUserByUserId(accountId);
		modelAndView.addObject("systemUser", systemUser);
		List<SystemRole> systemRoles = systemRoleService.queryRoleList();//所有角色
		modelAndView.addObject("systemRoles", systemRoles);
		List<SystemRole> systemRoleList = systemRoleService.queryRoleByUserId(accountId);//分配角色
		modelAndView.addObject("systemRoleList", systemRoleList);
		return modelAndView;
	}
	
	/**
	 * GET 创建用户页面
	 * @return
	 */
	@RequiresPermissions("sysuser:list:add")
	@RequestMapping(value = "/list/add", method = RequestMethod.GET)
	public String add(Model model ){
		List<SystemRole> systemRoles = systemRoleService.queryRoleList();
		model.addAttribute("systemRoles", systemRoles);
		return SYSTEM_USER_ADDUSER;
	}
	
	/**
	 * POST 创建或修改用户
	 * @return
	 */
	@RequiresPermissions({"sysuser:list:add","sysuser:list:edit"})
	@RequestMapping(value = "/list/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(@ModelAttribute("systemUser") SystemUser systemUser){
		Map<String, Object> json = new HashMap<String, Object>(); 
		if(systemUser.getAccountId() == null){
			if(systemUser.getEmail()==null || systemUser.getEmail().trim().length()==0 || !WebUtil.isEmail(systemUser.getEmail())){
				json = this.setJson(false, "请输入正确的邮箱号");
				return json;
			}
			if(systemUserService.checkLoginName(systemUser.getLoginName().trim())){
				json = this.setJson(false, "该用户名已被使用");
				return json;
			}
			if(systemUser.getTelephone()==null || systemUser.getTelephone().trim().length()==0 || !WebUtil.isTelephone(systemUser.getTelephone())){
				json = this.setJson(false, "请输入正确的手机号");
				return json;
			}
			String[] roleIds = getParameterValues("roleId");
			systemUserService.createSystemUserRole(systemUser, roleIds);//创建用户及插入角色记录
			json = this.setJson(true, "用户创建成功!");
		}else{
			if(systemUser.getEmail()==null || systemUser.getEmail().trim().length()==0 || !WebUtil.isEmail(systemUser.getEmail())){
				json = this.setJson(false, "请输入正确的邮箱号");
				return json;
			}
			if(systemUser.getTelephone()==null || systemUser.getTelephone().trim().length()==0 || !WebUtil.isTelephone(systemUser.getTelephone())){
				json = this.setJson(false, "请输入正确的手机号");
				return json;
			}
			String[] roleIds = getParameterValues("roleId");
			systemUserService.updateSystemUserRole(systemUser, roleIds);//更新用户及角色记录
			json = this.setJson(true, "用户信息修改成功!");
		}
		return json;
	}
	
	/**
	 * GET 管理员个人信息界面
	 * @param request
	 * @return
	 */
	@RequiresPermissions("sysuser:info:view")
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public ModelAndView view(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView(SYSTEM_USER_INFO);
		SystemUser sysUser = systemUserService.getSystemUser();
		if (sysUser != null) {
			SystemUser systemUser = systemUserService.querySysUserByUserId(sysUser.getAccountId());
			modelAndView.addObject("systemUser", systemUser);//用户信息
			
			List<SystemUserLoginLog> systemUserLoginLogList = systemUserLoginLogService.querySysUserLoginLog(sysUser.getAccountId());
			modelAndView.addObject("systemUserLoginLogList", systemUserLoginLogList);//用户日志
			
			List<SystemRole> systemRoles = systemRoleService.queryRoleByUserId(systemUser.getAccountId());
			StringBuffer userRole = new StringBuffer();
			for(SystemRole role : systemRoles){
				userRole.append(role.getRoleName());
				userRole.append("&nbsp");
			}
			modelAndView.addObject("userRole",userRole);//用户权限
		}
		return modelAndView;
	}
	
	
	/**
	 * POST 更新管理员信息
	 * @param systemUser
	 * @return
	 */
	@RequiresPermissions("sysuser:info:edit")
	@RequestMapping(value = "/info/edit", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> edit(@ModelAttribute("systemUser") SystemUser systemUser){
		Map<String, Object> json = new HashMap<String, Object>();
		SystemUser sysUser = systemUserService.getSystemUser();
		if (sysUser != null) {
			systemUser.setAccountId(sysUser.getAccountId());
			systemUser.setUpdateBy(sysUser.getUserName());
			systemUser.setUpdateTime(new Date());
			systemUserService.updateUserInfo(systemUser);
			json = this.setJson(true);
		}else{
			json = this.setJson(false, "您未登录或者登录已超时,请先登录!");
		}
		return json;
	}
	
	/**
	 * 修改密码
	 * @param request
	 * @param user
	 * @return
	 */
	@RequiresPermissions("sysuser:info:edit")
	@RequestMapping(value = "/info/edit/psw", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> editPwd(HttpServletRequest request){
		Map<String, Object> json = new HashMap<String, Object>();
		SystemUser sysUser = systemUserService.getSystemUser();
		if (sysUser != null) {
			SystemUser systemUser = systemUserService.querySysUserByUserId(sysUser.getAccountId());
			//原密码
			String nowPassword = request.getParameter("nowPassword")==null?"":request.getParameter("nowPassword");
			//新密码
			String newPassword = request.getParameter("newPassword")==null?"":request.getParameter("newPassword");
			//确认密码
			String confirmPwd = request.getParameter("confirmPwd")==null?"":request.getParameter("confirmPwd");
			if(nowPassword.equals("")||nowPassword.trim().length() == 0){
				json = this.setJson(false, "原密码不能为空!");
				return json;
			}
			if(!MD5Utils.getMD5(nowPassword).equals(systemUser.getLoginPassword())){
				json = this.setJson(false, "原密码不正确!");
				return json;
			}
			if(newPassword.equals("")||newPassword.trim().length() == 0){
				json = this.setJson(false, "新密码不能为空!");
				return json;
			}
			if(!WebUtil.isPassword(newPassword)){
				json = this.setJson(false, "密码长度8~16位，其中数字，字母和符号至少包含两种!");
				return json;
			}
			if(!newPassword.equals(confirmPwd)){
				json = this.setJson(false, "两次输入的新密码不一致!");
				return json;
			}
			systemUser.setLoginPassword(MD5Utils.getMD5(newPassword));
			systemUserService.updateUserPws(systemUser);
			json = this.setJson(true, "修改成功!");
		}else{
			json = this.setJson(false, "您未登录或者登录已超时,请先登录!");
			return json;
		}
		return json;
	}

}
