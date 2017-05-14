package org.pussinboots.morning.administrator.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.pussinboots.morning.administrator.common.enums.MenuTypeEnum;
import org.pussinboots.morning.administrator.entity.Role;
import org.pussinboots.morning.administrator.entity.RoleMenu;
import org.pussinboots.morning.administrator.mapper.RoleMenuMapper;
import org.pussinboots.morning.administrator.mapper.UserRoleMapper;
import org.pussinboots.morning.administrator.pojo.dto.RoleMenuDTO;
import org.pussinboots.morning.administrator.pojo.vo.RoleMenuVO;
import org.pussinboots.morning.administrator.service.IRoleMenuService;
import org.pussinboots.morning.common.enums.StatusEnum;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-administrator-service   
* 类名称：RoleMenuServiceImpl   
* 类描述：RoleMenu / 角色目录关联表 业务逻辑层接口实现         
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午6:04:52   
*
 */
@Service
public class RoleMenuServiceImpl extends ServiceImpl<RoleMenuMapper, RoleMenu> implements IRoleMenuService {
	
	@Autowired
	private RoleMenuMapper roleMenuMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;

	@Override
	public Set<String> getByRolesId(Set<String> roleIds, Integer status) {
		Set<String> roleMenus = new HashSet<>();

		Set<RoleMenuDTO> menus = roleMenuMapper.listByRoleIds(roleIds, status);
		
		// 遍历权限列表
		for (RoleMenuDTO menu : menus) {
			if (StringUtils.isNotBlank(menu.getPermission())) {
				// 添加基于Permission的权限信息
				roleMenus.add(menu.getPermission());
			}
		}
		return roleMenus;
	}

	@Override
	public List<RoleMenuVO> listByUserId(Long userId, Integer status) {
		
		List<RoleMenuVO> menus = new ArrayList<>();
		
		List<Role> roles = userRoleMapper.listByUserId(userId, status);
		Set<Long> roleIds = new HashSet<>();
		for (Role role : roles) {
			roleIds.add(role.getRoleId());
		}
		
		// 查询一级目录
		List<RoleMenuDTO> parentAllMenus = roleMenuMapper.listByRoleIdsAndType(roleIds, StatusEnum.SHOW.getStatus(),
				MenuTypeEnum.FIRST_MENU.getType());
		List<RoleMenuDTO> parentMenus = menuDereplication(parentAllMenus);// 去重
		// 查询二级目录
		List<RoleMenuDTO> childAllMenus = roleMenuMapper.listByRoleIdsAndType(roleIds, StatusEnum.SHOW.getStatus(),
				MenuTypeEnum.SECOND_MENU.getType());
		List<RoleMenuDTO> childMenus = menuDereplication(childAllMenus);// 去重
		
		// 获取根级权限的子级权限
		for (RoleMenuDTO parentMenu : parentMenus) {
			recursionMenu(menus, childMenus, parentMenu);
		}
		
		return menus;
	}
	
	
	@Override
	public List<RoleMenuDTO> listRoleMenus(Integer status) {
		return roleMenuMapper.listRoleMenus(status);
	}

	@Override
	public List<RoleMenuVO> listCheckedMenus(Long roleId, Integer status) {
		// 查询所有目录根据状态
		List<RoleMenuDTO> menus = roleMenuMapper.listRoleMenus(status);

		// 查找该角色拥有的权限
		RoleMenu queryRoleMenu = new RoleMenu();
		queryRoleMenu.setRoleId(roleId);
		List<RoleMenu> roleMenus = roleMenuMapper.selectList(new EntityWrapper<RoleMenu>(queryRoleMenu));

		List<RoleMenuVO> roleMenuVOs = new ArrayList<>();

		// 遍历目录，设置该角色是否选中该目录
		for (RoleMenuDTO menu : menus) {
			RoleMenuVO roleMenuVO = new RoleMenuVO();
			BeanUtils.copyProperties(menu, roleMenuVO);

			for (RoleMenu roleMenu : roleMenus) {
				if (roleMenuVO.getMenuId().equals(roleMenu.getMenuId())) {
					roleMenuVO.setChecked(true);
				}
			}
			roleMenuVOs.add(roleMenuVO);
		}
		return roleMenuVOs;
	}
	
	/**
	 * 权限去重 （由于数据库中DISTINCT关键词版本报错）
	 * @param sourceRoleMenuVOs 原权限
	 * @return
	 */
	private List<RoleMenuDTO> menuDereplication(List<RoleMenuDTO> sourceRoleMenuVOs) {
		List<RoleMenuDTO> roleMenuDTOs = new ArrayList<>();
		for (RoleMenuDTO roleMenuDTO : sourceRoleMenuVOs) {
			if (!roleMenuDTOs.contains(roleMenuDTO)) {
				roleMenuDTOs.add(roleMenuDTO);
			}
		}
		return roleMenuDTOs;
	}
	
	/**
	 * 递归得到每个权限的子级权限
	 * @param menus 处理后的目录列表
	 * @param childMenus  二级目录列表
	 * @param parentMenu 当前一级目录
	 */
	private void recursionMenu(List<RoleMenuVO> menus, List<RoleMenuDTO> childMenus, RoleMenuDTO parentMenu) {
		List<RoleMenuDTO> childMenuList = new ArrayList<>();
		for (RoleMenuDTO menu : childMenus) {
			if (parentMenu.getMenuId() == menu.getParentId()) {
				childMenuList.add(menu);
			}
		}
		RoleMenuVO parentMenuVo = new RoleMenuVO();
		BeanUtils.copyProperties(parentMenu, parentMenuVo);
		parentMenuVo.setChildMenus(childMenuList);
		menus.add(parentMenuVo);
	}

}
