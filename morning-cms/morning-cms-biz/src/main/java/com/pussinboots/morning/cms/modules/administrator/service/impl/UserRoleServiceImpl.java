package com.pussinboots.morning.cms.modules.administrator.service.impl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.cms.modules.administrator.entity.Role;
import com.pussinboots.morning.cms.modules.administrator.entity.User;
import com.pussinboots.morning.cms.modules.administrator.entity.UserRole;
import com.pussinboots.morning.cms.modules.administrator.mapper.RoleMapper;
import com.pussinboots.morning.cms.modules.administrator.mapper.UserRoleMapper;
import com.pussinboots.morning.cms.modules.administrator.service.IUserRoleService;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：UserRoleServiceImpl   
* 类描述：UserRole 表业务逻辑层接口实现类      
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:50:04
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {
	
	@Autowired
	private UserRoleMapper userRoleMapper;
	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public Map<String, Set<String>> selectRolesByUserId(Long UserId) {
		
        Map<String, Set<String>> resourceMap = new HashMap<>();
		
		List<Long> roleIdList = userRoleMapper.selectRoleIdsByUserId(UserId);
		
		Set<String> roleSigns = new HashSet<>();
		Set<String> roleIds = new HashSet<>();
		for (Long roleId : roleIdList) { // 添加用户角色信息
			Role role = roleMapper.selectById(roleId);
			roleSigns.add(role.getRoleSign());
			roleIds.add(role.getRoleId().toString());
		}
		
		resourceMap.put("roleSigns", roleSigns);
		resourceMap.put("roleIds", roleIds);
		
		return resourceMap;
	}

	@Override
	public List<Role> selectRolesByUserId(Long userId, Integer status) {
		return userRoleMapper.selectRolesByUserId(userId, status);
	}

	@Override
	public List<User> selectUsersByRoleId(Long roleId) {
		return userRoleMapper.selectUsersByRoleId(roleId);
	}

}
