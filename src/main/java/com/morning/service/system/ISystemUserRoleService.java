package com.morning.service.system;

import java.util.List;

import com.baomidou.framework.service.ISuperService;
import com.morning.entity.system.SystemUserRole;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：ISystemUserRoleService   
* 类描述：SystemUserRole 表业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年11月13日 上午11:37:40   
* 修改人：陈星星   
* 修改时间：2016年11月13日 上午11:37:40   
* @version
 */
public interface ISystemUserRoleService extends ISuperService<SystemUserRole> {

	/**
	 * 通过账号ID查找角色列表
	 * @param accountId 账号Id
	 * @return
	 */
	List<SystemUserRole> selectRoleListByAccountId(Integer accountId);
}