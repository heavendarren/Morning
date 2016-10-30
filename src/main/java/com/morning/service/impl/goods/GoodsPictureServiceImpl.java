package com.morning.service.impl.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.goods.GoodsPictureMapper;
import com.morning.entity.goods.GoodsPicture;
import com.morning.service.goods.GoodsPictureService;

/**
 * 
 * @description：商品图片业务层实现
 * @author CXX
 * @version 创建时间：2016年8月26日  下午2:13:23
 */
@Service("goodsPictureService")
public class GoodsPictureServiceImpl implements GoodsPictureService {
	
	@Autowired
	private GoodsPictureMapper goodsPictureMapper;

	@Override
	public List<GoodsPicture> queryPictureByGoods(GoodsPicture goodsPicture) {
		return goodsPictureMapper.queryPictureByGoods(goodsPicture);
	}

}
