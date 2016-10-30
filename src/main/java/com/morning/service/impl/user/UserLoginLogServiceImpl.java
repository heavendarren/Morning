package com.morning.service.impl.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.user.UserLoginLogMapper;
import com.morning.entity.user.UserLoginLog;
import com.morning.service.user.UserLoginLogService;

/**
 * 
 * @description：前台用户业务逻辑层接口实现
 * @author CXX
 * @version 创建时间：2016年8月13日  上午12:13:46
 */
@Service("userLoginLogService")
public class UserLoginLogServiceImpl implements UserLoginLogService {

	@Autowired
	private UserLoginLogMapper userLoginLogMapper;
	
	@Override
	public int createLoginLog(UserLoginLog loginLog) {
		return userLoginLogMapper.createLoginLog(loginLog);
	}

	@Override
	public List<UserLoginLog> queryUserLoginLog(Integer accountId) {
		return userLoginLogMapper.queryUserLoginLog(accountId);
	}
}
