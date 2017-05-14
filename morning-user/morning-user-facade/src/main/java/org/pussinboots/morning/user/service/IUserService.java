package org.pussinboots.morning.user.service;

import org.pussinboots.morning.common.exception.ValidateException;
import org.pussinboots.morning.user.entity.User;
import org.pussinboots.morning.user.entity.UserLoginLog;
import org.pussinboots.morning.user.pojo.vo.UserVO;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-user-facade   
* 类名称：IUserService   
* 类描述：User / 用户表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午2:14:21   
*
 */
public interface IUserService extends IService<User> {
	
	/**
	 * 创建用户
	 * @param user 用户信息
	 * @return
	 */
	Integer insertUser(User user) throws ValidateException;
	
	/**
	 * 根据登录名查找用户信息
	 * @param loginName 手机号码/邮箱
	 * @return
	 */
	User getByLoginName(String loginName);
	
	/**
	 * 根据邮箱获取用户信息
	 * @param email 电子邮箱
	 * @return
	 */
	User getByEmail(String email);
	
	/**
	 * 根据用户ID获取用户显示信息
	 * @param userId 用户ID
	 * @return
	 */
	UserVO getById(Long userId);
	
	/**
	 * 更新用户登录日志
	 * @param userId 用户ID
	 * @param userLoginLog 用户登录日志
	 * @return
	 */
	Integer updateLogById(Long userId, UserLoginLog userLoginLog);
	
	/**
	 * 通过邮箱激活账号
	 * @param email 邮箱号码
	 * @return
	 */
	Integer updateEmailActive(String email);
	
	/**
	 * 通过邮箱完善个人信息
	 * @param email 邮箱
	 * @param telephone 手机号码
	 * @param realName 真实姓名
	 * @return
	 */
	Integer updatePerfectUser(String email, String telephone, String realName) throws ValidateException;
	
	/**
	 * 通过邮箱重置登录密码
	 * @param loginPassword 登录密码
	 * @param email 电子邮箱
	 * @return
	 */
	Integer updatePasswordByEmail(String loginPassword, String email);

}
