package org.pussinboots.morning.administrator.service.impl;

import java.util.List;

import org.pussinboots.morning.administrator.entity.UserLoginLog;
import org.pussinboots.morning.administrator.mapper.UserLoginLogMapper;
import org.pussinboots.morning.administrator.service.IUserLoginLogService;
import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-administrator-service   
* 类名称：UserLoginLogServiceImpl   
* 类描述：UserLoginLog / 管理员登陆表 业务逻辑层接口实现      
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午6:05:35   
*
 */
@Service
public class UserLoginLogServiceImpl extends ServiceImpl<UserLoginLogMapper, UserLoginLog> implements IUserLoginLogService {
	
	@Autowired
	private UserLoginLogMapper userLoginLogMapper;

	@Override
	public BasePageDTO<UserLoginLog> listByUserId(Long userId, PageInfo pageInfo, String search) {
		Page<UserLoginLog> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());
		List<UserLoginLog> userLoginLogs = userLoginLogMapper.listByPage(userId, pageInfo, search, page);
		pageInfo.setTotal(page.getTotal());
		return new BasePageDTO<UserLoginLog>(pageInfo, userLoginLogs);
	}
}
