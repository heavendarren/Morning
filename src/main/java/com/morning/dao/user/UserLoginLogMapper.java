package com.morning.dao.user;

import java.util.List;

import com.morning.entity.user.UserLoginLog;

/**
 * 
 * @description：用户登录日志持久层接口
 * @author CXX
 * @version 创建时间：2016年8月12日  下午11:45:15
 */
public interface UserLoginLogMapper {
	
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