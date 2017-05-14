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
import org.pussinboots.morning.online.service.IAdvertDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-online-service   
* 类名称：AdvertDetailServiceImpl   
* 类描述：AdvertDetail / 广告位管理表 业务逻辑层接口实现      
* 创建人：陈星星   
* 创建时间：2017年4月10日 上午12:34:39   
*
 */
@Service
public class AdvertDetailServiceImpl extends ServiceImpl<AdvertDetailMapper, AdvertDetail> implements IAdvertDetailService {
	
	@Autowired
	private AdvertDetailMapper advertDetailMapper;
	@Autowired
	private AdvertMapper advertMapper;
	
	@Override
	public Integer insertAdvertDetail(AdvertDetail advertDetail, String userName) {
		// 创建导航栏
		advertDetail.setCreateBy(userName);
		advertDetail.setCreateTime(new Date());
		Integer count = advertDetailMapper.insert(advertDetail);

		// 更新导航中导航栏数量
		advertMapper.updateNumber(advertDetail.getAdvertId());
		return count;
	}

	@Override
	public List<AdvertDetail> listByAdvertId(Long advertId) {
		// 根据ID和状态查找广告位
		Advert queryAdvert = new Advert();
		queryAdvert.setAdvertId(advertId);
		queryAdvert.setStatus(StatusEnum.SHOW.getStatus());
		Advert advert = advertMapper.selectOne(queryAdvert);

		if (advert != null) {
			// 根据广告位ID/状态/显示数量查找广告列表
			return advertDetailMapper.listByAdvertId(advert.getAdvertId(), StatusEnum.SHOW.getStatus(), advert.getDefultNumber(),
					new Date());
		}
		return null;
	}

	@Override
	public BasePageDTO<AdvertDetail> listByPage(Long advertId, PageInfo pageInfo, String search) {
		Page<AdvertDetail> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());
		List<AdvertDetail> advertDetails = advertDetailMapper.listByPage(advertId, pageInfo, search, page);
		pageInfo.setTotal(page.getTotal());
		return new BasePageDTO<AdvertDetail>(pageInfo, advertDetails);
	}

	@Override
	public Integer updateStatus(Long advertDetailId) {
		AdvertDetail AdvertDetail = advertDetailMapper.selectById(advertDetailId);

		if (AdvertDetail != null && StatusEnum.SHOW.getStatus().equals(AdvertDetail.getStatus())) {
			AdvertDetail updateAdvertDetail = new AdvertDetail();
			updateAdvertDetail.setAdvertDetailId(advertDetailId);
			updateAdvertDetail.setStatus(StatusEnum.HIDDEN.getStatus());
			return advertDetailMapper.updateById(updateAdvertDetail);
		} else if (AdvertDetail != null && StatusEnum.HIDDEN.getStatus().equals(AdvertDetail.getStatus())) {
			AdvertDetail updateAdvertDetail = new AdvertDetail();
			updateAdvertDetail.setAdvertDetailId(advertDetailId);
			updateAdvertDetail.setStatus(StatusEnum.SHOW.getStatus());
			return advertDetailMapper.updateById(updateAdvertDetail);
		}
		return null;
	}

	@Override
	public Integer updateNavigationBar(AdvertDetail advertDetail, String userName) {
		advertDetail.setUpdateBy(userName);
		advertDetail.setUpdateTime(new Date());
		return advertDetailMapper.updateById(advertDetail);
	}

	@Override
	public Integer deleteByadvertDetailId(Long advertDetailId) {
		AdvertDetail advertDetail = advertDetailMapper.selectById(advertDetailId);
		if (advertDetail != null) {
			Integer count = advertDetailMapper.deleteById(advertDetailId);

			// 更新导航中导航栏数量
			advertMapper.updateNumber(advertDetail.getAdvertId());
			return count;
		}
		return null;
	}
}
