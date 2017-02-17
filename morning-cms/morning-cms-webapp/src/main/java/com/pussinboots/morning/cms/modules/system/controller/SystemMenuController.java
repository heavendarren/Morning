package com.pussinboots.morning.cms.modules.system.controller;

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
import com.pussinboots.morning.cms.modules.system.entity.Menu;
import com.pussinboots.morning.cms.modules.system.service.IMenuService;
import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.result.ResponseResult;

/**
 * 
* 项目名称：morning-cms-webapp   
* 类名称：SystemMenuController   
* 类描述： 菜单管理表示层控制器   
* 创建人：陈星星   
* 创建时间：2017年2月17日 上午12:31:49
 */
@Controller
@RequestMapping(value = "/system/menu")
public class SystemMenuController extends BaseController {
	
	/** 系统菜单目录 */
	private static final String SYSTEM_MENU_LIST = getViewPath("modules/menu/system_menu_list");
	/** 修改系统菜单 */
	private static final String SYSTEM_MENU_UPDATE = getViewPath("modules/menu/system_menu_update");
	/** 创建系统菜单 */
	private static final String SYSTEM_MENU_CREATE = getViewPath("modules/menu/system_menu_create");	
	/** 菜单图标*/
	private static final String SYSTEM_MENU_ICON = getViewPath("modules/menu/system_menu_icon");

	@Autowired
	private IMenuService menuService;
	
	/**
	 * GET 系统菜单
	 * @param model
	 * @return
	 */
	@RequiresPermissions("system:menu:view")
	@GetMapping(value = { "", "/view" })
	public String list(Model model) {
		List<Menu> menus = menuService.selectMenus();
		model.addAttribute("menus", menus);
		return SYSTEM_MENU_LIST;
	}
	
	/**
	 * POST 显示/隐藏目录
	 * @param menuId
	 * @return
	 */
	@RequiresPermissions("system:menu:audit")
	@PostMapping(value = "/{menuId}/audit")
	@ResponseBody
	public ResponseResult aduit(@PathVariable("menuId") Long menuId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer status = Integer.valueOf(getParameter("status"));
			menuService.updateMenuStatus(menuId, status);
			return success(true, "修改成功!");
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
	
	/**
	 * DELETE 删除目录
	 * @param menuId
	 * @return
	 */
	@RequiresPermissions("system:menu:delete")
	@DeleteMapping(value = "/{menuId}/delete")
	@ResponseBody
	public ResponseResult delete(@PathVariable("menuId") Long menuId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			menuService.deleteMenu(menuId);
			return success(true, "删除成功!");
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
	
	/**
	 * GET 添加目录
	 * @param menuId 父目录ID
	 * @param model
	 * @return
	 */
	@RequiresPermissions("system:menu:create")
	@GetMapping(value = "/{menuId}/create")
	public String add(@PathVariable("menuId") Long menuId, Model model) {
		Menu parentMenu = menuService.selectByMenuId(menuId);
		model.addAttribute("parentMenu", parentMenu);
		return SYSTEM_MENU_CREATE;
	}
	
	/**
	 * GET 修改目录
	 * @param menuId 父目录ID
	 * @param model
	 * @return
	 */
	@RequiresPermissions("system:menu:edit")
	@GetMapping(value = "/{menuId}/edit")
	public String edit(@PathVariable("menuId") Long menuId, Model model) {
		Menu menu = menuService.selectByMenuId(menuId);
		model.addAttribute("menu", menu);		
		
		Menu parentMenu = menuService.selectByMenuId(menu.getParentId());
		model.addAttribute("menuName", parentMenu.getMenuName());
		
		return SYSTEM_MENU_UPDATE;
	}
	
	/**
	 * POST 修改菜单
	 * @param menu
	 * @return
	 */
	@RequiresPermissions("system:menu:edit")
	@PostMapping(value="/edit")
	@ResponseBody
	public ResponseResult edit(Menu menu) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			menuService.updateMenu(menu);
			return success(true, "菜单修改成功!");
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
	
	/**
	 * POST 创建菜单
	 * @param menu
	 * @return
	 */
	@RequiresPermissions("system:menu:create")
	@PostMapping(value="/create")
	@ResponseBody
	public ResponseResult create(Menu menu) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			menuService.insertMenu(menu);
			return success(true, "菜单创建成功!");
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
	
	/**
	 * GET 菜单图标
	 * @return
	 */
	@GetMapping(value = "/icon")
	public String icon() {
		return SYSTEM_MENU_ICON;
	}
}
