package com.pussinboots.morning.os.modules.content.service;

import com.pussinboots.morning.os.modules.content.entity.NavigationBar;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：INavigationBarService   
* 类描述：NavigationBar表 / 导航栏表 业务逻辑层接口     
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午11:16:37   
*
 */
public interface INavigationBarService extends IService<NavigationBar> {
	
	/**
	 * 根据导航类型和导航状态查找导航类列
	 * @param type 导航类型
	 * @param status 导航状态
	 * @return List<NavigationBar>
	 */
	List<NavigationBar> selectNavigationBarByType(Integer type, Integer status);
}
