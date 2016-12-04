package com.morning.service.impl.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.morning.common.util.SingletonLoginUtils;
import com.morning.dao.system.SystemRoleMapper;
import com.morning.dao.system.SystemRoleMenuMapper;
import com.morning.dao.system.SystemUserRoleMapper;
import com.morning.entity.system.SystemRole;
import com.morning.entity.system.SystemRoleMenu;
import com.morning.entity.system.SystemUserRole;
import com.morning.service.system.ISystemRoleService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemRoleServiceImpl   
* 类描述：SystemRole 表业务逻辑层接口实现类   
* 创建人：陈星星   
* 创建时间：2016年11月13日 下午9:53:15   
* 修改人：陈星星   
* 修改时间：2016年11月13日 下午9:53:15   
* @version
 */
@Service
public class SystemRoleServiceImpl extends SuperServiceImpl<SystemRoleMapper, SystemRole> implements ISystemRoleService {

	@Autowired
	private SystemRoleMapper systemRoleMapper;
	@Autowired
	private SystemUserRoleMapper systemUserRoleMapper;
	@Autowired
	private SystemRoleMenuMapper systemRoleMenuMapper;
	
	
	@Override
	@Transactional
	public void insertSystemRole(SystemRole systemRole, String[] menuIds) {
		systemRole.setCreateBy(SingletonLoginUtils.getSystemUserName());
		systemRole.setCreateTime(new Date());
		systemRole.setUpdateBy(SingletonLoginUtils.getSystemUserName());
		systemRole.setUpdateTime(new Date());
		systemRoleMapper.insertSelective(systemRole);// 添加角色
		if (menuIds != null && menuIds.length > 0) {
			List<SystemRoleMenu> systemRoleMenus = new ArrayList<>();
			for (int i = 0; i < menuIds.length; i++) {
				SystemRoleMenu systemRoleMenu = new SystemRoleMenu();
				systemRoleMenu.setMenuId(Integer.valueOf(menuIds[i]));
				systemRoleMenu.setRoleId(systemRole.getRoleId());
				systemRoleMenus.add(systemRoleMenu);
			}
			systemRoleMenuMapper.insertBatch(systemRoleMenus);// 添加角色授权
		}
	}
	
	@Override
	public List<SystemRole> selectRoleList() {
		return systemRoleMapper.selectAllRole();
	}
	
	@Override
	public List<SystemRole> selectRoleAndNumber() {
		List<SystemRole> systemRoles = systemRoleMapper.selectAllRole();
		SystemUserRole systemUserRole = new SystemUserRole();
		for (int i = 0; i < systemRoles.size(); i++) {
			systemUserRole.setRoleId(systemRoles.get(i).getRoleId());
			int number = systemUserRoleMapper.selectCount(systemUserRole);
			systemRoles.get(i).setNumber(number);
		}
		return systemRoles;
	}
	
	@Override
	@Transactional
	public void updateSystemRole(SystemRole systemRole, String[] menuIds) {
		systemRole.setUpdateBy(SingletonLoginUtils.getSystemUserName());
		systemRole.setUpdateTime(new Date());
		systemRoleMapper.updateSelectiveById(systemRole);// 更新角色信息

		SystemRoleMenu menu = new SystemRoleMenu();
		menu.setRoleId(systemRole.getRoleId());
		systemRoleMenuMapper.deleteSelective(menu);// 刪除角色授权

		if (menuIds != null && menuIds.length > 0) {
			List<SystemRoleMenu> systemRoleMenus = new ArrayList<>();
			for (int i = 0; i < menuIds.length; i++) {
				SystemRoleMenu systemRoleMenu = new SystemRoleMenu();
				systemRoleMenu.setMenuId(Integer.valueOf(menuIds[i]));
				systemRoleMenu.setRoleId(systemRole.getRoleId());
				systemRoleMenus.add(systemRoleMenu);
			}
			systemRoleMenuMapper.insertBatch(systemRoleMenus);// 添加角色授权
		}
	}

	@Override
	@Transactional
	public void deleteSysRole(Integer roleId) {
		systemRoleMapper.deleteById(roleId);//删除角色表角色
		SystemUserRole systemUserRole = new SystemUserRole();
		systemUserRole.setRoleId(roleId);
		systemUserRoleMapper.deleteSelective(systemUserRole);//删除用户角色表记录
		SystemRoleMenu systemRoleMenu = new SystemRoleMenu();
		systemRoleMenu.setRoleId(roleId);
		systemRoleMenuMapper.deleteSelective(systemRoleMenu);//删除角色权限表记录
	}
}