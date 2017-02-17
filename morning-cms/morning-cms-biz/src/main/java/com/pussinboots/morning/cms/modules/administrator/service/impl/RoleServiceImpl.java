package com.pussinboots.morning.cms.modules.administrator.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.cms.common.security.AuthorizingUser;
import com.pussinboots.morning.cms.modules.administrator.entity.Role;
import com.pussinboots.morning.cms.modules.administrator.entity.RoleMenu;
import com.pussinboots.morning.cms.modules.administrator.entity.UserRole;
import com.pussinboots.morning.cms.modules.administrator.mapper.RoleMapper;
import com.pussinboots.morning.cms.modules.administrator.mapper.RoleMenuMapper;
import com.pussinboots.morning.cms.modules.administrator.mapper.UserRoleMapper;
import com.pussinboots.morning.cms.modules.administrator.service.IRoleService;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：RoleServiceImpl   
* 类描述：Role 表业务逻辑层接口实现类      
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:49:25
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {
	
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private RoleMenuMapper roleMenuMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	@Override
	public void insertRole(Role role, String[] menuIds, AuthorizingUser authorizingUser) {
		
		// 创建角色
		role.setCreateBy(authorizingUser.getUserName());
		role.setCreateTime(new Date());
		role.setUpdateBy(authorizingUser.getUserName());
		role.setUpdateTime(new Date());
		roleMapper.insert(role);
		
		//遍历循环,插入角色目录表记录
		if (menuIds != null && menuIds.length > 0) {
			List<RoleMenu> roleMenus = new ArrayList<>();
			for (int i = 0; i < menuIds.length; i++) {
				RoleMenu roleMenu = new RoleMenu();
				roleMenu.setMenuId(Long.valueOf(menuIds[i]));
				roleMenu.setRoleId(role.getRoleId());
				roleMenu.setCreateBy(authorizingUser.getUserName());
				roleMenu.setCreateTime(new Date());
				roleMenus.add(roleMenu);
			}
			roleMenuMapper.insertRoleMenus(roleMenus);
		}
		
	}

	@Override
	public List<Role> selectRoles(Integer status) {
		Role role = new Role();
		role.setStatus(status);
		return roleMapper.selectList(new EntityWrapper<Role>(role));
	}

	@Override
	public List<Role> selectRoles() {
		return roleMapper.selectList(new EntityWrapper<Role>());
	}

	@Override
	public void updateRoleStatus(Long roleId, Integer status) {
		Role role = new Role();
		role.setStatus(status);
		role.setRoleId(roleId);
		roleMapper.updateById(role);
	}
	
	@Override
	@Transactional
	public void updateRole(Role role, String[] menuIds, AuthorizingUser authorizingUser) {
		//更新用户信息
		role.setUpdateBy(authorizingUser.getUserName());
		role.setUpdateTime(new Date());
		roleMapper.updateById(role);
		
		//先删除该用户授权信息
		RoleMenu queryRoleMenu = new RoleMenu();
		queryRoleMenu.setRoleId(role.getRoleId());
		roleMenuMapper.delete(new EntityWrapper<RoleMenu>(queryRoleMenu));

		//遍历循环,插入角色目录表记录
		if (menuIds != null && menuIds.length > 0) {
			List<RoleMenu> roleMenus = new ArrayList<>();
			for (int i = 0; i < menuIds.length; i++) {
				RoleMenu roleMenu = new RoleMenu();
				roleMenu.setMenuId(Long.valueOf(menuIds[i]));
				roleMenu.setRoleId(role.getRoleId());
				roleMenu.setCreateBy(authorizingUser.getUserName());
				roleMenu.setCreateTime(new Date());
				roleMenus.add(roleMenu);
			}
			roleMenuMapper.insertRoleMenus(roleMenus);
		}
	}

	@Override
	@Transactional
	public void deleteRole(Long roleId) {
		//删除角色表角色
		roleMapper.deleteById(roleId);
		
		//删除管理员角色表中记录
		UserRole userRole = new UserRole();
		userRole.setRoleId(roleId);
		userRoleMapper.delete(new EntityWrapper<UserRole>(userRole));

		//删除角色目录表中记录
		RoleMenu roleMenu = new RoleMenu();
		roleMenu.setRoleId(roleId);
		roleMenuMapper.delete(new EntityWrapper<RoleMenu>(roleMenu));
	}
}
