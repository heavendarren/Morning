package com.pussinboots.morning.cms.modules.administrator.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.cms.common.security.AuthorizingUser;
import com.pussinboots.morning.cms.modules.administrator.entity.User;
import com.pussinboots.morning.cms.modules.administrator.entity.UserLoginLog;
import com.pussinboots.morning.cms.modules.administrator.vo.UserVO;
import com.pussinboots.morning.common.exception.ValidateException;

/**
 * 
* 项目名称：morning-cms-facade   
* 类名称：IUserService   
* 类描述：User 表业务逻辑层接口    
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:47:42
 */
public interface IUserService extends IService<User> {
	
	/**
	 * 创建管理员/添加角色记录
	 * @param user 管理员信息
	 * @param roleIds 角色记录ID
	 * @param authorizingUser 当前管理员信息
	 * @throws ValidateException 验证异常
	 */
	void insertUser(User user, String[] roleIds, AuthorizingUser authorizingUser) throws ValidateException;
	
	/**
	 * 根据管理员登录名查找管理员
	 * @param loginName 登录名
	 * @return UserVO
	 */
	User selectByLoginName(String loginName);
	
	/**
	 * 查找所有管理员数量
	 * @return Integer null返回0
	 */
	Integer selectAllUserNumber();
	
	/**
	 * 根据用户查找管理员列表
	 * @param userVo 用户查询条件
	 * @return List<UserVO> 
	 */
	List<UserVO> selectAllUser(UserVO userVO);
	
	/**
	 * 根据组织ID查找管理员列表
	 * @param organizationId
	 * @return
	 */
	List<UserVO> selectUsersByOrganizationId(Long organizationId);
	
	/**
	 * 根据管理员ID查找管理员信息
	 * @param userId 管理员ID
	 * @return UserVO
	 */
	UserVO selectByUserId(Long userId);
	
	/**
	 * 更新管理员登录日志
	 * @param userId 管理员ID
	 * @param userLoginLog 管理员登录日志
	 */
	void updateLogByUserId(Long userId, UserLoginLog userLoginLog);
	
	/**
	 * 更新管理员个人信息
	 * @param user
	 * @param authorizingUser 当前登录管理员
	 */
	void updateUserInfo(User user, AuthorizingUser authorizingUser);
	
	/**
	 * 更新管理员密码
	 * @param nowPassword 原密码
	 * @param newPassword 新密码
	 * @param authorizingUser 当前管理员信息
	 * @throws ValidateException 验证异常
	 */
	void updateUserPsw(String nowPassword, String newPassword, AuthorizingUser authorizingUser) throws ValidateException;
	
	/**
	 * 更新管理员状态
	 * @param userId 管理员ID
	 * @param status 管理员状态
	 */
	void updateUserStatus(Long userId, Integer status);
	
	/**
	 * 更新用户信息和角色记录
	 * @param user
	 * @param roleIds
	 * @param authorizingUser 当前管理员信息
	 */
	void updateUserInfo(User user, String[] roleIds, AuthorizingUser authorizingUser);
	
	/**
	 * 更新管理员头像
	 * @param userId 管理员ID
	 * @param picImg 头像
	 */
	void updateUserAvatar(Long userId, String picImg);
	
	/**
	 * 删除用户，同时删除角色记录、登录日志
	 * @param userId
	 */
	void deleteUser(Long userId);
}
