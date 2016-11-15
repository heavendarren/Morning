package com.morning.service.system;

import java.util.List;

import com.baomidou.framework.service.ISuperService;
import com.morning.entity.system.SystemUserLoginLog;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：ISystemUserLoginLogService   
* 类描述：SystemUserLoginLog 表业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年11月12日 下午11:40:30   
* 修改人：陈星星   
* 修改时间：2016年11月12日 下午11:40:30   
* @version
 */
public interface ISystemUserLoginLogService extends ISuperService<SystemUserLoginLog> {
	
	/**
	 * 根据用户ID查询用户登录日志
	 * @param userId 用户ID
	 * @return List<SystemUserLoginLog>
	 */
	List<SystemUserLoginLog> selectUserLoginLog(Integer userId);


}