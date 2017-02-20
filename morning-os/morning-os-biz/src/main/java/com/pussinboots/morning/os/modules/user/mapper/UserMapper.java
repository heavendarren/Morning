package com.pussinboots.morning.os.modules.user.mapper;

import com.pussinboots.morning.os.modules.user.entity.User;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：UserMapper   
* 类描述：User 表数据访问层接口           
* 创建人：陈星星   
* 创建时间：2017年2月20日 上午1:12:55    
*
 */
public interface UserMapper extends BaseMapper<User> {
	
	/**
	 * 根据登录名查找用户信息
	 * @param loginName 手机号码/邮箱
	 * @return User 
	 */
	User selectByLoginName(@Param("loginName") String loginName);

}