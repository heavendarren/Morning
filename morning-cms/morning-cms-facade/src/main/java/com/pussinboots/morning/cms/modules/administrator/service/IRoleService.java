package com.pussinboots.morning.cms.modules.administrator.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.cms.common.security.AuthorizingUser;
import com.pussinboots.morning.cms.modules.administrator.entity.Role;

/**
 * 
* 项目名称：morning-cms-facade   
* 类名称：IRoleService   
* 类描述：Role 表业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:46:53
 */
public interface IRoleService extends IService<Role> {
	
	/**
	 * 创建角色
	 * @param role 角色信息
	 * @param menuIds 用户授权ID
	 * @param authorizingUser 当前管理员信息
	 */
	void insertRole(Role role, String[] menuIds, AuthorizingUser authorizingUser);
	
	/**
	 * 查找所有角色
	 * @return List<Role>
	 */
	List<Role> selectRoles();
	
	/**
	 * 根据角色状态查找角色列表
	 * @param status 角色状态
	 * @return
	 */
	List<Role> selectRoles(Integer status);
	
	/**
	 * 更新角色状态
	 * @param userId 角色ID
	 * @param status 角色状态
	 */
	void updateRoleStatus(Long roleId, Integer status);
	
	/**
	 * 更新角色
	 * @param role 角色信息
	 * @param menuIds  用户授权ID
	 * @param authorizingUser 当前管理员信息	 
	 */
	void updateRole(Role role, String[] menuIds, AuthorizingUser authorizingUser);
	
	/**
	 * 根据角色ID删除角色，同时删除角色记录
	 * @param roleId 角色ID
	 */
	void deleteRole(Long roleId);
}
