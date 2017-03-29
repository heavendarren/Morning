package com.pussinboots.morning.os.modules.user.service.impl;

import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.product.entity.Product;
import com.pussinboots.morning.os.modules.product.mapper.ProductMapper;
import com.pussinboots.morning.os.modules.product.vo.ProductVO;
import com.pussinboots.morning.os.modules.user.dto.FavoritePageDTO;
import com.pussinboots.morning.os.modules.user.entity.Favorite;
import com.pussinboots.morning.os.modules.user.mapper.FavoriteMapper;
import com.pussinboots.morning.os.modules.user.service.IFavoriteService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
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
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public void insertByProductNumber(Long userId, Long productNumber) {
		// 根据编号查找产品信息
		Product queryProduct = new Product();
		queryProduct.setProductNumber(productNumber);
		Product product = productMapper.selectOne(queryProduct);
		if (product != null) {
			Favorite queryFavorite = new Favorite();
			queryFavorite.setUserId(userId);
			queryFavorite.setProductId(product.getProductId());
			Favorite favorite = favoriteMappper.selectOne(queryFavorite);
			if (favorite != null) {
				// 如果收藏夹存在商品,则更新该商品
				favorite.setName(product.getName());
				favorite.setPicImg(product.getPicImg());
				favorite.setShowPrice(product.getShowPrice());
				favorite.setCreateTime(new Date());
				favorite.setCreateBy(userId.toString());
				favoriteMappper.updateById(favorite);
			} else {
				// 如果收藏夹不存在商品,则将该商品添加到收藏夹
				favorite = new Favorite();
				BeanUtils.copyProperties(product, favorite);
				favorite.setCreateTime(new Date());
				favorite.setCreateBy(userId.toString());
				favorite.setUserId(userId);
				favoriteMappper.insert(favorite);
			}
		} else {
			// TODO 声明一个产品不存在的异常
		}
	}

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
	public Favorite selectByProductNumber(Long userId, Long productNumber) {
		Favorite queryFavorite = new Favorite();
		queryFavorite.setUserId(userId);
		queryFavorite.setProductNumber(productNumber);
		return favoriteMappper.selectOne(queryFavorite);
	}

	@Override
	public void deleteByProductNumber(Long userId, Long productNumber) {
		Favorite favorite = new Favorite();
		favorite.setUserId(userId);
		favorite.setProductNumber(productNumber);
		favoriteMappper.delete(new EntityWrapper<Favorite>(favorite));
	}

}
