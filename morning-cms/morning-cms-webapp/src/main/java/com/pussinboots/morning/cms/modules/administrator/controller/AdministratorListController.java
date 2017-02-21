package com.pussinboots.morning.cms.modules.administrator.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pussinboots.morning.cms.common.security.AuthorizingUser;
import com.pussinboots.morning.cms.common.util.SingletonLoginUtils;
import com.pussinboots.morning.cms.modules.administrator.entity.Organization;
import com.pussinboots.morning.cms.modules.administrator.entity.Role;
import com.pussinboots.morning.cms.modules.administrator.entity.User;
import com.pussinboots.morning.cms.modules.administrator.entity.UserLoginLog;
import com.pussinboots.morning.cms.modules.administrator.enums.OrganizationStatusEnum;
import com.pussinboots.morning.cms.modules.administrator.enums.RoleStatusEnum;
import com.pussinboots.morning.cms.modules.administrator.service.IOrganizationService;
import com.pussinboots.morning.cms.modules.administrator.service.IRoleService;
import com.pussinboots.morning.cms.modules.administrator.service.IUserLoginLogService;
import com.pussinboots.morning.cms.modules.administrator.service.IUserRoleService;
import com.pussinboots.morning.cms.modules.administrator.service.IUserService;
import com.pussinboots.morning.cms.modules.administrator.vo.UserVO;
import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.exception.ValidateException;
import com.pussinboots.morning.common.result.ResponseResult;
import com.pussinboots.morning.common.util.RegexUtils;

/**
 * 
* 项目名称：morning-cms-webapp   
* 类名称：AdministratorListController   
* 类描述：管理员列表表示层控制器  
* 创建人：陈星星   
* 创建时间：2017年2月17日 上午12:27:55
 */
@Controller
@RequestMapping(value = "/administrator/list")
public class AdministratorListController extends BaseController{
	
	private static Logger logger = LoggerFactory.getLogger(AdministratorListController.class);
	
	/** 管理员列表 */
	private static final String ADMIN_USER_LIST = getViewPath("modules/admin/admin_user_list");
	/** 个人资料 */
	private static final String ADMIN_USER_MESSAGE = getViewPath("modules/admin/admin_user_message");
	/** 登录日志 */
	private static final String ADMIN_USER_LOGIN_LOG = getViewPath("modules/admin/admin_user_login_log");
	/** 创建用户  */
	private static final String ADMIN_USER_CREATE = getViewPath("modules/admin/admin_user_create");
	/** 修改用户  */
	private static final String ADMIN_USER_UPDATE = getViewPath("modules/admin/admin_user_update");
	
	@Autowired
	private IUserService userService;
	@Autowired
	private IRoleService roleService;
	@Autowired
	private IUserRoleService userRoleService;
	@Autowired
	private IUserLoginLogService userLoginLogService;
	@Autowired
	private IOrganizationService organizationService;
	
	/**
	 * GET 管理员列表
	 * @param model
	 * @return
	 */
	@RequiresPermissions("administrator:list:view")
	@GetMapping(value = { "", "/view" })
	public String list(Model model, UserVO userVo) {
		
		List<UserVO> users = userService.selectAllUser(userVo);
		model.addAttribute("users", users);// 用户列表
		
		return ADMIN_USER_LIST;
	}
	
	/**
	 * GET 个人资料
	 * @param model
	 * @param userId 管理员ID
	 * @return
	 */
	@RequiresPermissions("administrator:list:view")
	@GetMapping(value = "/{userId}/detail")
	public String detail(Model model, @PathVariable Long userId){
		User user = userService.selectByUserId(userId);
		model.addAttribute("user", user);//用户信息
		
		List<Role> roles = userRoleService.selectRolesByUserId(user.getUserId(),1);
		model.addAttribute("roles", roles);// 用户权限
		
		return ADMIN_USER_MESSAGE;
	}
	
