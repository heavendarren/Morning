package com.pussinboots.morning.os.modules.user.service;

import com.pussinboots.morning.common.exception.ValidateException;
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
	 * 创建用户
	 * @param user 用户信息
	 */
	void insertUser(User user) throws ValidateException;
	
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
	 * 检测手机号码是否存在 
	 * @param telephone 手机号码
	 * @return true存在 false不存在 
	 */
	boolean checkMobile(String telephone);
	
	/**
	 * 更新用户登录日志
	 * @param userId 用户ID
	 * @param userLoginLog 用户登录日志
	 */
	void updateLogByUserId(Long userId, UserLoginLog userLoginLog);
	
	/**
	 * 根据用户邮箱更新密码
	 * @param loginPassword 用户密码
	 * @param email 用户邮箱
	 */
	void updatePasswordByEmail(String loginPassword, String email);
	
	/**
	 * 通过邮箱激活账号
	 * @param email 邮箱号码
	 */
	void updateEmailActive(String email);
	
	/**
	 * 通过邮箱完善个人信息
	 * @param email 邮箱
	 * @param telephone 手机
	 * @param realName 真实姓名
	 * @throws ValidateException 手机唯一性检查
	 */
	void updatePerfectUser(String email, String telephone, String realName)throws ValidateException;
	
}
