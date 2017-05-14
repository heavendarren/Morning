package org.pussinboots.morning.system.service.impl;

import java.util.List;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.system.entity.VersionLog;
import org.pussinboots.morning.system.mapper.VersionLogMapper;
import org.pussinboots.morning.system.service.IVersionLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-system-service   
* 类名称：VersionLogServiceImpl   
* 类描述：VersionLog / 系统日志表 业务逻辑层接口实现    
* 创建人：陈星星   
* 创建时间：2017年4月7日 下午2:15:58   
*
 */
@Service
public class VersionLogServiceImpl extends ServiceImpl<VersionLogMapper, VersionLog> implements IVersionLogService {
	
	@Autowired
	private VersionLogMapper versionLogMapper;

	@Override
	public BasePageDTO<VersionLog> listByPullPage(PageInfo pageInfo) {
		// 下拉分页
		Page<VersionLog> page = new Page<>(1, pageInfo.getCurrent() * pageInfo.getLimit());
		List<VersionLog> versionLogs = versionLogMapper.selectPage(page,
				new EntityWrapper<VersionLog>().orderBy("logId", false));

		pageInfo.setTotal(page.getTotal());

		return new BasePageDTO<VersionLog>(pageInfo, versionLogs);
	}
}
