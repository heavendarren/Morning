package com.pussinboots.morning.os.modules.user.service.impl;

import com.pussinboots.morning.os.modules.user.entity.UserLoginLog;
import com.pussinboots.morning.os.modules.user.mapper.UserLoginLogMapper;
import com.pussinboots.morning.os.modules.user.service.IUserLoginLogService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：UserLoginLogServiceImpl   
* 类描述：UserLoginLog 表业务逻辑层接口实现类      
* 创建人：陈星星   
* 创建时间：2017年2月20日 上午1:12:08    
*
 */
@Service
public class UserLoginLogServiceImpl extends ServiceImpl<UserLoginLogMapper, UserLoginLog> implements IUserLoginLogService {
	
}
