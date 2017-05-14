package org.pussinboots.morning.online.service;

import java.util.List;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.online.entity.NavigationBar;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-online-facade   
* 类名称：INavigationBarService   
* 类描述：NavigationBar / 导航栏表  业务逻辑层接口      
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午8:53:53   
*
 */
public interface INavigationBarService extends IService<NavigationBar> {
	
	/**
	 * 创建导航栏,更新导航中导航栏数量
	 * @param navigationBar 导航栏信息
	 * @param userName 操作人
	 * @return
	 */
	Integer insertNavigationBar(NavigationBar navigationBar, String userName);
	
	/**
	 * 根据导航ID查找显示导航栏
	 * @param navigationId 导航ID
	 * @return
	 */
	List<NavigationBar> listByNavigationId(Long navigationId);
	
	/**
	 * 根据导航ID/分页信息/搜索内容查找导航列表
	 * @param navigationId 导航ID
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @return
	 */
	BasePageDTO<NavigationBar> listByPage(Long navigationId, PageInfo pageInfo, String search);
	
	/**
	 * 更新导航栏状态
	 * @param navigationBarId 导航栏ID
	 * @return
	 */
	Integer updateStatus(Long navigationBarId);
	
	/**
	 * 更新导航栏信息
	 * @param navigationBar 导航栏信息
	 * @param userName 操作人
	 * @return
	 */
	Integer updateNavigationBar(NavigationBar navigationBar, String userName);
	
	/**
	 * 根据导航栏ID删除导航栏
	 * @param navigationBarId 导航栏ID
	 * @return
	 */
	Integer deleteByNavigationBarId(Long navigationBarId);
	
}
