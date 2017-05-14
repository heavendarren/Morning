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
import org.pussinboots.morning.online.service.INavigationBarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-online-service   
* 类名称：NavigationBarServiceImpl   
* 类描述：NavigationBar / 导航栏表  业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午8:56:04   
*
 */
@Service
public class NavigationBarServiceImpl extends ServiceImpl<NavigationBarMapper, NavigationBar> implements INavigationBarService {
	
	@Autowired
	private NavigationMapper navigationMapper;
	@Autowired 
	private NavigationBarMapper navigationBarMapper;
	
	@Override
	public Integer insertNavigationBar(NavigationBar navigationBar, String userName) {
		// 创建导航栏
		navigationBar.setCreateBy(userName);
		navigationBar.setCreateTime(new Date());
		Integer count = navigationBarMapper.insert(navigationBar);

		// 更新导航中导航栏数量
		navigationMapper.updateNumber(navigationBar.getNavigationId());
		return count;
	}

	@Override
	public List<NavigationBar> listByNavigationId(Long navigationId) {
		// 根据导航ID查找导航
		Navigation queryNavigation = new Navigation();
		queryNavigation.setNavigationId(navigationId);
		queryNavigation.setStatus(StatusEnum.SHOW.getStatus());
		Navigation navigation = navigationMapper.selectOne(queryNavigation);

		if (navigation != null) {
			return navigationBarMapper.listByNavigationId(navigationId, StatusEnum.SHOW.getStatus(),
					navigation.getShowNumber());
		}
		return null;
	}

	@Override
	public BasePageDTO<NavigationBar> listByPage(Long navigationId, PageInfo pageInfo, String search) {
		Page<NavigationBar> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());
		List<NavigationBar> navigationBars = navigationBarMapper.listByPage(navigationId, pageInfo, search, page);
		pageInfo.setTotal(page.getTotal());
		return new BasePageDTO<NavigationBar>(pageInfo, navigationBars);
	}

	@Override
	public Integer updateStatus(Long navigationBarId) {
		NavigationBar navigationBar = navigationBarMapper.selectById(navigationBarId);

		if (navigationBar != null && StatusEnum.SHOW.getStatus().equals(navigationBar.getStatus())) {
			NavigationBar updateNavigationBar = new NavigationBar();
			updateNavigationBar.setNavigationBarId(navigationBarId);
			updateNavigationBar.setStatus(StatusEnum.HIDDEN.getStatus());
			return navigationBarMapper.updateById(updateNavigationBar);
		} else if (navigationBar != null && StatusEnum.HIDDEN.getStatus().equals(navigationBar.getStatus())) {
			NavigationBar updateNavigationBar = new NavigationBar();
			updateNavigationBar.setNavigationBarId(navigationBarId);
			updateNavigationBar.setStatus(StatusEnum.SHOW.getStatus());
			return navigationBarMapper.updateById(updateNavigationBar);
		}
		return null;
	}

	@Override
	public Integer updateNavigationBar(NavigationBar navigationBar, String userName) {
		navigationBar.setUpdateBy(userName);
		navigationBar.setUpdateTime(new Date());
		return navigationBarMapper.updateById(navigationBar);
	}

	@Override
	public Integer deleteByNavigationBarId(Long navigationBarId) {

		NavigationBar navigationBar = navigationBarMapper.selectById(navigationBarId);
		if (navigationBar != null) {
			Integer count = navigationBarMapper.deleteById(navigationBarId);

			// 更新导航中导航栏数量
			navigationMapper.updateNumber(navigationBar.getNavigationId());
			return count;
		}
		return null;
	}

}
