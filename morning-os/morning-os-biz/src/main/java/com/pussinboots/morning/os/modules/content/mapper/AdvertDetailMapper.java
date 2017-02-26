package com.pussinboots.morning.os.modules.content.mapper;

import com.pussinboots.morning.os.modules.content.entity.AdvertDetail;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：AdvertDetailMapper   
* 类描述：AdvertDetail表 / 广告位管理表 数据访问层接口   
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午11:19:29   
*
 */
public interface AdvertDetailMapper extends BaseMapper<AdvertDetail> {
	
	/**
	 * 根据广告默认数量和广告状态查找广告列表
	 * @param advertId 广告位ID
	 * @param defultNumber 默认数量
	 * @param status 广告状态
	 * @return List<AdvertDetail>
	 */
	List<AdvertDetail> selectByStatus(@Param("advertId") Long advertId, @Param("defultNumber") Integer defultNumber,@Param("status") Integer status);

}