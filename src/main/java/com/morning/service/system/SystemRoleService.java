package com.morning.service.system;

import java.util.List;

import com.morning.entity.system.SystemRole;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：SystemRoleService   
* 类描述： 系统角色业务层接口  
* 创建人：陈星星   
* 创建时间：2016年10月25日 上午3:29:00   
* 修改人：陈星星   
* 修改时间：2016年10月25日 上午3:29:00   
* 修改备注：   
* @version    
*
 */
public interface SystemRoleService {
	
	/**
	 * 通过管理员ID，查询角色信息
	 * @param accountId 账户ID
	 * @return
	 */
	public List<SystemRole> queryRoleByUserId(Integer accountId);
	
	/**
	 * 查询角色列表
	 * @return List<SystemRole> 管理员列表
	 */
	public List<SystemRole> queryRoleList();
	
	/**
	 * 查询角色人数
	 * @param roleId  角色编号
	 * @return	int 数量
	 */
	public int queryRoleNumber(Integer roleId);
	
	/**
	 * 查询角色列表，包括角色人数
	 * @return
	 */
	public List<SystemRole> queryRoles();
}
