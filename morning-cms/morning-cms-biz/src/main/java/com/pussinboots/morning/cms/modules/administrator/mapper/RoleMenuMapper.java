package com.pussinboots.morning.cms.modules.administrator.mapper;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.pussinboots.morning.cms.modules.administrator.dto.RoleMenuDTO;
import com.pussinboots.morning.cms.modules.administrator.entity.RoleMenu;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：RoleMenuMapper   
* 类描述：RoleMenu 表数据访问层接口    
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:43:00
 */
public interface RoleMenuMapper extends BaseMapper<RoleMenu> {
	
	/**
	 * 插入角色目录表记录
	 * @param roleMenus 角色目录表记录列表
	 */
	void insertRoleMenus(@Param("roleMenus") List<RoleMenu> roleMenus);
	
	/**
	 * 通过角色ID/目录状态/目录等级查找目录列表
	 * @param roleIds 角色ID
	 * @param status 目录状态
	 * @param menuType 目录等级
	 * @return List<RoleMenuDTO>
	 */
	List<RoleMenuDTO> selectMenusByRolesIdAndStatus(
			@Param("roleIds") List<Long> roleIds,
			@Param("status") Integer status, @Param("menuType") Integer menuType);
	
	/**
	 * 通过角色ID查找权限列表
	 * @param roleIds 角色ID
	 * @return Set<RoleMenuDTO>
	 */
	Set<RoleMenuDTO> selectMenusByRolesId(@Param("roleIds") Set<String> roleIds);
	
	/**
	 * 根据目录状态查找目录列表
	 * @param status目录状态
	 * @return List<RoleMenuDTO>
	 */
	List<RoleMenuDTO> selectRoleMenusByStatus(@Param("status") Integer status);
}