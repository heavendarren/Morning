package com.morning.dao.user;

import java.util.List;
import java.util.Map;

import com.morning.entity.user.QueryUser;
import com.morning.entity.user.User;

/**
 * dao接口好处
 * 1.可以在尚未实现具体DAO的时候编写上层代码,如Service里对DAO的调用
 * 2.可以为DAO进行多实现,例如有JDBCDAO实现,MyBatisDAO实现,而不需要更改上层代码,只需要简单的在Spring的IoC配置里修改一下注入的DAO实现
 */
/**
 * 
 * @description：用户信息持久层接口
 * @author CXX
 * @version 创建时间：2016年8月12日  下午5:20:19
 */
public interface UserMapper {
	
	/**
	 * 注册创建用户
	 * @param user
	 * @return 返回用户ID
	 */
    public int createUser(User user);
    
	/***
	 * 修改用户登录最后登录时间和IP
	 * @param parameter
	 */
	public void updateUserLoginLog(Map<String,Object> parameter);
	
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
	 * 通过用户信息，查询用户
	 * @param user
	 * @return User
	 */
	public User selectByUser(User user);
	
	/**
	 * 查询用户列表
	 * @return
	 */
	public List<User> queryUserList(QueryUser queryUser);
	
	/**
	 * 检测手机是否存在 
	 * @param mobile 手机号
	 * @return 返回记录数
	 */
	public int checkMobile(String mobile);
	
	/**
	 * 检测邮箱号是否存在 
	 * @param email 邮箱号
	 * @return 返回记录数
	 */
	public int checkEmail(String email);
	
	/**
	 * 获取登录用户
	 * @param map 用户和密码 可以是邮箱号或手机号
	 * @return User
	 */
	public User getLoginUser(Map<String,Object> map);
	
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