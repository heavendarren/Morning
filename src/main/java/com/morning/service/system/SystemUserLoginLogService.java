package com.morning.service.system;

import java.util.List;

import com.morning.entity.system.SystemUser;
import com.morning.entity.system.SystemUserLoginLog;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemUserLoginLogService   
* 类描述： 后台管理员登录日志业务逻辑层接口  
* 创建人：陈星星   
* 创建时间：2016年11月6日 下午11:05:06   
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午11:05:06   
* @version
 */
public interface SystemUserLoginLogService {
	
	/**
	 * 添加管理员登陆日志
	 * @param systemUserLoginLog
	 * @return
	 */
	public void createLoginLog(SystemUserLoginLog systemUserLoginLog);
	
	/**
	 * 查询管理员登录日志，通过ID 
	 * @param accountId
	 * @return
	 */
	public List<SystemUserLoginLog> querySysUserLoginLog(Integer accountId);
	
	/**
	 * 保存管理员登录日志
	 * @param request
	 * @param systemUser
	 */
	public void saveLoginLog(SystemUser systemUser);
}
