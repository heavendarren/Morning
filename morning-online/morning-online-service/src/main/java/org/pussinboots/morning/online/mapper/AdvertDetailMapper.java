package org.pussinboots.morning.online.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.online.entity.AdvertDetail;
import com.baomidou.mybatisplus.mapper.BaseMapper;	

/**
 * 
* 项目名称：morning-online-service   
* 类名称：AdvertDetailMapper   
* 类描述：AdvertDetail / 广告位管理表 数据访问层接口   
* 创建人：陈星星   
* 创建时间：2017年4月10日 上午12:32:56   
*
 */
public interface AdvertDetailMapper extends BaseMapper<AdvertDetail> {
	
	/**
	 * 根据广告位ID/状态/显示数量/时间查找显示广告列表
	 * @param advertId 广告ID
	 * @param status 状态
	 * @param date 显示时间
	 * @param defultNumber 显示数量
	 * @return
	 */
	List<AdvertDetail> listByAdvertId(@Param("advertId") Long advertId, @Param("status") Integer status,
			@Param("defultNumber") Integer defultNumber, @Param("date") Date date);
	
	/**
	 * 根据广告ID/分页信息/搜索内容查找导航列表
	 * @param navigationId 广告ID
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @param page 分页实体
	 * @return
	 */
	List<AdvertDetail> listByPage(@Param("advertId") Long advertId, @Param("pageInfo") PageInfo pageInfo,
			@Param("search") String search, RowBounds rowBounds);
}