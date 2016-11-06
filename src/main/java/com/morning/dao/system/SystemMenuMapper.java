package com.morning.dao.system;

import java.util.List;
import java.util.Map;

import com.morning.entity.system.SystemMenu;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemMenuMapper   
* 类描述：系统权限数据访问层接口
* 创建人：陈星星   
* 创建时间：2016年10月23日 下午9:17:37   
* 修改人：陈星星   
* 修改时间：2016年10月23日 下午9:17:37   
* 修改备注：   
* @version    
*
 */
public interface SystemMenuMapper {
	
	/**
	 * 查询系统目录
	 * @param parameter 
	 * @return List<SystemMenu>
	 */
	public List<SystemMenu> querySysMenu(Map<String,Object> parameter);
	
	/**
	 * 通过角色ID，查询权限目录
	 * @param roleId 角色编号
	 * @return List<SystemMenu>
	 */
	public List<SystemMenu> querySysMenuByRoleId(Integer roleId);
	
}