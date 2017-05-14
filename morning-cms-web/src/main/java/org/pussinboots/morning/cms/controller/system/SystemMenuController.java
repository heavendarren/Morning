package org.pussinboots.morning.cms.controller.system;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.pussinboots.morning.cms.common.result.CmsResult;
import org.pussinboots.morning.cms.common.security.AuthorizingUser;
import org.pussinboots.morning.cms.common.util.SingletonLoginUtils;
import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.constant.CommonReturnCode;
import org.pussinboots.morning.system.entity.Menu;
import org.pussinboots.morning.system.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-cms-web Maven Webapp   
* 类名称：SystemMenuController   
* 类描述：系统目录表示层控制器      
* 创建人：陈星星   
* 创建时间：2017年4月7日 下午4:12:44   
*
 */
@Controller
@RequestMapping(value = "/system/menu")
@Api(value = "系统目录", description = "系统目录")
public class SystemMenuController  extends BaseController {
	
	@Autowired
	private IMenuService menuService;
	
	/**
	 * GET 系统菜单
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "获取系统菜单", notes = "获取系统菜单")
	@RequiresPermissions("system:menu:view")
	@GetMapping(value = "/view")
	public String list(Model model) {
		List<Menu> menus = menuService.list();
		model.addAttribute("menus", menus);
		return "/modules/menu/system_menu_list";
	}
	
	/**
	 * PUT 显示/隐藏菜单
	 * @param roleId 菜单ID
	 * @return
	 */
	@ApiOperation(value = "显示/隐藏菜单", notes = "根据url菜单ID显示/隐藏菜单")
	@RequiresPermissions("system:menu:audit")
	@PutMapping(value = "/{menuId}/audit")
	@ResponseBody
	public Object audit(@PathVariable("menuId") Long menuId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = menuService.updateStatus(menuId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * DELETE 删除菜单
	 * @param roleId 菜单ID
	 * @return
	 */
	@ApiOperation(value = "删除菜单", notes = "根据url菜单ID删除菜单")
	@RequiresPermissions("system:menu:delete")
	@DeleteMapping(value = "/{menuId}")
	@ResponseBody
	public Object delete(@PathVariable("menuId") Long menuId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = menuService.deleteByMenuId(menuId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 创建菜单页面
	 * @return
	 */
	@ApiOperation(value = "创建菜单页面", notes = "创建菜单页面")
	@RequiresPermissions("system:menu:create")
	@GetMapping(value = "/{menuId}/create")
	public String getInsertPage(Model model, @PathVariable("menuId") Long menuId) {
		Menu parentMenu = menuService.getByMenuId(menuId);
		model.addAttribute("parentMenu", parentMenu);
		return "/modules/menu/system_menu_create";
	}
	
	/**
	 * POST 创建菜单
	 * @return
	 */
	@ApiOperation(value = "创建菜单", notes = "创建菜单")
	@RequiresPermissions("system:menu:create")
	@PostMapping(value = "")
	@ResponseBody
	public Object insert(Menu menu) {

		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			// 创建菜单及插入菜单目录记录
			Integer count = menuService.insertMenu(menu, authorizingUser.getUserName());
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 更新菜单页面
	 * @return
	 */
	@ApiOperation(value = "更新菜单页面", notes = "更新菜单页面")
	@RequiresPermissions("system:menu:edit")
	@GetMapping(value = "/{menuId}/edit")
	public String getUpdatePage(Model model, @PathVariable("menuId") Long menuId) {
		Menu menu = menuService.getByMenuId(menuId);
		model.addAttribute("menu", menu);

		Menu parentMenu = menuService.getByMenuId(menu.getParentId());
		model.addAttribute("parentMenu", parentMenu);

		return "/modules/menu/system_menu_update";
	}
	
	/**
	 * PUT 更新菜单信息
	 * @return
	 */
	@ApiOperation(value = "更新管理员信息", notes = "根据url菜单ID来指定更新对象,并根据传过来的菜单信息来更新菜单信息")
	@RequiresPermissions("system:menu:edit")
	@PutMapping(value = "/{menuId}")
	@ResponseBody
	public Object update(Menu menu, @PathVariable("menuId") Long menuId) {
		
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			// 更新用户及菜单记录
			System.out.println(JSON.toJSON(menu));
			Integer count = menuService.updateMenu(menu, authorizingUser.getUserName());
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}	
	
	/**
	 * GET 菜单图标
	 * @return
	 */
	@ApiOperation(value = "获取菜单图标", notes = "获取菜单图标")
	@GetMapping(value = "/icon")
	public String icon() {
		return "/modules/menu/system_menu_icon";
	}
}
