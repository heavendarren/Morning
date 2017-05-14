package org.pussinboots.morning.online.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.online.entity.Advert;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-online-service   
* 类名称：AdvertMapper   
* 类描述：Advert / 广告位表 数据访问层接口
* 创建人：陈星星   
* 创建时间：2017年4月10日 上午12:32:25   
*
 */
public interface AdvertMapper extends BaseMapper<Advert> {
	
	/**
	 * 根据分页信息/搜索内容查找广告列表
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @param page 分页实体
	 * @return
	 */
	List<Advert> listByPage(@Param("pageInfo") PageInfo pageInfo, @Param("search") String search, RowBounds rowBounds);

	/**
	 * 更新广告位广告数量
	 * @param advertId 广告位ID
	 * @return
	 */
	Integer updateNumber(@Param("advertId") Long advertId);
}