	/**
	 * Get 用户登录日志
	 * @param model
	 * @param userId 管理员ID
	 * @return
	 */
	@RequiresPermissions("administrator:list:view")
	@GetMapping(value = "/{userId}/log")
	public String userLog(Model model, @PathVariable Long userId){
		
		List<UserLoginLog> userLoginLogs = userLoginLogService.selectUserLoginLog(userId);
		model.addAttribute("userLoginLogs", userLoginLogs);
		
		return ADMIN_USER_LOGIN_LOG;
	}
	
	/**
	 * POST 启用/禁止用户
	 * @param request
	 * @return
	 */
	@RequiresPermissions("administrator:list:audit")
	@PostMapping(value = "/{userId}/audit")
	@ResponseBody
	public ResponseResult audit(@PathVariable Long userId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer status = Integer.valueOf(getParameter("status"));
			userService.updateUserStatus(userId, status);
			return success(true, "修改成功!");
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
	
	/**
	 * DELETE 删除用户
	 * @return
	 */
	@RequiresPermissions("administrator:list:delete")
	@DeleteMapping(value = "/{userId}/delete")
	@ResponseBody
	public ResponseResult delete(@PathVariable Long userId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			userService.deleteUser(userId);
			return success(true, "删除成功!");
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
	
	/**
	 * GET 修改用户
	 * @return
	 */
	@RequiresPermissions("administrator:list:edit")
	@GetMapping(value = "/{userId}/edit")
	public String edit(Model model, @PathVariable Long userId){
		// 用户信息
		User user = userService.selectByUserId(userId);
		model.addAttribute("user", user);
		
		// 用户权限
		List<Role> roles = roleService.selectRoles(RoleStatusEnum.NORMAL.getStatus());
		model.addAttribute("roles", roles);
		
		//分配角色
		List<Role> userRoles = userRoleService.selectRolesByUserId(user.getUserId(),RoleStatusEnum.NORMAL.getStatus());
		model.addAttribute("userRoles", userRoles);
		
		// 组织列表
		List<Organization> organizations = organizationService.selectOrganizations(OrganizationStatusEnum.NORMAL.getStatus());
		model.addAttribute("organizations", organizations);
		
		return ADMIN_USER_UPDATE;
	}
	
	/**
	 * GET 创建用户
	 * @return
	 */
	@RequiresPermissions("administrator:list:create")
	@GetMapping(value = "/create")
	public String create(Model model) {
		// 用户权限
		List<Role> roles = roleService.selectRoles(RoleStatusEnum.NORMAL.getStatus());
		model.addAttribute("roles", roles);
		
		// 组织列表
		List<Organization> organizations = organizationService.selectOrganizations(OrganizationStatusEnum.NORMAL.getStatus());
		model.addAttribute("organizations", organizations);
		
		return ADMIN_USER_CREATE;
	}
	
	/**
	 * POST 修改用户
	 * @return
	 */
	@RequiresPermissions("administrator:list:edit")
	@PostMapping(value = "/edit")
	@ResponseBody
	public ResponseResult edit(User user) {
		String[] roleIds = getParameterValues("roleId");
		
		if(!RegexUtils.isEmail(user.getEmail())){
			return fail(false, "请输入正确的电子邮箱");
		}
		if(!RegexUtils.isTelephone(user.getTelephone())){
			return fail(false, "请输入正确的手机号码");
		}
		
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			userService.updateUserInfo(user, roleIds, authorizingUser);// 更新用户及角色记录
			return success(true, "用户信息修改成功!");
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
	
	/**
	 * POST 创建用户
	 * @return
	 */
	@RequiresPermissions("administrator:list:create")
	@PostMapping(value = "/create")
	@ResponseBody
	public ResponseResult create(User user) {
		String[] roleIds = getParameterValues("roleId");
		
		if(!RegexUtils.isEmail(user.getEmail())){
			return fail(false, "请输入正确的电子邮箱");
		}
		if(!RegexUtils.isTelephone(user.getTelephone())){
			return fail(false, "请输入正确的手机号码");
		}
		
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			try {
				userService.insertUser(user, roleIds, authorizingUser);//创建用户及插入角色记录
				return success(true, "用户创建成功!");
			} catch (ValidateException e) {
				logger.error(e.getMessage(), e);
				return fail(false, e.getMessage());
			}
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}

}
