package com.morning.controller.system;

import java.util.Date;
import java.util.List;

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

import com.morning.common.dto.AjaxResult;
import com.morning.common.security.SystemAuthorizingUser;
import com.morning.common.util.MD5Utils;
import com.morning.common.util.SingletonLoginUtils;
import com.morning.common.util.toolbox.DateUtil;
import com.morning.common.util.toolbox.WebUtil;
import com.morning.controller.BaseController;
import com.morning.entity.system.SystemRole;
import com.morning.entity.system.SystemUser;
import com.morning.entity.system.SystemUserLoginLog;
import com.morning.entity.system.SystemUserRole;
import com.morning.entity.user.QueryUser;
import com.morning.service.system.ISystemRoleService;
import com.morning.service.system.ISystemUserLoginLogService;
import com.morning.service.system.ISystemUserRoleService;
import com.morning.service.system.ISystemUserService;

/**
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
	private static final String USER_LOGIN_LOG = getViewPath("admin/user/user_login_log");
	/** 管理员分类查看 */
	private static final String SYSTEM_USER_ROLE = getViewPath("admin/system/system_user_role");
	/** 创建或者修改用户界面 */
	private static final String SYSTEM_USER_ADDUSER = getViewPath("admin/system/system_user_addUser");
	/** 系统管理员信息界面 */
	private static final String SYSTEM_USER_INFO = getViewPath("admin/system/system_user_info");

	@Autowired
	private ISystemUserService systemUserService;
	@Autowired
	private ISystemUserLoginLogService systemUserLoginLogService;
	@Autowired
	private ISystemRoleService systemRoleService;
	@Autowired
	private ISystemUserRoleService systemUserRoleService;


	@InitBinder("systemUser")
	public void initBinderSystemUser(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("systemUser.");
	}

	@InitBinder("queryUser")
	public void initQueryUser(WebDataBinder dinder) {
		dinder.setFieldDefaultPrefix("queryUser.");
	}
	
	/**
	 * GET 管理员列表
	 * @param request
	 * @return
	 */
	@RequiresPermissions("sysuser:list:view")
	@RequestMapping(value = "/list")
	public String list(Model model, @ModelAttribute("queryUser") QueryUser queryUser) {
		int sysUserNumber = systemUserService.selectAllSystemUserNumber();
		model.addAttribute("sysUserNumber", sysUserNumber);// 用户总数量
		String updateTime = DateUtil.formatDateTime(new Date());
		model.addAttribute("updateTime", updateTime);// 查询时间
		List<SystemUser> systemUsers = systemUserService.selectAllSystemUser(queryUser);
		model.addAttribute("systemUsers", systemUsers);// 用户列表
		List<SystemRole> systemRoles = systemRoleService.selectRoleAndNumber();
		model.addAttribute("systemRoles", systemRoles);// 权限列表
		return SYSTEM_USER_LIST;
	}
	
	/**
	 * GET 个人资料
	 * @param accountId 用户编号
	 * @return
	 */
	@RequiresPermissions("user:list:view")
	@RequestMapping(value = "/list/{accountId}/detail", method = RequestMethod.GET)
	public String detail(Model model, @PathVariable Integer accountId){
		SystemUser user = systemUserService.selectById(Long.valueOf(accountId));
		model.addAttribute("user", user);//用户信息
		List<SystemUserRole> systemUserRoles = systemUserRoleService.selectRoleListByAccountId(accountId);
		StringBuilder userRole = new StringBuilder();
		for(SystemUserRole systemUserRole : systemUserRoles){
			userRole.append(systemUserRole.getRoleName());
			userRole.append("&nbsp");
		}
		model.addAttribute("userRole",userRole);//用户权限
		return SYSTEM_USER_MESSAGE;
	}
	
	/**
	 * Get 用户登录日志
	 * @param accountId
	 * @return
	 */
	@RequiresPermissions("sysuser:list:view")
	@RequestMapping(value = "/list/{accountId}/log", method = RequestMethod.GET)
	public String userLog(Model model, @PathVariable Integer accountId){
		List<SystemUserLoginLog> systemUserLoginLogList = systemUserLoginLogService.selectUserLoginLog(accountId);
		model.addAttribute("userLoginLogList", systemUserLoginLogList);
		return USER_LOGIN_LOG;
	}
	
	/**
	 * POST 启用/禁止用户
	 * @param request
	 * @return
	 */
	@RequiresPermissions("sysuser:list:audit")
	@RequestMapping(value = "/list/{accountId}/audit", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult audit(@PathVariable Integer accountId) {
		Integer status = Integer.valueOf(getParameter("status"));
		systemUserService.updateUserStatus(accountId, status);
		return success(true);
	}
	
	/**
	 * DELETE 删除用户
	 * @return
	 */
	@RequiresPermissions("sysuser:list:delete")
	@RequestMapping(value = "/list/{accountId}/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public AjaxResult delete(@PathVariable Integer accountId) {
		systemUserService.deleteSysUser(accountId);
		return success(true);
	}
	
	/**
	 * GET 角色分类下管理员列表
	 * @param roleId
	 * @return
	 */
	@RequiresPermissions("sysuser:list:view")
	@RequestMapping(value = "/list/{roleId}/role", method = RequestMethod.GET)
	public String listRole(Model model, @PathVariable Integer roleId) {
		List<SystemUser> systemUsers = systemUserService.selectSysUserByRoleId(roleId);
		model.addAttribute("systemUsers", systemUsers);
		return SYSTEM_USER_ROLE;
	}
	
	/**
	 * GET 修改用户页面
	 * @return
	 */
	@RequiresPermissions("sysuser:list:edit")
	@RequestMapping(value = "/list/{accountId}/edit", method = RequestMethod.GET)
	public String edit(Model model, @PathVariable Integer accountId){
		SystemUser systemUser = systemUserService.selectById(Long.valueOf(accountId));
		model.addAttribute("systemUser", systemUser);//用户信息
		List<SystemRole> systemRoles = systemRoleService.selectRoleList();
		model.addAttribute("systemRoles", systemRoles);//所有角色
		List<SystemUserRole> systemRoleList = systemUserRoleService.selectRoleListByAccountId(accountId);
		model.addAttribute("systemRoleList", systemRoleList);//分配角色
		return SYSTEM_USER_ADDUSER;
	}
	
	/**
	 * GET 创建用户页面
	 * @return
	 */
	@RequiresPermissions("sysuser:list:add")
	@RequestMapping(value = "/list/add", method = RequestMethod.GET)
	public String add(Model model) {
		List<SystemRole> systemRoles = systemRoleService.selectRoleList();
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
	public AjaxResult update(@ModelAttribute("systemUser") SystemUser systemUser) {
		String[] roleIds = getParameterValues("roleId");
		if(!WebUtil.isEmail(systemUser.getEmail())){
			return fail(false, "请输入正确的电子邮箱");
		}
		if(!WebUtil.isTelephone(systemUser.getTelephone())){
			return fail(false, "请输入正确的手机号码");
		}
		if(systemUser.getAccountId() == null){
			if(systemUserService.checkLoginName(systemUser.getLoginName())){
				return fail(false, "该用户名已被使用");
			}
			systemUserService.insertSystemUser(systemUser, roleIds);//创建用户及插入角色记录
			return success(true, "用户创建成功!");
		}else{
			systemUserService.updateUserInfoBySystem(systemUser, roleIds);//更新用户及角色记录
			return success(true, "用户信息修改成功!");
		}
	}
	
	/**
	 * GET 管理员个人信息界面
	 * @param request
	 * @return
	 */
	@RequiresPermissions("sysuser:info:view")
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String view(Model model) {
		SystemAuthorizingUser sysUser = SingletonLoginUtils.getSystemUser();
		if (sysUser != null) {
			SystemUser systemUser = systemUserService.selectByLoginName(sysUser
					.getLoginName());
			model.addAttribute("systemUser", systemUser);// 用户信息

			List<SystemUserLoginLog> systemUserLoginLogList = systemUserLoginLogService
					.selectUserLoginLog(systemUser.getAccountId());
			model.addAttribute("systemUserLoginLogList", systemUserLoginLogList);// 用户日志

			List<SystemUserRole> systemUserRoles = systemUserRoleService
					.selectRoleListByAccountId(systemUser.getAccountId());
			StringBuilder userRole = new StringBuilder();
			for (SystemUserRole systemUserRole : systemUserRoles) {
				userRole.append(systemUserRole.getRoleName());
				userRole.append("&nbsp");
			}
			model.addAttribute("userRole", userRole);// 用户权限
		}
		return SYSTEM_USER_INFO;
	}
	
	
	/**
	 * POST 更新管理员信息
	 * @param systemUser
	 * @return
	 */
	@RequiresPermissions("sysuser:info:edit")
	@RequestMapping(value = "/info/edit", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult edit(@ModelAttribute("systemUser") SystemUser systemUser){
		SystemAuthorizingUser sysUser = SingletonLoginUtils.getSystemUser();
		if (sysUser != null) {
			systemUser.setAccountId(sysUser.getAccountId());
			systemUserService.updateUserInfo(systemUser);
			return success(true);
		}else{
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
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
	public AjaxResult editPwd(HttpServletRequest request){
		SystemAuthorizingUser sysUser = SingletonLoginUtils.getSystemUser();
		if (sysUser != null) {
			SystemUser systemUser = systemUserService.selectByLoginName(sysUser.getLoginName());
			// 原密码
			String nowPassword = request.getParameter("nowPassword") == null ? ""
					: request.getParameter("nowPassword");
			// 新密码
			String newPassword = request.getParameter("newPassword") == null ? ""
					: request.getParameter("newPassword");
			// 确认密码
			String confirmPwd = request.getParameter("confirmPwd") == null ? ""
					: request.getParameter("confirmPwd");
			if(!MD5Utils.getMD5(nowPassword).equals(systemUser.getLoginPassword())){
				return fail(false, "原密码不正确!");
			}
			if(!WebUtil.isPassword(newPassword)){
				return fail(false, "密码长度8~16位，其中数字，字母和符号至少包含两种!");
			}
			if(!newPassword.equals(confirmPwd)){
				return fail(false, "两次输入的新密码不一致!");
			}
			systemUserService.updateUserPws(systemUser.getAccountId(), newPassword);
			return success(true, "修改成功!");
		}else{
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}

}
