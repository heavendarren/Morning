package com.morning.dao.goods;

import java.util.List;

import com.morning.entity.goods.GoodsClassify;

public interface GoodsClassifyMapper {
	
	/**
	 * 查询类目名称，通过ID
	 * @param classityId
	 * @return
	 */
	public GoodsClassify queryClassifyById(Integer classityId);
	
	/**
	 * 通过ID查询该类目商品
	 * @param classityId
	 * @return
	 */
	public GoodsClassify queryGoodsByClassify(Integer classityId); 
	
	/**
	 * 查询所有商品，根据类目分类
	 * @return
	 */
	public List<GoodsClassify> queryAllGoods();

}
