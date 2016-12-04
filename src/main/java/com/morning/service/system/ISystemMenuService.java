package com.morning.service.system;

import java.util.List;

import com.baomidou.framework.service.ISuperService;
import com.morning.entity.system.SystemMenu;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：ISystemMenuService   
* 类描述：SystemMenu 表业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年11月13日 下午10:42:22   
* 修改人：陈星星   
* 修改时间：2016年11月13日 下午10:42:22   
* @version
 */
public interface ISystemMenuService extends ISuperService<SystemMenu> {

	/**
	 * 查询系统目录,网站目录列表
	 * @return List<SystemMenu>
	 */
	List<SystemMenu> selectSystemMenu();
	
	/**
	 * 查询角色授权表
	 * @return List<SystemMenu>
	 */
	List<SystemMenu> selectMenus();
	
	/**
	 * 查询选中角色授权表
	 * @param roleId 角色ID
	 * @return
	 */
	List<SystemMenu> selectCheckedMenus(Integer roleId);
}