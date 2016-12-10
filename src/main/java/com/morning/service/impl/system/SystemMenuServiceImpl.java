package com.morning.service.impl.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.common.util.SingletonLoginUtils;
import com.morning.dao.system.SystemMenuMapper;
import com.morning.dao.system.SystemRoleMenuMapper;
import com.morning.entity.system.SystemMenu;
import com.morning.entity.system.SystemRoleMenu;
import com.morning.service.system.ISystemMenuService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemMenuServiceImpl   
* 类描述：SystemMenu 表业务逻辑层接口实现类   
* 创建人：陈星星   
* 创建时间：2016年11月13日 下午10:43:39   
* 修改人：陈星星   
* 修改时间：2016年11月13日 下午10:43:39   
* @version
 */
@Service
public class SystemMenuServiceImpl extends SuperServiceImpl<SystemMenuMapper, SystemMenu> implements ISystemMenuService {
	
	@Autowired
	private SystemMenuMapper systemMenuMaper;
	@Autowired
	private SystemRoleMenuMapper systemRoleMenuMapper;
	
	@Override
	public void insertMenu(SystemMenu systemMenu) {
		systemMenu.setCreateTime(new Date());
		systemMenu.setCreateBy(SingletonLoginUtils.getSystemUserName());
		systemMenu.setUpdateTime(new Date());
		systemMenu.setUpdateBy(SingletonLoginUtils.getSystemUserName());
		systemMenuMaper.insert(systemMenu);
	}
	
	@Override
	public List<SystemMenu> selectSystemMenu() {
		List<SystemMenu> systemMenus = new ArrayList<>();
		// 查询一级目录
		List<SystemMenu> parentMenuList = systemMenuMaper.selectSystemMenu(1, 1);
		// 查询二级目录
		List<SystemMenu> childMenuList = systemMenuMaper.selectSystemMenu(1, 2);

		// 获取根级权限的子级权限
		for (SystemMenu parentMenu : parentMenuList) {
			recursionMenu(systemMenus, childMenuList, parentMenu);
		}
		return systemMenus;
	}
	
	/**
	 * 递归得到每个权限的子级权限
	 * @param systemMenus 处理后的目录列表
	 * @param childMenuList  二级目录列表
	 * @param parentMenu 当前一级目录
	 */
	private void recursionMenu(List<SystemMenu> systemMenus, List<SystemMenu> childMenuList, SystemMenu parentMenu){
		List<SystemMenu> childMenus = new ArrayList<>();
		for(SystemMenu menu : childMenuList){
			if(parentMenu.getMenuId() == menu.getParentId()){
				childMenus.add(menu);
			}
		}
		parentMenu.setChildMenuList(childMenus);
		systemMenus.add(parentMenu);
	}

	@Override
	public List<SystemMenu> selectMenus() {
		return systemMenuMaper.selectSystemMenus();
	}

	@Override
	public List<SystemMenu> selectCheckedMenus(Integer roleId) {
		Map<String, Object> columnMap = new HashMap<>();
		columnMap.put("ROLE_ID", roleId);
		List<SystemRoleMenu> systemRoleMenus = systemRoleMenuMapper.selectByMap(columnMap);// 角色拥有的菜单
		List<SystemMenu> systemMenus = systemMenuMaper.selectSystemMenus();
		for (SystemMenu menu : systemMenus) {
			for (SystemRoleMenu roleMenu : systemRoleMenus) {
				if (menu.getMenuId().equals(roleMenu.getMenuId())) {
					menu.setChecked(true);
				}
			}
		}
		return systemMenus;
	}

	@Override
	public List<SystemMenu> selectMenuList() {
		List<SystemMenu> systemMenus = new ArrayList<>();
		List<SystemMenu> parentMenuList = systemMenuMaper.selectMenus(1);// 查询一级目录
		List<SystemMenu> childMenuList = systemMenuMaper.selectMenus(2);// 查询二级目录
		List<SystemMenu> handleMenuList = systemMenuMaper.selectMenus(0);// 查询操作目录
		
		for (SystemMenu parentMenu : parentMenuList) {// 遍历一级目录
			systemMenus.add(parentMenu);
			for (SystemMenu childMenu : childMenuList) {// 遍历二级目录
				if (parentMenu.getMenuId() == childMenu.getParentId()) {
					systemMenus.add(childMenu);
					for (SystemMenu handleMenu : handleMenuList) {// 遍历操作目录
						if (childMenu.getMenuId() == handleMenu.getParentId()) {
							systemMenus.add(handleMenu);
						}
					}
				}
			}
		}
		return systemMenus;
	}

	@Override
	public void updateMenuStatus(Integer menuId, Integer status) {
		SystemMenu systemMenu = new SystemMenu();
		systemMenu.setMenuId(menuId);
		systemMenu.setStatus(status);
		systemMenu.setUpdateTime(new Date());
		systemMenu.setUpdateBy(SingletonLoginUtils.getSystemUserName());
		systemMenuMaper.updateSelectiveById(systemMenu);
	}

	@Override
	public void updateMenu(SystemMenu systemMenu) {
		systemMenu.setUpdateTime(new Date());
		systemMenu.setUpdateBy(SingletonLoginUtils.getSystemUserName());
		systemMenuMaper.updateSelectiveById(systemMenu);
	}
	
	@Override
	public void deleteMenu(Integer menuId) {
		List<Integer> menuIds = new ArrayList<>();
		menuIds.add(menuId);
		getMenuIds(menuIds,menuId);
		systemMenuMaper.deleteBatchIds(menuIds);//删除目录及子目录
		systemRoleMenuMapper.deleteMenuList(menuIds);//删除角色授权表中记录
		
	}
	
	/**
	 * 根据目录ID查找要删除的目录ID的子目录
	 * @param menuId 目录ID
	 * @return List<Integer>
	 */
	private List<Integer> getMenuIds(List<Integer> menuIds, Integer menuId) {
		Map<String, Object> columnMap = new HashMap<>();
		columnMap.put("PARENT_ID", menuId);
		List<SystemMenu> menus = systemMenuMaper.selectByMap(columnMap);
		if (menus != null) {
			for (SystemMenu menu : menus) {
				menuIds.add(menu.getMenuId());
				if (menu.getMenuType() == 0) {
					continue;
				}
				getMenuIds(menuIds, menu.getMenuId());

			}
		}
		return menuIds;
	}
}