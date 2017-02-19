package com.pussinboots.morning.cms.modules.administrator.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.pussinboots.morning.cms.modules.administrator.entity.Role;
import com.pussinboots.morning.cms.modules.administrator.entity.User;
import com.pussinboots.morning.cms.modules.administrator.entity.UserRole;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：UserRoleMapper   
* 类描述：UserRole 表数据访问层接口       
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:44:01
 */
public interface UserRoleMapper extends BaseMapper<UserRole> {
	
	/**
	 * 插入用户角色记录 
	 * @param userRoles
	 */
	void insertUserRoles(@Param("userRoles") List<UserRole> userRoles);
	
	/**
	 * 根据管理员ID查找角色ID列表
	 * @param userId
	 * @return List<Long>
	 */
	List<Long> selectRoleIdsByUserId(@Param("userId") Long userId);
	
	/**
	 * 根据管理员ID和角色状态查找角色列表
	 * @param userId
	 * @param status
	 * @return
	 */
	List<Role> selectRolesByUserId(@Param("userId") Long userId, @Param("status") Integer status);
	
	/**
	 * 根据角色ID查找用户列表
	 * @param roleId 角色ID
	 * @return
	 */
	List<User> selectUsersByRoleId(@Param("roleId") Long roleId);
}