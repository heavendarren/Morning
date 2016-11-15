package com.morning.service.impl.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.morning.dao.system.SystemUserRoleMapper;
import com.morning.entity.system.SystemUserRole;
import com.morning.service.system.ISystemUserRoleService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemUserRoleServiceImpl   
* 类描述：SystemUserRole 表业务逻辑层接口 实现类   
* 创建人：陈星星   
* 创建时间：2016年11月13日 上午11:38:00   
* 修改人：陈星星   
* 修改时间：2016年11月13日 上午11:38:00   
* @version
 */
@Service
public class SystemUserRoleServiceImpl extends SuperServiceImpl<SystemUserRoleMapper, SystemUserRole> implements ISystemUserRoleService {
	
	@Autowired
	private SystemUserRoleMapper systemUserRoleMapper;
	
	@Override
	public List<SystemUserRole> selectRoleListByAccountId(Integer accountId) {
		return systemUserRoleMapper.selectRoleListByAccountId(accountId);
	}


}