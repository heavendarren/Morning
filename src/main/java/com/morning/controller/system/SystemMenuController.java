package com.morning.controller.system;

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

import com.morning.common.dto.AjaxResult;
import com.morning.controller.BaseController;
import com.morning.entity.system.SystemMenu;
import com.morning.service.system.ISystemMenuService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemMenuController   
* 类描述： 系统菜单管理  
* 创建人：陈星星   
* 创建时间：2016年12月5日 下午1:52:32   
* 修改人：陈星星   
* 修改时间：2016年12月5日 下午1:52:32   
* @version
 */
@Controller
@RequestMapping(value = "/system/manage/menu")
public class SystemMenuController extends BaseController {
	
	/** 系统菜单目录 */
	private static final String SYSTEM_MENU_LIST = getViewPath("admin/menu/system_menu_list");
	/** 创建或者修改系统菜单 */
	private static final String SYSTEM_MENU_UPDATE = getViewPath("admin/menu/system_menu_update");
	/** 菜单图标*/
	private static final String SYSTEM_MENU_ICON = getViewPath("admin/menu/system_menu_icon");
	
	@Autowired
	private ISystemMenuService systemMenuService;
	
	@InitBinder("systemMenu")
	public void initBinderSystemMenu(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("systemMenu.");
	}
	
	/**
	 * GET 系统菜单
	 * @param model
	 * @return
	 */
	@RequiresPermissions("manage:menu:view")
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String list(Model model) {
		List<SystemMenu> systemMenus = systemMenuService.selectMenuList();
		model.addAttribute("systemMenus", systemMenus);
		return SYSTEM_MENU_LIST;
	}
	
	/**
	 * POST 显示/隐藏目录
	 * @param menuId
	 * @return
	 */
	@RequiresPermissions("manage:menu:audit")
	@RequestMapping(value = "/{menuId}/audit", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult aduit(@PathVariable("menuId") Integer menuId) {
		Integer status = Integer.valueOf(getParameter("status"));
		systemMenuService.updateMenuStatus(menuId, status);
		return success(true);
	}
	
	/**
	 * DELETE 删除目录
	 * @param menuId
	 * @return
	 */
	@RequiresPermissions("manage:menu:delete")
	@RequestMapping(value = "/{menuId}/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public AjaxResult delete(@PathVariable("menuId") Integer menuId) {
		systemMenuService.deleteMenu(menuId);
		return success(true);
	}
	
	/**
	 * GET 添加目录
	 * @param menuId 父目录ID
	 * @param model
	 * @return
	 */
	@RequiresPermissions("manage:menu:add")
	@RequestMapping(value = "/{menuId}/add", method = RequestMethod.GET)
	public String add(@PathVariable("menuId") Integer menuId, Model model) {
		SystemMenu parentMenu = systemMenuService.selectById(menuId);
		model.addAttribute("parentMenu", parentMenu);
		return SYSTEM_MENU_UPDATE;
	}
	
	/**
	 * GET 修改目录
	 * @param menuId 父目录ID
	 * @param model
	 * @return
	 */
	@RequiresPermissions("manage:menu:edit")
	@RequestMapping(value = "/{menuId}/edit", method = RequestMethod.GET)
	public String edit(@PathVariable("menuId") Integer menuId, Model model) {
		SystemMenu systemMenu = systemMenuService.selectById(menuId);
		model.addAttribute("systemMenu", systemMenu);		
		SystemMenu parentMenu = systemMenuService.selectById(systemMenu.getParentId());
		model.addAttribute("menuName", parentMenu.getMenuName());
		return SYSTEM_MENU_UPDATE;
	}
	
	/**
	 * POST 创建或修改菜单
	 * @param systemMenu
	 * @return
	 */
	@RequiresPermissions({"manage:menu:edit","manage:menu:add"})
	@RequestMapping(value="/save",method=RequestMethod.POST)
	@ResponseBody
	public AjaxResult save(@ModelAttribute("systemMenu") SystemMenu systemMenu) {
		if (systemMenu.getMenuId() == null) {
			systemMenuService.insertMenu(systemMenu);
			return success(true, "菜单创建成功!");
		} else {
			systemMenuService.updateMenu(systemMenu);
			return success(true, "菜单修改成功!");
		}
	}
	
	/**
	 * GET 菜单图标
	 * @return
	 */
	@RequestMapping(value = "/icon", method = RequestMethod.GET)
	public String icon() {
		return SYSTEM_MENU_ICON;
	}

}
