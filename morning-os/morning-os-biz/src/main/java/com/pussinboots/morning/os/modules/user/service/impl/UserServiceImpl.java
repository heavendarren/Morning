package com.pussinboots.morning.os.modules.user.service.impl;

import com.pussinboots.morning.os.modules.user.entity.User;
import com.pussinboots.morning.os.modules.user.mapper.UserMapper;
import com.pussinboots.morning.os.modules.user.service.IUserService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

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

	@Override
	public User selectByLoginName(String loginName) {
		return userMapper.selectByLoginName(loginName);
	}
	
}
