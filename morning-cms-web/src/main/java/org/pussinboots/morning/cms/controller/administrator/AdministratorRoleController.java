package org.pussinboots.morning.cms.controller.administrator;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.pussinboots.morning.administrator.entity.Role;
import org.pussinboots.morning.administrator.pojo.dto.RoleMenuDTO;
import org.pussinboots.morning.administrator.pojo.dto.UserPageDTO;
import org.pussinboots.morning.administrator.pojo.vo.RoleMenuVO;
import org.pussinboots.morning.administrator.service.IRoleMenuService;
import org.pussinboots.morning.administrator.service.IRoleService;
import org.pussinboots.morning.administrator.service.IUserRoleService;
import org.pussinboots.morning.cms.common.result.CmsPageResult;
import org.pussinboots.morning.cms.common.result.CmsResult;
import org.pussinboots.morning.cms.common.security.AuthorizingUser;
import org.pussinboots.morning.cms.common.util.SingletonLoginUtils;
import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.constant.CommonReturnCode;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.common.support.page.PageInfo;
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

import com.alibaba.fastjson.JSON;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-cms-web Maven Webapp   
* 类名称：AdministratorRoleController   
* 类描述：角色管理表示层控制器        
* 创建人：陈星星   
* 创建时间：2017年4月6日 下午11:32:34   
*
 */
@Controller
@RequestMapping(value = "/administrator/role")
@Api(value = "角色管理", description = "角色管理")
public class AdministratorRoleController extends BaseController {
	
	@Autowired
	private IRoleService roleService;
	@Autowired
	private IRoleMenuService roleMenuService;
	@Autowired
	private IUserRoleService userRoleService;
	
	/**
	 * GET 角色列表页面
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "角色列表页面", notes = "角色列表页面")
	@RequiresPermissions("administrator:role:view")
	@GetMapping(value = "/view")
	public String getRolePage(Model model) {
		return "/modules/role/admin_role_list";
	}
	
	/**
	 * GET 角色列表
	 * @param pageInfo
	 * @param search
	 * @return
	 */
	@ApiOperation(value = "获取角色列表", notes = "根据分页信息/搜索内容获取角色列表")  
	@RequiresPermissions("administrator:role:view")
	@GetMapping(value = "/")
	@ResponseBody
	public Object listRole(PageInfo pageInfo, @RequestParam(required = false, value = "search") String search) {
		BasePageDTO<Role> basePageDTO = roleService.listByPage(pageInfo, search);
		return new CmsPageResult(basePageDTO.getList(), basePageDTO.getPageInfo().getTotal());
	}
	
	/**
	 * GET 角色分类下管理员列表页面
	 * @param roleId
	 * @return
	 */
	@ApiOperation(value = "角色分类下管理员列表页面", notes = "角色分类下管理员列表页面")
	@RequiresPermissions("administrator:role:view")
	@GetMapping(value = "/{roleId}/list")
	public String list(Model model, @PathVariable("roleId") Long roleId) {
		model.addAttribute("roleId", roleId);
		return "/modules/role/admin_user_role";
	}
	
	/**
	 * GET 角色分类下管理员列表
	 * @return
	 */
	@ApiOperation(value = "角色分类下管理员列表", notes = "根据分页信息/搜索内容查询角色分类下管理员列表")
	@RequiresPermissions("administrator:list:view")
	@GetMapping(value = "/{roleId}/lists")
	@ResponseBody
	public Object listLogs(@PathVariable("roleId") Long roleId, PageInfo pageInfo,
			@RequestParam(required = false, value = "search") String search) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();

		if (authorizingUser != null) {
			// 用户日志
			UserPageDTO userPageDTO = userRoleService.listByRoleId(roleId, pageInfo, search);
			return new CmsPageResult(userPageDTO.getUserVOs(),
					userPageDTO.getPageInfo().getTotal());
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * PUT 启用/冻结角色
	 * @param roleId 角色ID
	 * @return
	 */
	@ApiOperation(value = "启用/冻结角色", notes = "根据url角色ID启动/冻结角色")
	@RequiresPermissions("administrator:role:audit")
	@PutMapping(value = "/{roleId}/audit")
	@ResponseBody
	public Object audit(@PathVariable("roleId") Long roleId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = roleService.updateStatus(roleId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * DELETE 删除角色
	 * @param roleId 角色ID
	 * @return
	 */
	@ApiOperation(value = "删除角色", notes = "根据url角色ID删除角色")
	@RequiresPermissions("administrator:role:delete")
	@DeleteMapping(value = "/{roleId}")
	@ResponseBody
	public Object delete(@PathVariable("roleId") Long roleId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = roleService.deleteByRoleId(roleId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 创建角色页面
	 * @return
	 */
	@ApiOperation(value = "创建角色页面", notes = "创建角色页面")
	@RequiresPermissions("administrator:role:create")
	@GetMapping(value = "/create")
	public String getInsertPage(Model model) {
		List<RoleMenuDTO> menus = roleMenuService.listRoleMenus(StatusEnum.SHOW.getStatus());
		model.addAttribute("menus", JSON.toJSON(menus));
		return "/modules/role/admin_role_create";
	}
	
	/**
	 * POST 创建角色
	 * @return
	 */
	@ApiOperation(value = "创建角色", notes = "创建角色")
	@RequiresPermissions("administrator:role:create")
	@PostMapping(value = "")
	@ResponseBody
	public Object insert(Role role, @RequestParam(required = false, value = "menuIds") String menuId) {

		String[] menuIds = menuId.split(",");

		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			// 创建角色及插入角色目录记录
			Integer count = roleService.insertRole(role, menuIds, authorizingUser.getUserName());
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 更新角色页面
	 * @return
	 */
	@ApiOperation(value = "更新角色页面", notes = "更新角色页面")
	@RequiresPermissions("administrator:role:edit")
	@GetMapping(value = "/{roleId}/edit")
	public String getUpdatePage(Model model, @PathVariable("roleId") Long roleId) {
		// 目录是否选中
		List<RoleMenuVO> menus = roleMenuService.listCheckedMenus(roleId, StatusEnum.SHOW.getStatus());
		model.addAttribute("menus", JSON.toJSON(menus));
		
		// 角色信息
		Role role = roleService.selectById(roleId);
		model.addAttribute("role", role);
		
		return "/modules/role/admin_role_update";
	}
	
	/**
	 * PUT 更新角色信息
	 * @return
	 */
	@ApiOperation(value = "更新角色信息", notes = "根据url角色ID来指定更新对象,并根据传过来的角色信息来更新角色信息")
	@RequiresPermissions("administrator:role:edit")
	@PutMapping(value = "/{roleId}")
	@ResponseBody
	public Object update(Role role, @PathVariable("roleId") Long roleId,
			@RequestParam(required = false, value = "menuIds") String menuId) {
		String[] menuIds = menuId.split(",");
		
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			// 更新用户及角色记录
			Integer count = roleService.updateRole(role, menuIds, authorizingUser.getUserName());
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
}
