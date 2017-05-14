package org.pussinboots.morning.system.service;

import java.util.List;

import org.pussinboots.morning.system.entity.Menu;
import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-system-facade   
* 类名称：IMenuService   
* 类描述：Menu / 目录表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年4月7日 下午2:14:25   
*
 */
public interface IMenuService extends IService<Menu> {
	
	/**
	 * 创建菜单
	 * @param menu 菜单信息
	 * @param userName 操作人
	 * @return
	 */
	Integer insertMenu(Menu menu, String userName);
	
	/**
	 * 获取系统目录列表
	 * @return
	 */
	List<Menu> list();
	
	/**
	 * 根据ID查找目录
	 * @param menuId
	 * @return
	 */
	Menu getByMenuId(Long menuId);
	
	/**
	 * 更新目录状态
	 * @param menuId 目录ID
	 * @return
	 */
	Integer updateStatus(Long menuId);
	
	
	/**
	 * 更新目录信息
	 * @param menu 目录信息
	 * @param userName 操作人
	 * @return
	 */
	Integer updateMenu(Menu menu, String userName);
	
	/**
	 * 根据目录ID删除目录及其及目录
	 * @param menuId
	 * @return
	 */
	Integer deleteByMenuId(Long menuId);
}
