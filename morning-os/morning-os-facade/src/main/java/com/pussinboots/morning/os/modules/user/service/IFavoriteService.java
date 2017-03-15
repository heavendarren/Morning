package com.pussinboots.morning.os.modules.user.service;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.user.dto.FavoritePageDTO;
import com.pussinboots.morning.os.modules.user.entity.Favorite;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IFavoriteService   
* 类描述：Favorite表 / 收藏夹表 业务逻辑层接口     
* 创建人：陈星星   
* 创建时间：2017年3月15日 下午11:08:47   
*
 */
public interface IFavoriteService extends IService<Favorite> {
	
	/**
	 * 根据用户ID、分页信息、商品状态查找用户收藏夹商品列表
	 * @param userId 用户ID
	 * @param pageInfo 分页信息
	 * @param status 商品状态
	 * @return FavoritePageDTO
	 */
	FavoritePageDTO selectFavorites(Long userId, PageInfo pageInfo, Integer status);
	
	/**
	 * 根据用户ID和商品编号删除收藏夹商品
	 * @param userId 用户ID
	 * @param productNumber 收藏夹商品编号
	 */
	void deleteByProductNumber(Long userId, Long productNumber);
	
}
