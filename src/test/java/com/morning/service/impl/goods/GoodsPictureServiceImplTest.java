package com.morning.service.impl.goods;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.morning.entity.goods.GoodsPicture;
import com.morning.service.goods.IGoodsPictureService;
import com.morning.test.base.BaseTest;

public class GoodsPictureServiceImplTest extends BaseTest{
	
	private static Logger logger = LoggerFactory.getLogger(GoodsPictureServiceImplTest.class);

	@Autowired
	private IGoodsPictureService goodsPictureService;
	
	@Test
	public void testSelectGoodsPictures() {
		List<GoodsPicture> goodsPictures = goodsPictureService.selectGoodsPictures(1);
		logger.info("goodsPictures={}", JSON.toJSON(goodsPictures));
	}

}
