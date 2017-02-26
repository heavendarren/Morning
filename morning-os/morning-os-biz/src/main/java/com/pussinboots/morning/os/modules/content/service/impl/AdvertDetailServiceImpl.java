package com.pussinboots.morning.os.modules.content.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.os.modules.content.entity.Advert;
import com.pussinboots.morning.os.modules.content.entity.AdvertDetail;
import com.pussinboots.morning.os.modules.content.mapper.AdvertDetailMapper;
import com.pussinboots.morning.os.modules.content.mapper.AdvertMapper;
import com.pussinboots.morning.os.modules.content.service.IAdvertDetailService;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：AdvertDetailServiceImpl   
* 类描述：AdvertDetail表 / 广告位管理表   业务逻辑层接口实现类      
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午11:20:30   
*
 */
@Service
public class AdvertDetailServiceImpl extends ServiceImpl<AdvertDetailMapper, AdvertDetail> implements IAdvertDetailService {
	
	@Autowired
	private AdvertDetailMapper advertDetailMapper;
	@Autowired
	private AdvertMapper advertMapper;

	@Override
	public List<AdvertDetail> selectByAdvertCode(String code, Integer status) {
		Advert queryadvert = new Advert();
		queryadvert.setCode(code);
		Advert advert = advertMapper.selectOne(queryadvert);
		return advertDetailMapper.selectByStatus(advert.getAdvertId(), advert.getDefultNumber(), status);
	}
}
