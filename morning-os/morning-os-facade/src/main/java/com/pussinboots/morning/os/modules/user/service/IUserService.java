package com.pussinboots.morning.os.modules.user.service;

import com.pussinboots.morning.os.modules.user.entity.User;
import com.pussinboots.morning.os.modules.user.entity.UserLoginLog;
import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IUserService   
* 类描述：User 表业务逻辑层接口     
* 创建人：陈星星   
* 创建时间：2017年2月20日 上午1:10:03    
*
 */
public interface IUserService extends IService<User> {
	
	/**
	 * 根据登录名查找用户信息
	 * @param loginName 手机号码/邮箱
	 * @return User 
	 */
	User selectByLoginName(String loginName);
	
	/**
	 * 检测邮箱号是否存在 
	 * @param email 邮箱号
	 * @return true存在 false不存在 
	 */
	boolean checkEmail(String email);
	
	/**
	 * 更新用户登录日志
	 * @param userId 用户ID
	 * @param userLoginLog 用户登录日志
	 */
	void updateLogByUserId(Long userId, UserLoginLog userLoginLog);
	
}
