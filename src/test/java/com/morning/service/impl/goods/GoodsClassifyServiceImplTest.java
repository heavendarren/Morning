package com.morning.service.impl.goods;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.morning.entity.goods.GoodsClassify;
import com.morning.service.goods.IGoodsClassifyService;
import com.morning.test.base.BaseTest;

public class GoodsClassifyServiceImplTest extends BaseTest{
	
	private static Logger logger = LoggerFactory.getLogger(GoodsClassifyServiceImplTest.class);
	
	@Autowired
	private IGoodsClassifyService goodsClassifyService;

	@Test
	public void testSelectNavClassify() {
		List<GoodsClassify> classifies = goodsClassifyService.selectNavClassify(5);
		logger.info("classifies={}", JSON.toJSON(classifies));
	}
	
	@Test
	public void testSelectGoodsClassify() {
		GoodsClassify goodsClassify = goodsClassifyService.selectGoodsClassifyById(1);
		logger.info("goodsClassify={}", JSON.toJSON(goodsClassify));
	}
	
	@Test
	public void testSelectClassifieAndNumber() {
		List<GoodsClassify> goodsClassifies = goodsClassifyService.selectClassifieAndNumber();
		System.out.println(JSON.toJSON(goodsClassifies));
	}
	
	

}
