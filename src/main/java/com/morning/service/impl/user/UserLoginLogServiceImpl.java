package com.morning.service.impl.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.user.UserLoginLogMapper;
import com.morning.entity.user.UserLoginLog;
import com.morning.service.user.UserLoginLogService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：UserLoginLogServiceImpl   
* 类描述：前台用户业务逻辑层实现   
* 创建人：陈星星   
* 创建时间：2016年8月13日  上午12:13:46
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午11:02:25   
* @version
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
