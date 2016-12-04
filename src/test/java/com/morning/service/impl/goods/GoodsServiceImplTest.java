package com.morning.service.impl.goods;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.morning.entity.goods.Goods;
import com.morning.service.goods.IGoodsService;
import com.morning.test.base.BaseTest;

public class GoodsServiceImplTest extends BaseTest{

	private static Logger LOGGER = LoggerFactory.getLogger(GoodsServiceImplTest.class);
	
	@Autowired
	private IGoodsService  goodsService;
	
	@Test
	public void testSelectGoodsByClassifyId() {
		List<Goods> goods = goodsService.selectGoodsByClassifyId(2);
		LOGGER.info("goods:{}", JSON.toJSON(goods));
		
	}

}
