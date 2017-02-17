package com.pussinboots.morning.cms.modules.administrator.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.cms.modules.administrator.entity.Role;
import com.pussinboots.morning.cms.modules.administrator.entity.User;
import com.pussinboots.morning.cms.modules.administrator.entity.UserRole;

/**
 * 
* 项目名称：morning-cms-facade   
* 类名称：IUserRoleService   
* 类描述：UserRole 表业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:47:28
 */
public interface IUserRoleService extends IService<UserRole> {
	
	/**
	 * 通过账号ID查找角色列表
	 * @param userId 管理员ID
	 * @return roleSigns:角色标识/roleIds:角色ID
	 */
	Map<String, Set<String>> selectRolesByUserId(Long userId);
	
	/**
	 * 根据管理员ID和角色状态查找角色列表
	 * @param userId 管理员ID
	 * @param status 角色状态
	 * @return
	 */
	List<Role> selectRolesByUserId(Long userId, Integer status);
	
	/**
	 * 根据角色ID查找用户列表
	 * @param roleId 角色ID
	 * @return
	 */
	List<User> selectUsersByRoleId(Long roleId);
}
