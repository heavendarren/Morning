package org.pussinboots.morning.cms.controller.administrator;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.pussinboots.morning.administrator.entity.Organization;
import org.pussinboots.morning.administrator.entity.Role;
import org.pussinboots.morning.administrator.entity.User;
import org.pussinboots.morning.administrator.entity.UserLoginLog;
import org.pussinboots.morning.administrator.pojo.dto.UserPageDTO;
import org.pussinboots.morning.administrator.service.IOrganizationService;
import org.pussinboots.morning.administrator.service.IRoleService;
import org.pussinboots.morning.administrator.service.IUserLoginLogService;
import org.pussinboots.morning.administrator.service.IUserRoleService;
import org.pussinboots.morning.administrator.service.IUserService;
import org.pussinboots.morning.cms.common.result.CmsPageResult;
import org.pussinboots.morning.cms.common.result.CmsResult;
import org.pussinboots.morning.cms.common.security.AuthorizingUser;
import org.pussinboots.morning.cms.common.util.SingletonLoginUtils;
import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.constant.CommonReturnCode;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.common.exception.ValidateException;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.common.util.RegexUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-cms-web Maven Webapp   
* 类名称：AdministratorListController   
* 类描述：管理员列表表示层控制器     
* 创建人：陈星星   
* 创建时间：2017年4月2日 下午4:12:17   
*
 */
