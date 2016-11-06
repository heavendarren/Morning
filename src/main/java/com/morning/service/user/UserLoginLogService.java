package com.morning.service.user;

import java.util.List;

import com.morning.entity.user.UserLoginLog;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：UserLoginLogService   
* 类描述：前台用户登录日志业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年8月13日  上午12:11:00
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午11:06:19   
* @version
 */
public interface UserLoginLogService {
	
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
