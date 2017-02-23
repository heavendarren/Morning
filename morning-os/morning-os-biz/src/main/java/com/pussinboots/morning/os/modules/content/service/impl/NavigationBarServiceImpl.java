package com.pussinboots.morning.os.modules.content.service.impl;

import com.pussinboots.morning.os.modules.content.entity.NavigationBar;
import com.pussinboots.morning.os.modules.content.mapper.NavigationBarMapper;
import com.pussinboots.morning.os.modules.content.service.INavigationBarService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：NavigationBarServiceImpl   
* 类描述：NavigationBar表 / 导航栏表   业务逻辑层接口实现类         
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:48:15   
*
 */
@Service
public class NavigationBarServiceImpl extends ServiceImpl<NavigationBarMapper, NavigationBar> implements INavigationBarService {
	
	@Autowired
	private NavigationBarMapper navigationBarMapper;
	
	@Override
	public List<NavigationBar> selectNavigationBarByType(Integer type, Integer status) {
		NavigationBar navigationBar = new NavigationBar();
		navigationBar.setType(type);
		navigationBar.setStatus(status);
		return navigationBarMapper.selectList(new EntityWrapper<NavigationBar>(navigationBar));
	}
	
}
