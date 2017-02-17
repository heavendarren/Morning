package com.pussinboots.morning.cms.modules.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.pussinboots.morning.cms.modules.system.entity.Menu;
import com.pussinboots.morning.cms.modules.system.vo.MenuVO;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：MenuMapper   
* 类描述：Menu 表数据访问层接口   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:42:04
 */
public interface MenuMapper extends BaseMapper<Menu> {
	
	/**
	 * 根据目录 等级查询目录列表
	 * @param menuType
	 * @return List<Menu> 
	 */
	List<Menu> selectMenus(@Param("menuType") Integer menuType);
	
	/**
	 * 根据目录状态查找目录列表
	 * @param status目录状态
	 * @return List<MenuVO>
	 */
	List<MenuVO> selectMenusByStatus(@Param("status") Integer status);
	
	/**
	 * 更新目录状态，冻结目录及其及目录
	 * @param menuIds 目录ID列表
	 * @param status 目录状态
	 */
	void updateStatusByIds(@Param("menuIds") List<Long> menuIds, @Param("status") Integer status);
}