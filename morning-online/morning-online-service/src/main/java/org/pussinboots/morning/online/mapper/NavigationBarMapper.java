package org.pussinboots.morning.online.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.online.entity.NavigationBar;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-online-service   
* 类名称：NavigationBarMapper   
* 类描述：NavigationBar / 导航栏表 数据访问层接口   
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午8:54:35   
*
 */
public interface NavigationBarMapper extends BaseMapper<NavigationBar> {
	
	/**
	 * 根据导航ID查找显示导航栏
	 * @param navigationId 导航ID
	 * @param status 导航状态
	 * @param showNumber 显示数量
	 * @return
	 */
	List<NavigationBar> listByNavigationId(@Param("navigationId") Long navigationId, @Param("status") Integer status,
			@Param("showNumber") Integer showNumber);
	
	/**
	 * 根据导航ID/分页信息/搜索内容查找导航列表
	 * @param navigationId 导航ID
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @param page 分页实体
	 * @return
	 */
	List<NavigationBar> listByPage(@Param("navigationId") Long navigationId, @Param("pageInfo") PageInfo pageInfo,
			@Param("search") String search, RowBounds rowBounds);

}