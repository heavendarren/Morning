package com.pussinboots.morning.os.modules.content.service;

import com.pussinboots.morning.os.modules.content.entity.AdvertDetail;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IAdvertDetailService   
* 类描述：AdvertDetail表 / 广告位管理表 业务逻辑层接口     
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午11:16:37   
*
 */
public interface IAdvertDetailService extends IService<AdvertDetail> {
	
	/**
	 * 根据广告位代码标记和广告状态查找广告列表
	 * @param code 广告位代码标记
	 * @param status 广告状态
	 * @return List<AdvertDetail>
	 */
	List<AdvertDetail> selectByAdvertCode(String code, Integer status);
	
}
