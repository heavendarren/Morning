package org.pussinboots.morning.administrator.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.pussinboots.morning.administrator.entity.Role;
import org.pussinboots.morning.administrator.entity.RoleMenu;
import org.pussinboots.morning.administrator.entity.UserRole;
import org.pussinboots.morning.administrator.mapper.RoleMapper;
import org.pussinboots.morning.administrator.mapper.RoleMenuMapper;
import org.pussinboots.morning.administrator.mapper.UserRoleMapper;
import org.pussinboots.morning.administrator.service.IRoleService;
import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-administrator-service   
* 类名称：RoleServiceImpl   
* 类描述：Role / 角色表 业务逻辑层接口实现            
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午6:05:12   
*
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
	public Integer insertRole(Role role, String[] menuIds, String userName) {

		// 创建角色
		role.setCreateBy(userName);
		role.setCreateTime(new Date());
		role.setUpdateBy(userName);
		role.setUpdateTime(new Date());
		Integer count = roleMapper.insert(role);

		// 遍历循环,插入角色目录表记录
		if (menuIds != null && menuIds.length > 0) {
			List<RoleMenu> roleMenus = new ArrayList<>();
			for (int i = 0; i < menuIds.length; i++) {
				RoleMenu roleMenu = new RoleMenu();
				roleMenu.setMenuId(Long.valueOf(menuIds[i]));
				roleMenu.setRoleId(role.getRoleId());
				roleMenu.setCreateBy(userName);
				roleMenu.setCreateTime(new Date());
				roleMenus.add(roleMenu);
			}
			roleMenuMapper.insertRoleMenus(roleMenus);
		}

		return count;
	}
	
	@Override
	public List<Role> listBySataus(Integer status) {
		Role role = new Role();
		role.setStatus(status);
		return roleMapper.selectList(new EntityWrapper<Role>(role));
	}

	@Override
	public BasePageDTO<Role> listByPage(PageInfo pageInfo, String search) {
		Page<Role> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());
		List<Role> roles = roleMapper.listByPage(pageInfo, search, page);
		pageInfo.setTotal(page.getTotal());
		return new BasePageDTO<Role>(pageInfo, roles);
	}

	@Override
	public Integer updateStatus(Long roleId) {
		Role role = roleMapper.selectById(roleId);

		if (role != null && StatusEnum.NORMAL.getStatus().equals(role.getStatus())) {
			Role updateRole = new Role();
			updateRole.setRoleId(roleId);
			updateRole.setStatus(StatusEnum.FREEZE.getStatus());
			return roleMapper.updateById(updateRole);
		} else if (role != null && StatusEnum.FREEZE.getStatus().equals(role.getStatus())) {
			Role updateRole = new Role();
			updateRole.setRoleId(roleId);
			updateRole.setStatus(StatusEnum.NORMAL.getStatus());
			return roleMapper.updateById(updateRole);
		}
		return null;
	}
	
	@Override
	public Integer updateRole(Role role, String[] menuIds, String userName) {
		//更新用户信息
		role.setUpdateBy(userName);
		role.setUpdateTime(new Date());
		Integer count = roleMapper.updateById(role);
		
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
				roleMenu.setCreateBy(userName);
				roleMenu.setCreateTime(new Date());
				roleMenus.add(roleMenu);
			}
			roleMenuMapper.insertRoleMenus(roleMenus);
		}
		return count;
	}

	@Override
	public Integer deleteByRoleId(Long roleId) {
		// 删除管理员角色表中记录
		UserRole userRole = new UserRole();
		userRole.setRoleId(roleId);
		userRoleMapper.delete(new EntityWrapper<UserRole>(userRole));

		// 删除角色目录表中记录
		RoleMenu roleMenu = new RoleMenu();
		roleMenu.setRoleId(roleId);
		roleMenuMapper.delete(new EntityWrapper<RoleMenu>(roleMenu));

		// 删除角色表角色
		return roleMapper.deleteById(roleId);
	}
}
