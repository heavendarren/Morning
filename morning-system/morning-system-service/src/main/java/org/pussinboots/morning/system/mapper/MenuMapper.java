package org.pussinboots.morning.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.pussinboots.morning.system.entity.Menu;
import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-system-service   
* 类名称：MenuMapper   
* 类描述：Menu / 目录表 数据访问接口   
* 创建人：陈星星   
* 创建时间：2017年4月7日 下午2:13:28   
*
 */
public interface MenuMapper extends BaseMapper<Menu> {
	
	/**
	 * 根据目录类型查询目录列表
	 * @param type 目录类型
	 * @return
	 */
	List<Menu> listByType(@Param("menuType") Integer menuType);
	
	/**
	 * 更新目录状态,冻结目录及其及目录
	 * @param menuIds 目录ID列表
	 * @param status 目录状态
	 * @return
	 */
	Integer updateStatusByIds(@Param("menuIds") List<Long> menuIds, @Param("status") Integer status);
	
	/**
	 * 通过目录ID删除角色授权记录
	 * @param menuIds 目录ID列表
	 * @return
	 */
	Integer deleteRoleMenus(@Param("menuIds") List<Long> menuIds);
}