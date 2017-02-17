package com.pussinboots.morning.cms.modules.administrator.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.pussinboots.morning.cms.modules.administrator.entity.UserLoginLog;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：UserLoginLogMapper   
* 类描述：UserLoginLog 表数据访问层接口     
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:43:21
 */
public interface UserLoginLogMapper extends BaseMapper<UserLoginLog> {
	
	/**
	 * 根据用户ID查找用户日志
	 * @param userId 用户ID
	 * @return List<UserLoginLog>
	 */
	List<UserLoginLog> selectUserLoginLog(@Param("userId") Long userId);

}