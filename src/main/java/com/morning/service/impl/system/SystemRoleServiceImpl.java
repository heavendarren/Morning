package com.morning.service.impl.system;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.morning.dao.system.SystemRoleMapper;
import com.morning.entity.system.SystemRole;
import com.morning.service.system.SystemRoleService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemRoleServiceImpl   
* 类描述： 系统角色业务逻辑层实现  
* 创建人：陈星星   
* 创建时间：2016年10月25日 上午3:29:26   
* 修改人：陈星星   
* 修改时间：2016年10月25日 上午3:29:26   
* 修改备注：   
* @version    
*
 */
@Service("systemRoleService")
public class SystemRoleServiceImpl implements SystemRoleService {
	
	@Autowired
	private SystemRoleMapper systemRoleMapper;
	
	@Override
	@Cacheable(value="userCache",key="'sysUserRole'+#accountId")
	public List<SystemRole> queryRoleByUserId(Integer accountId) {
		return systemRoleMapper.queryRoleByUserId(accountId);
	}

	@Override
	public List<SystemRole> queryRoleList() {
		return systemRoleMapper.queryRoleList();
	}

	@Override
	public int queryRoleNumber(Integer roleId) {
		return systemRoleMapper.queryRoleNumber(roleId);
	}

	@Override
	public List<SystemRole> queryRoles() {
		List<SystemRole> systemRoleList =  queryRoleList();
		List<SystemRole> systemRoles =  new ArrayList<SystemRole>();
		for(SystemRole role : systemRoleList){
			role.setNumber(queryRoleNumber(role.getRoleId()));
			systemRoles.add(role);
		}
		return systemRoles;
	}

}
