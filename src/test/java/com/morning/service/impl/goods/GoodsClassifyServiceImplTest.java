package com.morning.service.impl.goods;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.morning.entity.goods.GoodsClassify;
import com.morning.service.goods.IGoodsClassifyService;
import com.morning.test.base.BaseTest;

public class GoodsClassifyServiceImplTest extends BaseTest{
	
	@Autowired
	private IGoodsClassifyService goodsClassifyService;

	@Test
	public void testSelectNavClassify() {
		List<GoodsClassify> classifies = goodsClassifyService.selectNavClassify(5);
		System.out.println(JSON.toJSON(classifies));
	}
	
	@Test
	public void testSelectGoodsClassify() {
		GoodsClassify goodsClassify = goodsClassifyService.selectGoodsClassifyById(1);
		System.out.println(JSON.toJSON(goodsClassify));
	}
	
	

}
