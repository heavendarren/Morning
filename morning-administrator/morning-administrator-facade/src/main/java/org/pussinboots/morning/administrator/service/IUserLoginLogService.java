package org.pussinboots.morning.administrator.service;

import org.pussinboots.morning.administrator.entity.UserLoginLog;
import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-administrator-facade   
* 类名称：IUserLoginLogService   
* 类描述：UserLoginLog / 管理员登陆表 业务逻辑层接口         
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午5:47:24   
*
 */
public interface IUserLoginLogService extends IService<UserLoginLog> {
	
	/**
	 * 根据管理员ID查找管理员登录日志列表
	 * @param userId 管理员ID
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @return
	 */
	BasePageDTO<UserLoginLog> listByUserId(Long userId, PageInfo pageInfo, String search);
}
