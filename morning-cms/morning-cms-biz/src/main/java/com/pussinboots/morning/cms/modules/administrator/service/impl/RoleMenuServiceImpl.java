package com.pussinboots.morning.cms.modules.administrator.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.cms.common.security.AuthorizingUser;
import com.pussinboots.morning.cms.modules.administrator.entity.RoleMenu;
import com.pussinboots.morning.cms.modules.administrator.mapper.RoleMenuMapper;
import com.pussinboots.morning.cms.modules.administrator.mapper.UserRoleMapper;
import com.pussinboots.morning.cms.modules.administrator.service.IRoleMenuService;
import com.pussinboots.morning.cms.modules.system.entity.Menu;
import com.pussinboots.morning.cms.modules.system.enums.MenuStatusEnum;
import com.pussinboots.morning.cms.modules.system.enums.MenuTypeEnum;
import com.pussinboots.morning.cms.modules.system.mapper.MenuMapper;
import com.pussinboots.morning.cms.modules.system.vo.MenuVO;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：RoleMenuServiceImpl   
* 类描述：RoleMenu 表业务逻辑层接口实现类     
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:49:11
 */
@Service
public class RoleMenuServiceImpl extends ServiceImpl<RoleMenuMapper, RoleMenu> implements IRoleMenuService {
	
	@Autowired
	private RoleMenuMapper roleMenuMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;
	@Autowired
	private MenuMapper menuMapper;
	
	@Override
	public Set<String> selectMenusByRolesId(Set<String> roleIds) {
		Set<String> roleMenus = new HashSet<>();
		
		Set<Menu> menus = roleMenuMapper.selectMenusByRolesId(roleIds);
		
		for(Menu menu : menus){
			if(StringUtils.isNotBlank(menu.getPermission())){
				// 添加基于Permission的权限信息
				roleMenus.add(menu.getPermission());
			}
		}
		return roleMenus;
	}

	@Override
	public List<MenuVO> selectMenusByAdmin(AuthorizingUser authorizingUser) {
		
		List<MenuVO> menus = new ArrayList<>();
		
		List<Long> roleIds = userRoleMapper.selectRoleIdsByUserId(authorizingUser.getUserId());
		
		// 查询一级目录
		List<Menu> parentMenus = roleMenuMapper.selectMenusByRolesIdAndStatus(roleIds, MenuStatusEnum.SHOW.getStatus(),MenuTypeEnum.FIRST_MENU.getType());
		// 查询一级目录
		List<Menu> childMenus = roleMenuMapper.selectMenusByRolesIdAndStatus(roleIds, MenuStatusEnum.SHOW.getStatus(),MenuTypeEnum.SECOND_MENU.getType());
		// 获取根级权限的子级权限
		for (Menu parentMenu : parentMenus) {
			recursionMenu(menus, childMenus, parentMenu);
		}
		
		return menus;
	}
	
	@Override
	public List<MenuVO> selectMenus(Integer status) {
		return menuMapper.selectMenusByStatus(status);
	}

	@Override
	public List<MenuVO> selectCheckedMenus(Long roleId, Integer status) {
		// 查询所有目录根据状态
		List<MenuVO> menus = menuMapper.selectMenusByStatus(status);
		// 查找该角色拥有的权限
		RoleMenu queryRoleMenu = new RoleMenu();
		queryRoleMenu.setRoleId(roleId);
		List<RoleMenu> roleMenus = roleMenuMapper.selectList(new EntityWrapper<RoleMenu>(queryRoleMenu));
		//遍历目录，设置该角色是否选中该目录
		for (MenuVO menu : menus) {
			for (RoleMenu roleMenu : roleMenus) {
				if (menu.getMenuId().equals(roleMenu.getMenuId())) {
					menu.setChecked(true);
				}
			}
		}
		return menus;
	}
	
	/**
	 * 递归得到每个权限的子级权限
	 * @param menus 处理后的目录列表
	 * @param childMenus  二级目录列表
	 * @param parentMenu 当前一级目录
	 */
	private void recursionMenu(List<MenuVO> menus, List<Menu> childMenus, Menu parentMenu){
		List<Menu> childMenuList = new ArrayList<>();
		for(Menu menu : childMenus){
			if(parentMenu.getMenuId() == menu.getParentId()){
				childMenuList.add(menu);
			}
		}
		MenuVO parentMenuVo = new MenuVO();
		BeanUtils.copyProperties(parentMenu, parentMenuVo);
		parentMenuVo.setChildMenus(childMenuList);
		menus.add(parentMenuVo);
	}
}
