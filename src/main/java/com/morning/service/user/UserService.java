package com.morning.service.user;

import java.util.Date;
import java.util.List;

import com.morning.entity.user.QueryUser;
import com.morning.entity.user.User;

/**
 * service接口好处
 * 1.可以在尚未实现具体Service情况下编写上层改代码,如Controller对Service的调用
 * 2.Spring无论是AOP还是事务管理的实现都是基于动态代理的,而动态代理的实现依赖于接口,所以必须有接口的定义才能使用这些功能
 */
/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：UserService   
* 类描述：前台用户业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年8月12日  下午10:53:48
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午11:06:53   
* @version
 */
public interface UserService {
	/**
	 * 创建用户
	 * @param user
	 * @return 返回用户ID
	 */
	public int createUser(User user);
	
	/***
	 * 修改用户登录最后登录时间和IP
	 * @param parameter
	 */
	public void updateUserLoginLog(Integer accountId, Date lastLoginTime, String lastLoginIp);
	
	/**
	 * 通过用户ID，查询用户
	 * @param accountId
	 * @return  User
	 */
	public User queryUserById(Integer accountId);
	
	/**
	 * 通过用户邮箱，查询用户
	 * @param email
	 * @return  User
	 */
	public User queryUserByEmail(String email);
	
	/**
	 * 查询用户列表
	 * @return
	 */
	public List<User> queryUserList(QueryUser queryUser);
	
	/**
	 * 通过用户信息，查询用户是否存在
	 * @param user
	 * @return User
	 */
	public boolean selectByUser(User user);
	
	/**
	 * 检测手机是否存在 
	 * @param mobile 手机号
	 * @return true存在 false不存在 
	 */
	public boolean checkMobile(String mobile);
	
	/**
	 * 检测邮箱号是否存在 
	 * @param email 邮箱号
	 * @return  true存在 false不存在 
	 */
	public boolean checkEmail(String email);
	
	/**
	 * 获取登录用户
	 * @param loginName 帐号（邮箱或手机号）
	 * @param loginPassword 密码
	 * @return User
	 */
	public User getLoginUser(String loginName,String loginPassword);
	
	/**
	 * 修改用户密码
	 * @param user
	 */
	public void updateUserPwd(User user);
	
	/**
	 * 修改用户信息
	 * @param user
	 */
	public void updateUser(User user);
	
	/**
	 * 修改用户头像
	 * @param user
	 */
	public void updateImg(User user);
	
	/**
	 * 获取用户数量
	 * @return
	 */
	public int getUserNumber();
	
	/**
	 * 冻结或解冻用户
	 * @param user
	 */
	public void updateUserStates(User user);
	
	/**
	 * 删除用户
	 * @param accountId
	 */
	public void deleteUser(Integer accountId);
}
