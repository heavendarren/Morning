package com.pussinboots.morning.cms.modules.administrator.service;

import java.util.List;
import java.util.Set;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.cms.common.security.AuthorizingUser;
import com.pussinboots.morning.cms.modules.administrator.entity.RoleMenu;
import com.pussinboots.morning.cms.modules.system.vo.MenuVO;

/**
 * 
* 项目名称：morning-cms-facade   
* 类名称：IRoleMenuService   
* 类描述：RoleMenu 表业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:46:39
 */
public interface IRoleMenuService extends IService<RoleMenu> {
	
	/**
	 * 根据角色ID查找权限列表
	 * @param roleIds 角色ID
	 * @return Set<String>权限列表
	 */
	Set<String> selectMenusByRolesId(Set<String> roleIds);
	
	/**
	 * 根据管理员查找系统目录
	 * @param authorizingUser 当前管理员信息
	 * @return
	 */
	List<MenuVO> selectMenusByAdmin(AuthorizingUser authorizingUser);

	/**
	 * 根据目录状态查找系统目录
	 * @param status 目录状态
	 * @return List<MenuVo> 
	 */
	List<MenuVO> selectMenus(Integer status);
	
	/**
	 * 根据目录状态和角色ID查找目录及其是否选中
	 * @param roleId 角色ID
	 * @param status 目录状态
	 * @return List<MenuVo>
	 */
	List<MenuVO> selectCheckedMenus(Long roleId, Integer status);
}
