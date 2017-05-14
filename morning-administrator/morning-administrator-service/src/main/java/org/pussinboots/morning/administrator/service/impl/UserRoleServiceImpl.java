package org.pussinboots.morning.administrator.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.pussinboots.morning.administrator.entity.Role;
import org.pussinboots.morning.administrator.entity.UserRole;
import org.pussinboots.morning.administrator.mapper.UserRoleMapper;
import org.pussinboots.morning.administrator.pojo.dto.UserPageDTO;
import org.pussinboots.morning.administrator.pojo.dto.UserRoleDTO;
import org.pussinboots.morning.administrator.pojo.vo.UserVO;
import org.pussinboots.morning.administrator.service.IUserRoleService;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-administrator-service   
* 类名称：UserRoleServiceImpl   
* 类描述：UserRole / 管理员角色关联表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年4月1日 下午5:51:10   
*
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {
	
	@Autowired
	private UserRoleMapper userRoleMapper;

	@Override
	public UserRoleDTO getByUserId(Long userId, Integer status) {

		List<Role> roles = userRoleMapper.listByUserId(userId, status);

		Set<String> roleSigns = new HashSet<>();
		Set<String> roleIds = new HashSet<>();

		// 遍历角色列表
		for (Role role : roles) {
			roleSigns.add(role.getRoleSign());
			roleIds.add(role.getRoleId().toString());
		}
		return new UserRoleDTO(roleSigns, roleIds);
	}

	@Override
	public List<Role> listByUserId(Long userId, Integer status) {
		return userRoleMapper.listByUserId(userId, status);
	}

	@Override
	public UserPageDTO listByRoleId(Long roleId, PageInfo pageInfo, String search) {
		Page<UserVO> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());
		List<UserVO> userVOs = userRoleMapper.listByRoleId(roleId, pageInfo, search, page);
		pageInfo.setTotal(page.getTotal());
		return new UserPageDTO(userVOs, pageInfo);
	}
}
