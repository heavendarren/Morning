package org.pussinboots.morning.administrator.mapper;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.pussinboots.morning.administrator.entity.RoleMenu;
import org.pussinboots.morning.administrator.pojo.dto.RoleMenuDTO;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-administrator-service   
* 类名称：RoleMenuMapper   
* 类描述：RoleMenu / 角色目录关联表 数据访问层接口         
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午5:44:17   
*
 */
public interface RoleMenuMapper extends BaseMapper<RoleMenu> {
	
	/**
	 * 插入角色目录表记录
	 * @param roleMenus 角色目录表记录列表
	 */
	Integer insertRoleMenus(@Param("roleMenus") List<RoleMenu> roleMenus);
	
	/**
	 * 根据角色ID列表查找权限列表
	 * @param roleIds 角色ID列表
	 * @param status 权限状态
	 * @return
	 */
	Set<RoleMenuDTO> listByRoleIds(@Param("roleIds") Set<String> roleIds, @Param("status") Integer status);
	
	/**
	 * 根据角色ID/目录类型查找权限列表
	 * @param roleIds  角色ID列表
	 * @param status 目录状态
	 * @param type 目录类型
	 * @return
	 */
	List<RoleMenuDTO> listByRoleIdsAndType(@Param("roleIds") Set<Long> roleIds, @Param("status") Integer status,
			@Param("menuType") Integer menuType);
	
	/**
	 * 根据目录状态查找目录列表
	 * @param status目录状态
	 * @return List<RoleMenuDTO>
	 */
	List<RoleMenuDTO> listRoleMenus(@Param("status") Integer status);
	
}