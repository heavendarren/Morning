package org.pussinboots.morning.administrator.service;

import java.util.List;

import org.pussinboots.morning.administrator.entity.Role;
import org.pussinboots.morning.administrator.entity.UserRole;
import org.pussinboots.morning.administrator.pojo.dto.UserPageDTO;
import org.pussinboots.morning.administrator.pojo.dto.UserRoleDTO;
import org.pussinboots.morning.common.support.page.PageInfo;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-administrator-facade   
* 类名称：IUserRoleService   
* 类描述：UserRole / 管理员角色关联表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年4月1日 下午5:50:07   
*
 */
public interface IUserRoleService extends IService<UserRole> {
	
	/**
	 * 根据管理员ID查找角色列表 
	 * @param userId 管理员ID
	 * @param status 角色状态
	 * @return
	 */
	UserRoleDTO getByUserId(Long userId, Integer status);
	
	/**
	 * 根据管理员ID查找角色列表
	 * @param userId 管理员ID
	 * @param status 角色状态
	 * @return
	 */
	List<Role> listByUserId(Long userId, Integer status);
	
	/**
	 * 根据角色ID查找管理员列表
	 * @param roleId 角色ID
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @return
	 */
	UserPageDTO listByRoleId(Long roleId, PageInfo pageInfo, String search);
	
}
