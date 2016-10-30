package com.morning.dao.goods;

import java.util.List;

import com.morning.entity.goods.GoodsPicture;

/**
 * 
 * @description：商品图片持久层接口
 * @author CXX
 * @version 创建时间：2016年8月26日  下午2:08:56
 */
public interface GoodsPictureMapper {
	
	/**
	 * 查询商品图片
	 * @param goodsPicture
	 * @return
	 */
	public List<GoodsPicture> queryPictureByGoods(GoodsPicture goodsPicture);

}
