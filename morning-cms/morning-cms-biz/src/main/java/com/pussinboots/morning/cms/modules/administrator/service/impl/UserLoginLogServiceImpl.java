package com.pussinboots.morning.cms.modules.administrator.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.cms.modules.administrator.entity.UserLoginLog;
import com.pussinboots.morning.cms.modules.administrator.mapper.UserLoginLogMapper;
import com.pussinboots.morning.cms.modules.administrator.service.IUserLoginLogService;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：UserLoginLogServiceImpl   
* 类描述：UserLoginLog 表业务逻辑层接口实现类      
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:49:46
 */
@Service
public class UserLoginLogServiceImpl extends ServiceImpl<UserLoginLogMapper, UserLoginLog> implements IUserLoginLogService {
	
	
	@Autowired
	private UserLoginLogMapper userLoginLogMapper;
	
	@Override
	//@Cacheable(value="systemUserCache",key="'userLoginLog'+#userId")
	public List<UserLoginLog> selectUserLoginLog(Long userId) {
		UserLoginLog userLoginLog = new UserLoginLog();
		userLoginLog.setUserId(userId);
		return userLoginLogMapper.selectList(new EntityWrapper<UserLoginLog>(userLoginLog).orderBy("logId", false));
	}
}
