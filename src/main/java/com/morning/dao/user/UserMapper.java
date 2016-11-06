package com.morning.dao.user;

import java.util.List;
import java.util.Map;

import com.morning.entity.user.QueryUser;
import com.morning.entity.user.User;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：UserMapper   
* 类描述：前台用户数据访问层接口   
* 创建人：陈星星   
* 创建时间：2016年8月12日  下午5:20:19
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:39:37   
* @version
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