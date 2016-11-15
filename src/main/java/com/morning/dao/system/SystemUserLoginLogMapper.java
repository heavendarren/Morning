package com.morning.dao.system;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.morning.entity.system.SystemUserLoginLog;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemUserLoginLogMapper   
* 类描述：SystemUserLoginLog 表数据访问层接口   
* 创建人：陈星星   
* 创建时间：2016年11月12日 下午11:41:21   
* 修改人：陈星星   
* 修改时间：2016年11月12日 下午11:41:21   
* @version
 */
public interface SystemUserLoginLogMapper extends AutoMapper<SystemUserLoginLog> {

	/**
	 * 根据用户ID查找用户日志
	 * @param userId 用户ID
	 * @return List<SystemUserLoginLog> 
	 */
	List<SystemUserLoginLog> selectUserLoginLog(@Param("userId") Integer userId);

}