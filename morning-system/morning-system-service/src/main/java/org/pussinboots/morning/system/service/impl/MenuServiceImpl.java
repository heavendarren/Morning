package org.pussinboots.morning.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.system.common.enums.MenuTypeEnum;
import org.pussinboots.morning.system.entity.Menu;
import org.pussinboots.morning.system.mapper.MenuMapper;
import org.pussinboots.morning.system.service.IMenuService;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-system-service   
* 类名称：MenuServiceImpl   
* 类描述：Menu / 目录表 业务逻辑层接口实现    
* 创建人：陈星星   
* 创建时间：2017年4月7日 下午2:15:30   
*
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {
	
	@Autowired
	private MenuMapper menuMapper;
	
	@Override
	public Integer insertMenu(Menu menu, String userName) {
		menu.setCreateBy(userName);
		menu.setCreateTime(new Date());
		return menuMapper.insert(menu);
	}
	
	@Override
	public List<Menu> list() {
		List<Menu> menus = new ArrayList<>();

		// 查询一级目录
		List<Menu> parentMenus = menuMapper.listByType(MenuTypeEnum.FIRST_MENU.getType());
		// 查询二级目录
		List<Menu> childMenus = menuMapper.listByType(MenuTypeEnum.SECOND_MENU.getType());
		// 查询操作目录
		List<Menu> handleMenus = menuMapper.listByType(MenuTypeEnum.HANDLE_MENU.getType());

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
	public Menu getByMenuId(Long menuId) {
		return menuMapper.selectById(menuId);
	}

	@Override
	public Integer updateStatus(Long menuId) {
		Menu menu = menuMapper.selectById(menuId);

		if (menu != null && StatusEnum.HIDDEN.getStatus().equals(menu.getStatus())) {
			// 显示该目录
			Menu updateMenu = new Menu();
			updateMenu.setMenuId(menuId);
			updateMenu.setStatus(StatusEnum.SHOW.getStatus());
			return menuMapper.updateById(updateMenu);
		} else if (menu != null && StatusEnum.SHOW.getStatus().equals(menu.getStatus())) {
			// 冻结该目录及其及目录
			List<Long> menuIds = new ArrayList<>();
			menuIds.add(menuId);
			getMenuIds(menuIds, menuId);
			return menuMapper.updateStatusByIds(menuIds, StatusEnum.HIDDEN.getStatus());
		}
		return null;
	}
	
	@Override
	public Integer updateMenu(Menu menu, String userName) {
		menu.setUpdateBy(userName);
		menu.setUpdateTime(new Date());
		return menuMapper.updateById(menu);
	}
	
	@Override
	public Integer deleteByMenuId(Long menuId) {
		List<Long> menuIds = new ArrayList<>();
		menuIds.add(menuId);
		getMenuIds(menuIds, menuId);
		
		// 删除角色授权表中记录
		menuMapper.deleteRoleMenus(menuIds);
		
		// 删除目录及子目录
		return menuMapper.deleteBatchIds(menuIds);
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
