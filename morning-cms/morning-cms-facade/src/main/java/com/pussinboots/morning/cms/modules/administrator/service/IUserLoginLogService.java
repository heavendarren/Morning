package com.pussinboots.morning.cms.modules.administrator.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.cms.modules.administrator.entity.UserLoginLog;

/**
 * 
* 项目名称：morning-cms-facade   
* 类名称：IUserLoginLogService   
* 类描述：UserLoginLog 表业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:47:07
 */
public interface IUserLoginLogService extends IService<UserLoginLog> {
	
	/**
	 * 根据用户ID查询用户登录日志
	 * @param userId 用户ID
	 * @return List<UserLoginLog>
	 */
	List<UserLoginLog> selectUserLoginLog(Long userId);
	
}
