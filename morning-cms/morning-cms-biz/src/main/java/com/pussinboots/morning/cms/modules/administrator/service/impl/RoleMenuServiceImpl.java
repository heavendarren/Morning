package com.pussinboots.morning.cms.modules.administrator.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.cms.common.security.AuthorizingUser;
import com.pussinboots.morning.cms.modules.administrator.dto.RoleMenuDTO;
import com.pussinboots.morning.cms.modules.administrator.entity.RoleMenu;
import com.pussinboots.morning.cms.modules.administrator.mapper.RoleMenuMapper;
import com.pussinboots.morning.cms.modules.administrator.mapper.UserRoleMapper;
import com.pussinboots.morning.cms.modules.administrator.service.IRoleMenuService;
import com.pussinboots.morning.cms.modules.administrator.vo.RoleMenuVO;
import com.pussinboots.morning.cms.modules.system.enums.MenuTypeEnum;
import com.pussinboots.morning.common.enums.StatusEnum;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：RoleMenuServiceImpl   
* 类描述：RoleMenu 表业务逻辑层接口实现类     
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:49:11
 */
@Service
public class RoleMenuServiceImpl extends ServiceImpl<RoleMenuMapper, RoleMenu> implements IRoleMenuService {
	
	@Autowired
	private RoleMenuMapper roleMenuMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	@Override
	public Set<String> selectMenusByRolesId(Set<String> roleIds) {
		Set<String> roleMenus = new HashSet<>();

		Set<RoleMenuDTO> menus = roleMenuMapper.selectMenusByRolesId(roleIds);

		for (RoleMenuDTO menu : menus) {
			if (StringUtils.isNotBlank(menu.getPermission())) {
				// 添加基于Permission的权限信息
				roleMenus.add(menu.getPermission());
			}
		}
		return roleMenus;
	}

	@Override
	public List<RoleMenuVO> selectMenusByAdmin(AuthorizingUser authorizingUser) {
		
		List<RoleMenuVO> menus = new ArrayList<>();
		// 根据用户ID查找角色列表ID
		List<Long> roleIds = userRoleMapper.selectRoleIdsByUserId(authorizingUser.getUserId());
		
		// 查询一级目录
		List<RoleMenuDTO> parentAllMenus = roleMenuMapper.selectMenusByRolesIdAndStatus(roleIds, StatusEnum.SHOW.getStatus(),MenuTypeEnum.FIRST_MENU.getType());
		List<RoleMenuDTO> parentMenus = menuDereplication(parentAllMenus);// 去重
		// 查询一级目录
		List<RoleMenuDTO> childAllMenus = roleMenuMapper.selectMenusByRolesIdAndStatus(roleIds, StatusEnum.SHOW.getStatus(),MenuTypeEnum.SECOND_MENU.getType());
		List<RoleMenuDTO> childMenus = menuDereplication(childAllMenus);// 去重
		
		// 获取根级权限的子级权限
		for (RoleMenuDTO parentMenu : parentMenus) {
			recursionMenu(menus, childMenus, parentMenu);
		}
		
		return menus;
	}
	
	@Override
	public List<RoleMenuDTO> selectRoleMenus(Integer status) {
		return roleMenuMapper.selectRoleMenusByStatus(status);
	}

	@Override
	public List<RoleMenuVO> selectCheckedMenus(Long roleId, Integer status) {
		// 查询所有目录根据状态
		List<RoleMenuDTO> menus = roleMenuMapper.selectRoleMenusByStatus(status);

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
	 * 递归得到每个权限的子级权限
	 * @param menus 处理后的目录列表
	 * @param childMenus  二级目录列表
	 * @param parentMenu 当前一级目录
	 */
	private void recursionMenu(List<RoleMenuVO> menus, List<RoleMenuDTO> childMenus, RoleMenuDTO parentMenu){
		List<RoleMenuDTO> childMenuList = new ArrayList<>();
		for(RoleMenuDTO menu : childMenus){
			if(parentMenu.getMenuId() == menu.getParentId()){
				childMenuList.add(menu);
			}
		}
		RoleMenuVO parentMenuVo = new RoleMenuVO();
		BeanUtils.copyProperties(parentMenu, parentMenuVo);
		parentMenuVo.setChildMenus(childMenuList);
		menus.add(parentMenuVo);
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
}
