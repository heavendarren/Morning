package org.pussinboots.morning.online.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.online.entity.Navigation;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-online-service   
* 类名称：NavigationMapper   
* 类描述：Navigation / 导航表 数据访问层接口      
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午8:55:16   
*
 */
public interface NavigationMapper extends BaseMapper<Navigation> {
	
	/**
	 * 根据分页信息/搜索内容查找导航列表
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @param page 分页实体
	 * @return
	 */
	List<Navigation> listByPage(@Param("pageInfo") PageInfo pageInfo, @Param("search") String search, RowBounds rowBounds);
	
	/**
	 * 根据导航ID更新导航中导航栏数量
	 * @param navigationId 导航ID
	 * @return
	 */
	Integer updateNumber(@Param("navigationId") Long navigationId);
}