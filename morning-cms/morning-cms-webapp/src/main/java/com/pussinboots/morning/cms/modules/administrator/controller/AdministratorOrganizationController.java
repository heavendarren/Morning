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

import com.pussinboots.morning.cms.common.security.AuthorizingUser;
import com.pussinboots.morning.cms.common.util.SingletonLoginUtils;
import com.pussinboots.morning.cms.modules.administrator.entity.Organization;
import com.pussinboots.morning.cms.modules.administrator.service.IOrganizationService;
import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.result.ResponseResult;

/**
 * 
* 项目名称：morning-cms-webapp   
* 类名称：AdministratorOrganizationController   
* 类描述：组织管理表示层控制器   
* 创建人：陈星星   
* 创建时间：2017年2月17日 上午12:28:52
 */
@Controller
@RequestMapping(value = "/administrator/organization")
public class AdministratorOrganizationController extends BaseController{
	
	/** 组织列表 */
	private static final String ADMIN_ORGANIZATION_LIST = getViewPath("modules/organization/admin_organization_list");
	/** 创建组织 */
	private static final String ADMIN_ORGANIZATION_CREATE = getViewPath("modules/organization/admin_organization_create");
	/** 修改组织 */
	private static final String ADMIN_ORGANIZATION_UPDATE = getViewPath("modules/organization/admin_organization_update");
	
	@Autowired
	private IOrganizationService organizationService;
	
	/**
	 * GET 组织列表
	 * @param model
	 * @return
	 */
	@RequiresPermissions("administrator:organization:view")
	@GetMapping(value = { "", "/view" })
	public String list(Model model) {
		List<Organization> organizations = organizationService.selectOrganizations();
		model.addAttribute("organizations", organizations);
		return ADMIN_ORGANIZATION_LIST;
	}
	
	
	/**
	 * GET 添加组织
	 * @return
	 */
	@RequiresPermissions("administrator:organization:create")
	@GetMapping(value = "/create")
	public String create() {
		return ADMIN_ORGANIZATION_CREATE;
	}
	
	/**
	 * GET 修改组织
	 * @param model
	 * @return
	 */
	@RequiresPermissions("administrator:organization:edit")
	@GetMapping(value = "/{organizationId}/edit")
	public String edit(Model model, @PathVariable("organizationId") Long organizationId) {
		Organization organization = organizationService.selectById(organizationId);
		model.addAttribute("organization", organization);
		return ADMIN_ORGANIZATION_UPDATE;
	}
	
	/**
	 * POST 创新组织
	 * @param organization 组织信息
	 * @return
	 */
	@RequiresPermissions("administrator:organization:create")
	@PostMapping(value = "/create")
	@ResponseBody
	public ResponseResult create(Organization organization) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			organizationService.insertOrganization(organization, authorizingUser);
			return success(true,"组织创建成功!");
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
	
	/**
	 * POST 修改组织信息
	 * @param organization 组织信息
	 * @return
	 */
	@RequiresPermissions("administrator:organization:edit")
	@PostMapping(value = "/edit")
	@ResponseBody
	public ResponseResult edit(Organization organization) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			organizationService.updateOrganization(organization, authorizingUser);
			return success(true,"组织修改成功!");
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
	
	/**
	 * POST 更新角色状态
	 * @param roleId 角色ID
	 * @return
	 */
	@RequiresPermissions("administrator:organization:audit")
	@PostMapping(value = "/{organizationId}/audit")
	@ResponseBody
	public ResponseResult audit(@PathVariable("organizationId") Long organizationId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer status = Integer.valueOf(getParameter("status"));
			organizationService.updateOrganizationStatus(organizationId, status);
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
	@RequiresPermissions("administrator:organization:delete")
	@DeleteMapping(value = "/{organizationId}/delete")
	@ResponseBody
	public ResponseResult delete(@PathVariable("organizationId") Long organizationId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			organizationService.deleteOrganization(organizationId);
			return success(true, "删除成功!");
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}

}
