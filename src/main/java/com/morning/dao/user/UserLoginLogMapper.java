package com.morning.dao.user;

import java.util.List;

import com.morning.entity.user.UserLoginLog;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：UserLoginLogMapper   
* 类描述：前台用户登录日志数据访问层接口   
* 创建人：陈星星   
* 创建时间：2016年8月12日  下午11:45:15 
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:39:10   
* @version
 */
public interface UserLoginLogMapper {
	
	/**
	 * 添加登录日志
	 * @param loginLog
	 * @return 日志ID
	 */
	public int createLoginLog(UserLoginLog loginLog);
	
	/**
	 * 通过ID查询用户登录日志
	 * @param accountId
	 * @return
	 */
	public List<UserLoginLog> queryUserLoginLog(Integer accountId);
	
}