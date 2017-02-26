package com.pussinboots.morning.os.modules.content.service;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.os.modules.content.entity.Advert;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IAdvertService   
* 类描述：Advert表 / 广告位表 业务逻辑层接口     
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午11:16:37   
*
 */
public interface IAdvertService extends IService<Advert> {
	
	/**
	 * 根据广告位代码查找广告位
	 * @param code 代码简称
	 * @return Advert 
	 */
	Advert selectAdvertByCode(String code);
	
}
