package org.pussinboots.morning.system.service;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.system.entity.VersionLog;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-system-facade   
* 类名称：IVersionLogService   
* 类描述：VersionLog / 系统日志表 业务逻辑层接口      
* 创建人：陈星星   
* 创建时间：2017年4月7日 下午2:14:49   
*
 */
public interface IVersionLogService extends IService<VersionLog> {
	
	/**
	 * 根据分页信息查找版本日志列表
	 * @param pageInfo 分页信息
	 * @return
	 */
	BasePageDTO<VersionLog> listByPullPage(PageInfo pageInfo);
	
}
