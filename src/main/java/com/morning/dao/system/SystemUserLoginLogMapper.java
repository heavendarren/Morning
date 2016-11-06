package com.morning.dao.system;

import java.util.List;

import com.morning.entity.system.SystemUserLoginLog;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemUserLoginLogMapper   
* 类描述：后台管理员登录日志数据访问层接口   
* 创建人：陈星星   
* 创建时间：2016年11月6日 下午10:38:04   
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:38:04   
* @version
 */
public interface SystemUserLoginLogMapper {
	
	/**
	 * 添加管理员登陆日志
	 * @param systemUserLoginLog
	 */
	public void createLoginLog(SystemUserLoginLog systemUserLoginLog);
	
	/**
	 * 查询管理员登录日志，通过ID 
	 * @param accountId
	 * @return
	 */
	public List<SystemUserLoginLog> querySysUserLoginLog(Integer accountId);
}
