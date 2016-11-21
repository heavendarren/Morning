package com.morning.service.impl.goods;


import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.morning.entity.PageInfo;
import com.morning.entity.goods.Goods;
import com.morning.entity.goods.QueryGoods;
import com.morning.service.goods.IGoodsService;
import com.morning.test.base.BaseTest;

public class GoodsServiceImplTest extends BaseTest {
	
	@Autowired
	private IGoodsService goodsService;

	@Test
	public void testSelectGoodsList() {
		List<Goods> goods = goodsService.selectGoodsList(10, "goodsPrice", 1);
		System.out.println(JSON.toJSON(goods));
	}
	
	@Test
	public void testSelectGoodsListByPage() {
		QueryGoods queryGoods = new QueryGoods();
		PageInfo pageInfo = new PageInfo();
		List<Goods> goods = goodsService.selectGoodsListByPage(queryGoods, pageInfo);
		System.out.println(JSON.toJSON(goods));
	}
	
	@Test
	public void testSelectGoodsByGoodsId() {
		Goods goods = goodsService.selectGoodsByGoodsId(1);
		System.out.println(JSON.toJSON(goods));
	}
	
	@Test
	public void testUpdateGoodsViewCount() {
		goodsService.updateGoodsViewCount(1);
	}
	
	@Test
	public void testSelectAllGoodsNumber() {
		int i = goodsService.selectAllGoodsNumber(null);
		int a = goodsService.selectAllGoodsNumber(0);
		System.out.println(i);
		System.out.println(a);
	}

}
