package com.morning.service.impl.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		for (SystemMenu menu:systemMenus) {
			for (SystemRoleMenu roleMenu : systemRoleMenus) {
				if (menu.getMenuId().equals(roleMenu.getMenuId())) {
					menu.setChecked(true);
				}
			}
		}
		return systemMenus;
	}
}