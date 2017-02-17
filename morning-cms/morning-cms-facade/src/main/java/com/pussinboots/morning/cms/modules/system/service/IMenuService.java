package com.pussinboots.morning.cms.modules.system.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.cms.modules.system.entity.Menu;

/**
 * 
* 项目名称：morning-cms-facade   
* 类名称：IMenuService   
* 类描述：Menu 表业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:46:18
 */
public interface IMenuService extends IService<Menu> {
	
	/**
	 * 创建系统目录
	 * @param menu
	 */
	void insertMenu(Menu menu);
	
	/**
	 * 根据目录ID查找系统目录
	 * @param menuId 目录ID
	 * @return Menu 
	 */
	Menu selectByMenuId(Long menuId);
	
	/**
	 * 查询系统菜单,按照排序顺序
	 * @return
	 */
	List<Menu> selectMenus();
	
	/**
	 * 更新系统目录状态
	 * @param menuId 目录ID
	 * @param status 目录状态
	 */
	void updateMenuStatus(Long menuId, Integer status);
	
	/**
	 * 更新系统目录 
	 * @param menu 目录信息
	 */
	void updateMenu(Menu menu);
	
	/**
	 * 删除目录，同时删除角色权限表记录
	 * @param menuId 目录ID
	 */
	void deleteMenu(Long menuId);
	
}
