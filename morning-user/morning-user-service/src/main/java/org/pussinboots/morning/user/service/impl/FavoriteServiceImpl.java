package org.pussinboots.morning.user.service.impl;

import java.util.List;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.user.entity.Favorite;
import org.pussinboots.morning.user.mapper.FavoriteMapper;
import org.pussinboots.morning.user.service.IFavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-user-service   
* 类名称：FavoriteServiceImpl   
* 类描述：Favorite / 收藏夹 业务逻辑层接口实现    
* 创建人：陈星星   
* 创建时间：2017年5月9日 下午7:58:20   
*
 */
@Service
public class FavoriteServiceImpl extends ServiceImpl<FavoriteMapper, Favorite> implements IFavoriteService {
	
	@Autowired
	private FavoriteMapper favoriteMappper;

	@Override
	public BasePageDTO<Favorite> listByUserId(Long userId, PageInfo pageInfo) {

		Page<Favorite> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());

		Favorite favorite = new Favorite();
		favorite.setUserId(userId);
		List<Favorite> favorites = favoriteMappper.selectPage(page,
				new EntityWrapper<Favorite>(favorite).orderBy("createTime", false));
		pageInfo.setTotal(page.getTotal());

		return new BasePageDTO<Favorite>(pageInfo, favorites);
	}

	@Override
	public Integer deleteByProductNumber(Long userId, Long productNumber) {
		Favorite favorite = new Favorite();
		favorite.setUserId(userId);
		favorite.setProductNumber(productNumber);
		return favoriteMappper.delete(new EntityWrapper<Favorite>(favorite));
	}
}
