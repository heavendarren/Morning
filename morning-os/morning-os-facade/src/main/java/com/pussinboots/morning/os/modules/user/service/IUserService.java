package com.pussinboots.morning.os.modules.user.service;

import com.pussinboots.morning.os.modules.user.entity.User;
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
	
}
