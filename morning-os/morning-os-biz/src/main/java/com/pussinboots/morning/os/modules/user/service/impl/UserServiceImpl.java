package com.pussinboots.morning.os.modules.user.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.common.enums.StatusEnum;
import com.pussinboots.morning.common.exception.ValidateException;
import com.pussinboots.morning.os.common.util.PasswordUtils;
import com.pussinboots.morning.os.common.util.UserUtils;
import com.pussinboots.morning.os.modules.user.entity.User;
import com.pussinboots.morning.os.modules.user.entity.UserLoginLog;
import com.pussinboots.morning.os.modules.user.mapper.UserLoginLogMapper;
import com.pussinboots.morning.os.modules.user.mapper.UserMapper;
import com.pussinboots.morning.os.modules.user.service.IUserService;

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
	public void insertUser(User user) throws ValidateException {
		// 邮箱唯一性验证（邮箱存在且已经被激活）
		User emailUser = userMapper.selectOne(new User(user.getEmail()));
		if (emailUser != null && StatusEnum.ACTIVATED.getStatus().equals(emailUser.getEmailIsActive())) {
			throw new ValidateException("该电子邮箱已被注册了");
		}
		if (emailUser != null && StatusEnum.NONACTIVATED.getStatus().equals(emailUser.getEmailIsActive())) {
			userMapper.deleteById(emailUser.getUserId()); // 如果未被激活则删除用户
		}
		user.setUserNumber(UserUtils.getUserNumber());
		user.setSalt(PasswordUtils.getSalt());
		user.setPicImg(UserUtils.getPicImg());
		user.setRegeistTime(new Date());
		user.setCreateBy(user.getUserName());
		user.setLoginPassword(PasswordUtils.getMd5(user.getLoginPassword(), user.getUserNumber(), user.getSalt()));
		userMapper.insert(user);
	}

	@Override
	public User selectByLoginName(String loginName) {
		return userMapper.selectByLoginName(loginName);
	}
	
	@Override
	public boolean checkEmail(String email) {
		int count = userMapper.selectCount(new EntityWrapper<User>(new User(email)));
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean checkMobile(String telephone) {
		User user = new User();
		user.setTelephone(telephone);
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

	@Override
	public void updatePasswordByEmail(String loginPassword, String email) {
		User user = userMapper.selectByLoginName(email);
		user.setLoginPassword(PasswordUtils.getMd5(loginPassword, user.getUserNumber(), user.getSalt()));
		user.setUpdateTime(new Date());
		user.setUpdateBy(user.getUserName());
		userMapper.updateById(user);
	}

	@Override
	public void updateEmailActive(String email) {
		User user = new User();
		user.setEmailIsActive(StatusEnum.ACTIVATED.getStatus());
		userMapper.update(user, new EntityWrapper<User>(new User(email)));
	}

	@Override
	public void updatePerfectUser(String email, String telephone, String realName) throws ValidateException {
		// 判断手机唯一性
		User user = new User();
		user.setTelephone(telephone);
		if (userMapper.selectCount(new EntityWrapper<User>(user)) > 0) {
			throw new ValidateException("该电子邮箱已被注册了");
		}
		// 完善个人信息
		user.setRealName(realName);
		userMapper.update(user, new EntityWrapper<User>(new User(email)));
	}
}
