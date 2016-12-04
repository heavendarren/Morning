package com.morning.controller.role;

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

import com.alibaba.fastjson.JSON;
import com.morning.common.dto.AjaxResult;
import com.morning.controller.BaseController;
import com.morning.entity.system.SystemMenu;
import com.morning.entity.system.SystemRole;
import com.morning.service.system.ISystemMenuService;
import com.morning.service.system.ISystemRoleService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：RoleController   
* 类描述：角色表示层   
* 创建人：陈星星   
* 创建时间：2016年11月29日 下午8:36:07   
* 修改人：陈星星   
* 修改时间：2016年11月29日 下午8:36:07   
* @version
 */
@Controller
@RequestMapping("/system/sysuser/role")
public class RoleController extends BaseController{
	
	/** 角色列表 */
	private static final String SYSTEM_ROLE_LIST = getViewPath("admin/role/system_role_list");
	/** 创建或者修改角色 */
	private static final String SYSTEM_ROLE_UPDATE = getViewPath("admin/role/system_role_update");
	
	@Autowired
	private ISystemRoleService systemRoleService;
	@Autowired
	private ISystemMenuService systemMenuService;
	
	@InitBinder("systemRole")
	public void initBinderSystemRole(WebDataBinder binder){
		binder.setFieldDefaultPrefix("systemRole.");
	}
	
	/**
	 * GET 角色列表
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sysuser:role:view")
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String list(Model model) {
		List<SystemRole> systemRoles = systemRoleService.selectRoleList();
		model.addAttribute("systemRoles", systemRoles);
		return SYSTEM_ROLE_LIST;
	}
	
	/**
	 * GET 添加角色
	 * @return
	 */
	@RequiresPermissions("sysuser:role:add")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(Model model) {
		List<SystemMenu> systemMenus = systemMenuService.selectMenus();
		model.addAttribute("systemMenus", JSON.toJSON(systemMenus));
		return SYSTEM_ROLE_UPDATE;
	}
	
	/**
	 * GET 修改角色
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sysuser:role:edit")
	@RequestMapping(value = "/{roleId}/edit", method = RequestMethod.GET)
	public String edit(Model model,@PathVariable("roleId") Integer roleId) {
		try {
			List<SystemMenu> systemMenus = systemMenuService.selectCheckedMenus(roleId);
			model.addAttribute("systemMenus", JSON.toJSON(systemMenus));
			SystemRole systemRole = systemRoleService.selectById(roleId);
			model.addAttribute("systemRole", systemRole);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SYSTEM_ROLE_UPDATE;
	}
	
	/**
	 * POST 创新角色/修改角色
	 * @param systemRole
	 * @return
	 */
	@RequiresPermissions({ "sysuser:role:add", "sysuser:role:edit" })
	@RequestMapping(value = "save", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult save(@ModelAttribute("systemRole") SystemRole systemRole) {
		String[] menuIds = getParameter("menuIds").split(",");
		if (systemRole.getRoleId() == null) {
			systemRoleService.insertSystemRole(systemRole, menuIds);
			return success(true,"角色创建成功!");
		} else {
			systemRoleService.updateSystemRole(systemRole, menuIds);
			return success(true,"角色修稿成功!");
		}
	}
	
	/**
	 * DELETE 删除角色，同时删除角色记录
	 * @param roleIdm
	 * @return
	 */
	@RequiresPermissions("sysuser:role:delete")
	@RequestMapping(value = "/{roleId}/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public AjaxResult delete(@PathVariable("roleId") Integer roleId) {
		systemRoleService.deleteSysRole(roleId);
		return success(true);
	}

}
