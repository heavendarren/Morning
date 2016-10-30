package com.morning.service.user;

import java.util.List;

import com.morning.entity.user.UserLoginLog;

/**
 * 
 * @description：前台用户登录日志业务层接口
 * @author CXX
 * @version 创建时间：2016年8月13日  上午12:11:00
 */
public interface UserLoginLogService {
	
	/**
	 * 添加登录日志
	 * @param loginLog
	 * @return 日志ID
	 */
	public int createLoginLog(UserLoginLog loginLog);
	
	/**
	 * 通过ID查询用户登录日志
	 * @param accountId
	 * @return
	 */
	public List<UserLoginLog> queryUserLoginLog(Integer accountId);
}
