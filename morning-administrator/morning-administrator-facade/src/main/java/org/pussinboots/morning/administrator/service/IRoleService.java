package org.pussinboots.morning.administrator.service;

import java.util.List;

import org.pussinboots.morning.administrator.entity.Role;
import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-administrator-facade   
* 类名称：IRoleService   
* 类描述：Role / 角色表 业务逻辑层接口            
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午5:47:46   
*
 */
public interface IRoleService extends IService<Role> {
	
	/**
	 * 创建角色信息及角色权限
	 * @param role 角色信息
	 * @param menuIds 用户授权ID
	 * @param userName 操作人
	 * @return
	 */
	Integer insertRole(Role role, String[] menuIds, String userName);
	
	/**
	 * 根据角色状态查找角色列表
	 * @param status 角色状态
	 * @return List<Role> 
	 */
	List<Role> listBySataus(Integer status);
	
	/**
	 * 根据分页信息/搜索内容查找角色列表
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @return
	 */
	BasePageDTO<Role> listByPage(PageInfo pageInfo, String search);
	
	/**
	 * 更新角色状态
	 * @param roleId 角色ID
	 * @return
	 */
	Integer updateStatus(Long roleId);
	
	/**
	 * 更新角色信息以及角色权限
	 * @param role 角色信息
	 * @param menuIds 用户授权ID
	 * @param userName 操作人
	 * @return
	 */
	Integer updateRole(Role role, String[] menuIds, String userName);
	
	/**
	 * 根据角色ID删除角色,同时删除角色记录
	 * @param roleId
	 * @return
	 */
	Integer deleteByRoleId(Long roleId);
}
