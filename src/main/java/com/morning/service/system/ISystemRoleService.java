package com.morning.service.system;

import java.util.List;

import com.baomidou.framework.service.ISuperService;
import com.morning.entity.system.SystemRole;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：ISystemRoleService   
* 类描述：SystemRole 表业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年11月13日 下午9:52:50   
* 修改人：陈星星   
* 修改时间：2016年11月13日 下午9:52:50   
* @version
 */
public interface ISystemRoleService extends ISuperService<SystemRole> {
	
	/**
	 * 创建新的角色
	 * @param systemRole 角色
	 * @param menuIds 用户授权ID
	 */
	void insertSystemRole(SystemRole systemRole, String[] menuIds);
	
	/**
	 * 查询角色列表
	 * @return List<SystemRole>
	 */
	List<SystemRole> selectRoleList();
	
	/**
	 * 查询角色列表及数量
	 * @return List<SystemRole>
	 */
	List<SystemRole> selectRoleAndNumber();
	
	/**
	 * 更新角色，同时更新角色授权
	 * @param systemRole 角色
	 * @param menuIds 角色授权ID
	 */
	void updateSystemRole(SystemRole systemRole, String[] menuIds);
	
	/**
	 * 更新角色状态
	 * @param roleId
	 * @param status
	 */
	void updateRoleStatus(Integer roleId, Integer status);
	
	/**
	 * 根据角色ID删除角色，同时删除角色记录
	 * @param roleId 角色ID
	 */
	void deleteSysRole(Integer roleId);


}