@Controller
@RequestMapping(value = "/administrator/list")
@Api(value = "管理员列表", description = "管理员列表")
public class AdministratorListController extends BaseController{
	
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
	 * GET 管理员列表页面
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "管理员列表页面", notes = "管理员列表页面")
	@RequiresPermissions("administrator:list:view")
	@GetMapping(value = "/view")
	public String getListPage(Model model) {
		return "/modules/admin/admin_user_list";
	}
	
	/**
	 * GET 管理员列表
	 * @param pageInfo
	 * @param search
	 * @return
	 */
	@ApiOperation(value = "获取管理员列表", notes = "根据分页信息/搜索内容获取管理员列表")  
	@RequiresPermissions("administrator:info:view")
	@GetMapping(value = "/")
	@ResponseBody
	public Object listUser(PageInfo pageInfo, @RequestParam(required = false, value = "search") String search) {
		UserPageDTO userPageDTO = userService.listByPage(pageInfo, search);
		return new CmsPageResult(userPageDTO.getUserVOs(), userPageDTO.getPageInfo().getTotal());
	}
	
	/**
	 * GET 个人资料
	 * @param model
	 * @param userId 管理员ID
	 * @return
	 */
	@ApiOperation(value = "获取管理员个人资料", notes = "根据url管理员ID获取管理员个人资料")
	@RequiresPermissions("administrator:list:view")
	@GetMapping(value = "/{userId}")
	public String detail(Model model, @PathVariable Long userId){
		// 用户信息
		User user = userService.getById(userId);
		model.addAttribute("user", user);
		
		// 分配角色
		List<Role> roles = userRoleService.listByUserId(user.getUserId(), StatusEnum.NORMAL.getStatus());
		model.addAttribute("roles", roles);// 用户权限
		
		return "/modules/admin/admin_user_message";
	}
	
	/**
	 * PUT 启用/冻结管理员
	 * @param userId 管理员ID
	 * @return
	 */
	@ApiOperation(value = "启用/冻结管理员", notes = "根据url管理员ID启动/冻结管理员")
	@RequiresPermissions("administrator:list:audit")
	@PutMapping(value = "/{userId}/audit")
	@ResponseBody
	public Object audit(@PathVariable("userId") Long userId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = userService.updateStatus(userId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * DELETE 删除管理员
	 * @param userId 管理员ID
	 * @return
	 */
	@ApiOperation(value = "删除管理员", notes = "根据url管理员ID删除管理员")
	@RequiresPermissions("administrator:list:delete")
	@DeleteMapping(value = "/{userId}")
	@ResponseBody
	public Object delete(@PathVariable("userId") Long userId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = userService.deleteByUserId(userId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 管理员登录日志列表页面
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "管理员登录日志列表页面", notes = "管理员登录日志列表页面")
	@RequiresPermissions("administrator:list:view")
	@GetMapping(value = "/{userId}/log")
	public String getLogPage(Model model, @PathVariable("userId") Long userId) {
		model.addAttribute("userId", userId);
		return "/modules/admin/admin_user_login_log";
	}
	
	/**
	 * GET 管理员登录日志列表
	 * @return
	 */
	@ApiOperation(value = "管理员登录日志列表", notes = "根据分页信息/搜索内容查询管理员登录日志列表")
	@RequiresPermissions("administrator:list:view")
	@GetMapping(value = "/{userId}/logs")
	@ResponseBody
	public Object listLogs(@PathVariable("userId") Long userId, PageInfo pageInfo,
			@RequestParam(required = false, value = "search") String search) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();

		if (authorizingUser != null) {
			// 用户日志
			BasePageDTO<UserLoginLog> basePageDTO = userLoginLogService.listByUserId(userId, pageInfo, search);
			return new CmsPageResult(basePageDTO.getList(), basePageDTO.getPageInfo().getTotal());
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 创建管理员页面
	 * @return
	 */
	@ApiOperation(value = "创建管理员页面", notes = "创建管理员页面")
	@RequiresPermissions("administrator:list:create")
	@GetMapping(value = "/create")
	public String getInsertPage(Model model) {
		// 用户权限
		List<Role> roles = roleService.listBySataus(StatusEnum.NORMAL.getStatus());
		model.addAttribute("roles", roles);

		// 组织列表
		List<Organization> organizations = organizationService.listBySataus(StatusEnum.NORMAL.getStatus());
		model.addAttribute("organizations", organizations);

		return "/modules/admin/admin_user_create";
	}
	
	/**
	 * POST 创建管理员
	 * @return
	 */
	@ApiOperation(value = "创建管理员", notes = "创建管理员")
	@RequiresPermissions("administrator:list:create")
	@PostMapping(value = "")
	@ResponseBody
	public Object insert(User user, @RequestParam(required = false, value = "roleId") String[] roleIds) {
		if (!RegexUtils.isEmail(user.getEmail())) {
			return new CmsResult(CommonReturnCode.FAILED.getCode(), "请输入正确的电子邮箱!");
		}
		if (!RegexUtils.isTelephone(user.getTelephone())) {
			return new CmsResult(CommonReturnCode.FAILED.getCode(), "请输入正确的手机号码!");
		}

		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			try {
				// 创建用户及插入角色记录
				Integer count = userService.insertUser(user, roleIds, authorizingUser.getUserName());
				return new CmsResult(CommonReturnCode.SUCCESS, count);
			} catch (ValidateException e) {
				logger.error(e.getMessage(), e);
				return new CmsResult(e.getCode(), e.getMessage());
			}
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 更新管理员页面
	 * @return
	 */
	@ApiOperation(value = "更新管理员页面", notes = "更新管理员页面")
	@RequiresPermissions("administrator:list:edit")
	@GetMapping(value = "/{userId}/edit")
	public String getUpdatePage(Model model, @PathVariable("userId") Long userId) {
		// 用户信息
		User user = userService.getById(userId);
		model.addAttribute("user", user);

		// 用户权限
		List<Role> roles = roleService.listBySataus(StatusEnum.NORMAL.getStatus());
		model.addAttribute("roles", roles);

		// 组织列表
		List<Organization> organizations = organizationService.listBySataus(StatusEnum.NORMAL.getStatus());
		model.addAttribute("organizations", organizations);

		// 分配角色
		List<Role> userRoles = userRoleService.listByUserId(user.getUserId(), StatusEnum.NORMAL.getStatus());
		model.addAttribute("userRoles", userRoles);

		return "/modules/admin/admin_user_update";
	}
	
	/**
	 * PUT 更新管理员信息
	 * @return
	 */
	@ApiOperation(value = "更新管理员信息", notes = "根据url管理员ID来指定更新对象,并根据传过来的管理员信息来更新管理员信息")
	@RequiresPermissions("administrator:list:edit")
	@PutMapping(value = "/{userId}")
	@ResponseBody
	public Object update(User user, @PathVariable("userId") Long userId,
			@RequestParam(required = false, value = "roleId") String[] roleIds) {
		if (!RegexUtils.isEmail(user.getEmail())) {
			return new CmsResult(CommonReturnCode.FAILED.getCode(), "请输入正确的电子邮箱!");
		}
		if (!RegexUtils.isTelephone(user.getTelephone())) {
			return new CmsResult(CommonReturnCode.FAILED.getCode(), "请输入正确的手机号码!");
		}

		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			// 更新用户及角色记录
			Integer count = userService.updateUser(user, roleIds, authorizingUser.getUserName());
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
}
