package org.pussinboots.morning.online.service.impl;

import java.util.Date;
import java.util.List;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.online.entity.Navigation;
import org.pussinboots.morning.online.entity.NavigationBar;
import org.pussinboots.morning.online.mapper.NavigationBarMapper;
import org.pussinboots.morning.online.mapper.NavigationMapper;
import org.pussinboots.morning.online.service.INavigationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-online-service   
* 类名称：NavigationServiceImpl   
* 类描述：Navigation / 导航表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午8:55:44   
*
 */
@Service
public class NavigationServiceImpl extends ServiceImpl<NavigationMapper, Navigation> implements INavigationService {
	
	@Autowired
	private NavigationMapper navigationMapper;
	@Autowired
	private NavigationBarMapper navigationBarMapper;
	
	@Override
	public Integer insertNavigation(Navigation navigation, String userName) {
		navigation.setCreateBy(userName);
		navigation.setCreateTime(new Date());
		return navigationMapper.insert(navigation);
	}

	@Override
	public BasePageDTO<Navigation> listByPage(PageInfo pageInfo, String search) {
		Page<Navigation> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());
		List<Navigation> navigations = navigationMapper.listByPage(pageInfo, search, page);
		pageInfo.setTotal(page.getTotal());
		return new BasePageDTO<Navigation>(pageInfo, navigations);
	}

	@Override
	public Integer updateStatus(Long navigationId) {
		Navigation navigation = navigationMapper.selectById(navigationId);

		if (navigation != null && StatusEnum.SHOW.getStatus().equals(navigation.getStatus())) {
			Navigation updateNavigation = new Navigation();
			updateNavigation.setNavigationId(navigationId);
			updateNavigation.setStatus(StatusEnum.HIDDEN.getStatus());
			return navigationMapper.updateById(updateNavigation);
		} else if (navigation != null && StatusEnum.HIDDEN.getStatus().equals(navigation.getStatus())) {
			Navigation updateNavigation = new Navigation();
			updateNavigation.setNavigationId(navigationId);
			updateNavigation.setStatus(StatusEnum.SHOW.getStatus());
			return navigationMapper.updateById(updateNavigation);
		}
		return null;
	}
	
	@Override
	public Integer updateNavigation(Navigation navigation, String userName) {
		navigation.setUpdateBy(userName);
		navigation.setUpdateTime(new Date());
		return navigationMapper.updateById(navigation);
	}

	@Override
	public Integer deleteByNavigationId(Long navigationId) {
		// 根据导航ID删除导航下导航栏
		NavigationBar navigationBar = new NavigationBar();
		navigationBar.setNavigationId(navigationId);
		navigationBarMapper.delete(new EntityWrapper<NavigationBar>(navigationBar));

		// 删除导航
		return navigationMapper.deleteById(navigationId);
	}
}
