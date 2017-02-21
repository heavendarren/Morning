package com.pussinboots.morning.os.modules.user.service.impl;

import com.pussinboots.morning.os.modules.user.entity.User;
import com.pussinboots.morning.os.modules.user.entity.UserLoginLog;
import com.pussinboots.morning.os.modules.user.mapper.UserLoginLogMapper;
import com.pussinboots.morning.os.modules.user.mapper.UserMapper;
import com.pussinboots.morning.os.modules.user.service.IUserService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：UserServiceImpl   
* 类描述：User 表业务逻辑层接口实现类      
* 创建人：陈星星   
* 创建时间：2017年2月20日 上午1:12:24    
*
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private UserLoginLogMapper userLoginLogMapper;

	@Override
	public User selectByLoginName(String loginName) {
		return userMapper.selectByLoginName(loginName);
	}
	
	@Override
	public boolean checkEmail(String email) {
		User user = new User();
		user.setEmail(email);
		int count = userMapper.selectCount(new EntityWrapper<User>(user));
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public void updateLogByUserId(Long userId, UserLoginLog userLoginLog) {
		// 更新用户登录日志
		User user = new User();
		user.setUserId(userId);
		user.setLastLoginIp(userLoginLog.getUserIp());
		user.setLastLoginTime(new Date());
		userMapper.updateByUser(user);
		// 创建用户登录日志
		userLoginLogMapper.insert(userLoginLog);
	}


	
}
