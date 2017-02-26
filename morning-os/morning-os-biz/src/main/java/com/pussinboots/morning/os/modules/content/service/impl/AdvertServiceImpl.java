package com.pussinboots.morning.os.modules.content.service.impl;

import com.pussinboots.morning.os.modules.content.entity.Advert;
import com.pussinboots.morning.os.modules.content.mapper.AdvertMapper;
import com.pussinboots.morning.os.modules.content.service.IAdvertService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：AdvertServiceImpl   
* 类描述：Advert表 / 广告位表  业务逻辑层接口实现类         
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:48:15   
*
 */
@Service
public class AdvertServiceImpl extends ServiceImpl<AdvertMapper, Advert> implements IAdvertService {

	@Autowired
	private AdvertMapper advertMapper;
	
	@Override
	public Advert selectAdvertByCode(String code) {
		Advert advert = new Advert();
		advert.setCode(code);
		return advertMapper.selectOne(advert);
	}
	
}
