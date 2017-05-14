package org.pussinboots.morning.online.service.impl;

import java.util.Date;
import java.util.List;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.online.entity.Advert;
import org.pussinboots.morning.online.entity.AdvertDetail;
import org.pussinboots.morning.online.mapper.AdvertDetailMapper;
import org.pussinboots.morning.online.mapper.AdvertMapper;
import org.pussinboots.morning.online.service.IAdvertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-online-service   
* 类名称：AdvertServiceImpl   
* 类描述：Advert / 广告位表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年4月10日 上午12:34:08   
*
 */
@Service
public class AdvertServiceImpl extends ServiceImpl<AdvertMapper, Advert> implements IAdvertService {
	
	@Autowired
	private AdvertMapper advertMapper;
	@Autowired
	private AdvertDetailMapper advertDetailMapper;
	
	@Override
	public Integer insertAdvert(Advert advert, String userName) {
		advert.setCreateBy(userName);
		advert.setCreateTime(new Date());
		return advertMapper.insert(advert);
	}

	@Override
	public BasePageDTO<Advert> listByPage(PageInfo pageInfo, String search) {
		Page<Advert> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());
		List<Advert> adverts = advertMapper.listByPage(pageInfo, search, page);
		pageInfo.setTotal(page.getTotal());
		return new BasePageDTO<Advert>(pageInfo, adverts);
	}

	@Override
	public Integer updateStatus(Long advertId) {
		Advert advert = advertMapper.selectById(advertId);

		if (advert != null && StatusEnum.SHOW.getStatus().equals(advert.getStatus())) {
			Advert updateAdvert = new Advert();
			updateAdvert.setAdvertId(advert.getAdvertId());
			updateAdvert.setStatus(StatusEnum.HIDDEN.getStatus());
			return advertMapper.updateById(updateAdvert);
		} else if (advert != null && StatusEnum.HIDDEN.getStatus().equals(advert.getStatus())) {
			Advert updateAdvert = new Advert();
			updateAdvert.setAdvertId(advert.getAdvertId());
			updateAdvert.setStatus(StatusEnum.SHOW.getStatus());
			return advertMapper.updateById(updateAdvert);
		}
		return null;
	}
	
	@Override
	public Integer updateAdvert(Advert advert, String userName) {
		advert.setUpdateBy(userName);
		advert.setUpdateTime(new Date());
		return advertMapper.updateById(advert);
	}

	@Override
	public Integer deleteByAdvertId(Long advertId) {
		// 根据广告ID删除广告位下广告详情
		AdvertDetail advertDetail = new AdvertDetail();
		advertDetail.setAdvertId(advertId);
		advertDetailMapper.delete(new EntityWrapper<AdvertDetail>(advertDetail));

		// 删除导航
		return advertMapper.deleteById(advertId);
	}

}
