package com.morning.service.impl.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.goods.GoodsClassifyMapper;
import com.morning.entity.goods.GoodsClassify;
import com.morning.service.goods.GoodsClassifyService;

/**
 * 
 * @description：商品类别业务层实现
 * @author CXX
 * @version 创建时间：2016年8月26日  下午2:13:57
 */
@Service("goodsClassifyService")
public class GoodsClassifyServiceImpl implements GoodsClassifyService {
	
	@Autowired
	private GoodsClassifyMapper goodsClassifyMapper;
	
	@Override
	public GoodsClassify queryClassifyById(Integer classityId) {
		return goodsClassifyMapper.queryClassifyById(classityId);
	}

	@Override
	public GoodsClassify queryGoodsByClassify(Integer classityId) {
		return goodsClassifyMapper.queryGoodsByClassify(classityId);
	}

	@Override
	public List<GoodsClassify> queryAllGoods() {
		return goodsClassifyMapper.queryAllGoods();
	}
	
}
