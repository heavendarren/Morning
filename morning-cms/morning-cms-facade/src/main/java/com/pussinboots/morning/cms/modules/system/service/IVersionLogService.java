package com.pussinboots.morning.cms.modules.system.service;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.cms.modules.system.dto.VersionLogDTO;
import com.pussinboots.morning.cms.modules.system.entity.VersionLog;
import com.pussinboots.morning.common.model.PageInfo;

/**
 * 
* 项目名称：morning-cms-facade   
* 类名称：IVersionLogService   
* 类描述：VersionLog 表业务逻辑层接口     
* 创建人：陈星星   
* 创建时间：2017年2月8日 下午6:08:27
 */
public interface IVersionLogService extends IService<VersionLog> {
	
	VersionLogDTO selectByPullPage(PageInfo pageInfo);
}
