package com.morning.service.system;

import java.util.List;

import com.morning.entity.system.SystemUser;
import com.morning.entity.system.SystemUserLoginLog;

/**
 * 
 * @description：后台管理员登录业务层接口
 * @author CXX
 * @version 创建时间：2016年9月14日  下午3:16:44
 */
public interface SystemUserLoginLogService {
	
	/**
	 * 添加管理员登陆日志
	 * @param systemUserLoginLog
	 * @return
	 */
	public int createLoginLog(SystemUserLoginLog systemUserLoginLog);
	
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
