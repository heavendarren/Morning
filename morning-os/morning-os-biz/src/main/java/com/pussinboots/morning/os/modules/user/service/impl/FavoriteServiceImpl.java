package com.pussinboots.morning.os.modules.user.service.impl;

import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.product.vo.ProductVO;
import com.pussinboots.morning.os.modules.user.dto.FavoritePageDTO;
import com.pussinboots.morning.os.modules.user.entity.Favorite;
import com.pussinboots.morning.os.modules.user.mapper.FavoriteMapper;
import com.pussinboots.morning.os.modules.user.service.IFavoriteService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：FavoriteServiceImpl   
* 类描述：Favorite表 / 收藏夹表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年3月15日 下午11:09:17
*
 */
@Service
public class FavoriteServiceImpl extends ServiceImpl<FavoriteMapper, Favorite> implements IFavoriteService {
	
	@Autowired
	private FavoriteMapper favoriteMappper;

	@Override
	public FavoritePageDTO selectFavorites(Long userId, PageInfo pageInfo, Integer status) {
		Page<ProductVO> page = new Page<>(pageInfo.getNowpage(), pageInfo.getPagesize());

		Favorite favorite = new Favorite();
		favorite.setUserId(userId);
		favorite.setStatus(status);
		List<Favorite> favorites = favoriteMappper.selectPage(page,
				new EntityWrapper<Favorite>(favorite).orderBy("createTime", false));

		pageInfo.setTotal(page.getTotal());

		return new FavoritePageDTO(pageInfo, favorites);
	}

	@Override
	public void deleteByProductNumber(Long userId, Long productNumber) {
		Favorite favorite = new Favorite();
		favorite.setUserId(userId);
		favorite.setProductNumber(productNumber);
		favoriteMappper.delete(new EntityWrapper<Favorite>(favorite));
	}
}
