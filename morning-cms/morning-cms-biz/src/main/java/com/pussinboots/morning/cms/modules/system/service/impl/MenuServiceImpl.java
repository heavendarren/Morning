package com.pussinboots.morning.cms.modules.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.cms.modules.administrator.mapper.RoleMenuMapper;
import com.pussinboots.morning.cms.modules.administrator.mapper.UserRoleMapper;
import com.pussinboots.morning.cms.modules.system.entity.Menu;
import com.pussinboots.morning.cms.modules.system.enums.MenuStatusEnum;
import com.pussinboots.morning.cms.modules.system.enums.MenuTypeEnum;
import com.pussinboots.morning.cms.modules.system.mapper.MenuMapper;
import com.pussinboots.morning.cms.modules.system.service.IMenuService;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：MenuServiceImpl   
* 类描述：Menu 表业务逻辑层接口实现类   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:48:36
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {

	@Autowired
	private UserRoleMapper userRoleMapper;
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private RoleMenuMapper roleMenuMapper;
	
	@Override
	public void insertMenu(Menu menu) {
		menuMapper.insert(menu);
	}
	
	@Override
	public Menu selectByMenuId(Long menuId) {
		return menuMapper.selectById(menuId);
	}
	
	@Override
	public List<Menu> selectMenus() {
		
		List<Menu> menus = new ArrayList<>();
		
		// 查询一级目录
		List<Menu> parentMenus = menuMapper.selectMenus(MenuTypeEnum.FIRST_MENU.getType());
		// 查询二级目录
		List<Menu> childMenus = menuMapper.selectMenus(MenuTypeEnum.SECOND_MENU.getType());
		// 查询操作目录
		List<Menu> handleMenus = menuMapper.selectMenus(MenuTypeEnum.HANDLE_MENU.getType());
		
		for (Menu parentMenu : parentMenus) {// 遍历一级目录
			menus.add(parentMenu);
			for (Menu childMenu : childMenus) {// 遍历二级目录
				if (parentMenu.getMenuId() == childMenu.getParentId()) {
					menus.add(childMenu);
					for (Menu handleMenu : handleMenus) {// 遍历操作目录
						if (childMenu.getMenuId() == handleMenu.getParentId()) {
							menus.add(handleMenu);
						}
					}
				}
			}
		}
		return menus;
	}

	@Override
	public void updateMenuStatus(Long menuId, Integer status) {
		if(status.equals(MenuStatusEnum.SHOW.getStatus())){
			//显示该目录
			Menu menu = new Menu();
			menu.setMenuId(menuId);
			menu.setStatus(status);
			menuMapper.updateById(menu);
		}else if(status.equals(MenuStatusEnum.HIDDEN.getStatus())){
			//冻结该目录及其及目录
			List<Long> menuIds = new ArrayList<>();
			menuIds.add(menuId);
			getMenuIds(menuIds,menuId);
			menuMapper.updateStatusByIds(menuIds,status);
		}
	}
	
	@Override
	public void updateMenu(Menu menu) {
		menuMapper.updateById(menu);
	}
	
	@Override
	public void deleteMenu(Long menuId) {
		List<Long> menuIds = new ArrayList<>();
		menuIds.add(menuId);
		getMenuIds(menuIds,menuId);
		menuMapper.deleteBatchIds(menuIds);//删除目录及子目录
		roleMenuMapper.deleteMenus(menuIds);//删除角色授权表中记录
	}
	
	/**
	 * 根据目录ID查找目录ID的子目录
	 * @param menuId 目录ID
	 * @return List<Integer>
	 */
	private List<Long> getMenuIds(List<Long> menuIds, Long menuId) {
		Menu menu = new Menu();
		menu.setParentId(menuId);
		List<Menu> menus = menuMapper.selectList(new EntityWrapper<Menu>(menu));
		if (menus != null) {
			for (Menu childMenu : menus) {
				menuIds.add(childMenu.getMenuId());
				if (childMenu.getMenuType() == 0) {
					continue;
				}
				getMenuIds(menuIds, childMenu.getMenuId());
			}
		}
		return menuIds;
	}

}
