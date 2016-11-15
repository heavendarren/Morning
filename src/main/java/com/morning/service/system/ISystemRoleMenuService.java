package com.morning.service.system;

import java.util.List;

import com.baomidou.framework.service.ISuperService;
import com.morning.entity.system.SystemRoleMenu;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：ISystemRoleMenuService   
* 类描述：SystemRoleMenu 表业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年11月13日 下午10:42:41   
* 修改人：陈星星   
* 修改时间：2016年11月13日 下午10:42:41   
* @version
 */
public interface ISystemRoleMenuService extends ISuperService<SystemRoleMenu> {
	
	/**
	 * 通过角色ID查找权限列表
	 * @param roleIdList 角色ID列表
	 * @return List<SystemRoleMenu> 
	 */
	List<SystemRoleMenu> selectMenuListByRoleId(List<Integer> roleIdList);

}