package com.morning.service.goods;

import java.util.List;

import com.morning.entity.goods.GoodsPicture;

/**
 * 
 * @description：商品图片业务层接口
 * @author CXX
 * @version 创建时间：2016年8月26日  下午2:11:33
 */
public interface GoodsPictureService {
	
	/**
	 * 查询商品图片
	 * @param goodsPicture
	 * @return
	 */
	public List<GoodsPicture> queryPictureByGoods(GoodsPicture goodsPicture);

}
