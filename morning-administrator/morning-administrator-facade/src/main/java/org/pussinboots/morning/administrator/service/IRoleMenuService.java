package org.pussinboots.morning.administrator.service;

import java.util.List;
import java.util.Set;

import org.pussinboots.morning.administrator.entity.RoleMenu;
import org.pussinboots.morning.administrator.pojo.dto.RoleMenuDTO;
import org.pussinboots.morning.administrator.pojo.vo.RoleMenuVO;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-administrator-facade   
* 类名称：IRoleMenuService   
* 类描述：RoleMenu / 角色目录关联表 业务逻辑层接口               
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午5:48:03   
*
 */
public interface IRoleMenuService extends IService<RoleMenu> {
	
	/**
	 * 根据角色ID列表查找权限列表
	 * @param roleIds 角色ID列表
	 * @param status 权限状态
	 * @return Set<String>
	 */
	Set<String> getByRolesId(Set<String> roleIds, Integer status);
	
	/**
	 * 根据管理员ID查找系统目录
	 * @param userId 管理员ID
	 * @param status 状态
	 * @return List<RoleMenuVO>
	 */
	List<RoleMenuVO> listByUserId(Long userId, Integer status);
	
	/**
	 * 根据目录状态查找系统目录
	 * @param status 目录状态
	 * @return List<RoleMenuDTO>
	 */
	List<RoleMenuDTO> listRoleMenus(Integer status);
	
	/**
	 * 根据目录状态和角色ID查找目录及其是否选中
	 * @param roleId 角色ID
	 * @param status 目录状态
	 * @return List<RoleMenuVO>
	 */
	List<RoleMenuVO> listCheckedMenus(Long roleId, Integer status);
}
