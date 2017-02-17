package com.pussinboots.morning.cms.modules.administrator.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.pussinboots.morning.cms.common.security.AuthorizingUser;
import com.pussinboots.morning.cms.common.util.SingletonLoginUtils;
import com.pussinboots.morning.cms.modules.administrator.entity.Role;
import com.pussinboots.morning.cms.modules.administrator.entity.User;
import com.pussinboots.morning.cms.modules.administrator.service.IRoleMenuService;
import com.pussinboots.morning.cms.modules.administrator.service.IRoleService;
import com.pussinboots.morning.cms.modules.administrator.service.IUserRoleService;
import com.pussinboots.morning.cms.modules.system.enums.MenuStatusEnum;
import com.pussinboots.morning.cms.modules.system.vo.MenuVO;
import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.result.ResponseResult;

/**
 * 
* 项目名称：morning-cms-webapp   
* 类名称：AdministratorRoleController   
* 类描述：角色表示层控制器    
* 创建人：陈星星   
* 创建时间：2017年2月17日 上午12:29:11
 */
@Controller
@RequestMapping(value = "/administrator/role")
public class AdministratorRoleController extends BaseController{
	
	/** 角色列表 */
	private static final String ADMIN_ROLE_LIST = getViewPath("modules/role/admin_role_list");
	/** 创建角色 */
	private static final String ADMIN_ROLE_CREATE = getViewPath("modules/role/admin_role_create");
	/** 修改角色 */
	private static final String ADMIN_ROLE_UPDATE = getViewPath("modules/role/admin_role_update");
	/** 管理员分类查看 */
	private static final String ADMIN_USER_ROLE = getViewPath("modules/role/admin_user_role");
	
	@Autowired
	private IRoleService roleService;
	@Autowired
	private IRoleMenuService roleMenuService;
	@Autowired
	private IUserRoleService userRoleService;
	
	/**
	 * GET 角色列表
	 * @param model
	 * @return
	 */
	@RequiresPermissions("administrator:role:view")
	@GetMapping(value = { "", "/view" })
	public String list(Model model) {
		List<Role> roles = roleService.selectRoles();
		model.addAttribute("roles", roles);
		return ADMIN_ROLE_LIST;
	}
	
	/**
	 * GET 角色分类下管理员列表
	 * @param roleId
	 * @return
	 */
	@RequiresPermissions("administrator:role:view")
	@GetMapping(value = "/{roleId}/list")
	public String list(Model model, @PathVariable("roleId") Long roleId) {
		List<User> users = userRoleService.selectUsersByRoleId(roleId);
		model.addAttribute("users", users);
		return ADMIN_USER_ROLE;
	}
	
	/**
	 * GET 添加角色
	 * @return
	 */
	@RequiresPermissions("administrator:role:create")
	@GetMapping(value = "/create")
	public String create(Model model) {
		List<MenuVO> menus = roleMenuService.selectMenus(MenuStatusEnum.SHOW.getStatus());
		model.addAttribute("menus", JSON.toJSON(menus));
		return ADMIN_ROLE_CREATE;
	}
	
	/**
	 * GET 修改角色
	 * @param model
	 * @return
	 */
	@RequiresPermissions("administrator:role:edit")
	@GetMapping(value = "/{roleId}/edit")
	public String edit(Model model, @PathVariable("roleId") Long roleId) {
		List<MenuVO> menus = roleMenuService.selectCheckedMenus(roleId, MenuStatusEnum.SHOW.getStatus());
		model.addAttribute("menus", JSON.toJSON(menus));
		Role role = roleService.selectById(roleId);
		model.addAttribute("role", role);
		return ADMIN_ROLE_UPDATE;
	}
	
	/**
	 * POST 创新角色
	 * @param role
	 * @return
	 */
	@RequiresPermissions("administrator:role:create")
	@PostMapping(value = "/create")
	@ResponseBody
	public ResponseResult create(Role role) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			String[] menuIds = getParameter("menuIds").split(",");
			roleService.insertRole(role, menuIds, authorizingUser);
			return success(true,"角色创建成功!");
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
	
	/**
	 * POST 创新角色
	 * @param role
	 * @return
	 */
	@RequiresPermissions("administrator:role:edit")
	@PostMapping(value = "/edit")
	@ResponseBody
	public ResponseResult edit(Role role) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			String[] menuIds = getParameter("menuIds").split(",");
			roleService.updateRole(role, menuIds, authorizingUser);
			return success(true,"角色修改成功!");
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
	
	/**
	 * POST 更新角色状态
	 * @param roleId 角色ID
	 * @return
	 */
	@RequiresPermissions("administrator:role:audit")
	@PostMapping(value = "/{roleId}/audit")
	@ResponseBody
	public ResponseResult audit(@PathVariable("roleId") Long roleId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer status = Integer.valueOf(getParameter("status"));
			roleService.updateRoleStatus(roleId, status);
			return success(true);
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
	
	/**
	 * DELETE 删除角色，同时删除角色记录
	 * @param roleIdm
	 * @return
	 */
	@RequiresPermissions("administrator:role:delete")
	@DeleteMapping(value = "/{roleId}/delete")
	@ResponseBody
	public ResponseResult delete(@PathVariable("roleId") Long roleId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			roleService.deleteRole(roleId);
			return success(true, "删除成功!");
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}	
}
