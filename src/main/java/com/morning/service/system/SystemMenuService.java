package com.morning.service.system;

import java.util.List;

import com.morning.entity.system.SystemMenu;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：SystemMenuService   
* 类描述：系统权限业务层接口   
* 创建人：陈星星   
* 创建时间：2016年10月23日 下午9:51:26   
* 修改人：陈星星   
* 修改时间：2016年10月23日 下午9:51:26   
* 修改备注：   
* @version    
*
 */
public interface SystemMenuService {
	
	/**
	 * 查询系统目录
	 * @param parameter
	 * @return
	 */
	public List<SystemMenu> querySysMenu(Integer status, String menuType);
	
	/**
	 * 通过角色ID，查询权限目录
	 * @param roleId 角色编号
	 * @return List<SystemMenu>
	 */
	public List<SystemMenu> querySysMenuByRoleId(Integer roleId);
	
	/**
	 * 处理后台目录
	 * @param systemMenuList 网站目录列表
	 * @return
	 */
	public List<SystemMenu> handleMenu(List<SystemMenu> systemMenuList);

}
