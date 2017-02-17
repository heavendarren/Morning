package com.pussinboots.morning.cms.modules.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.cms.modules.system.dto.VersionLogDTO;
import com.pussinboots.morning.cms.modules.system.entity.VersionLog;
import com.pussinboots.morning.cms.modules.system.mapper.VersionLogMapper;
import com.pussinboots.morning.cms.modules.system.service.IVersionLogService;
import com.pussinboots.morning.common.model.PageInfo;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：VersionLogServiceImpl   
* 类描述：VersionLog 表业务逻辑层接口实现类      
* 创建人：陈星星   
* 创建时间：2017年2月8日 下午6:14:28
 */
@Service
public class VersionLogServiceImpl extends ServiceImpl<VersionLogMapper, VersionLog> implements IVersionLogService {

	@Autowired
	private VersionLogMapper versionLogMapper;
	
	@Override
	public VersionLogDTO selectByPullPage(PageInfo pageInfo) {
		
		// 下拉分页
		Page<VersionLog> page = new Page<VersionLog>(1, pageInfo.getNowpage() * pageInfo.getPagesize());
        List<VersionLog> versionLogs = versionLogMapper.selectPage(page, new EntityWrapper<VersionLog>().orderBy("logId", false));
        
        pageInfo.setTotal(page.getTotal());
        
        VersionLogDTO versionLogDTO = new VersionLogDTO(versionLogs, pageInfo);
        
		return versionLogDTO;
	}
	
}
