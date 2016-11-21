package com.morning.service.impl.goods;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.morning.entity.goods.GoodsPicture;
import com.morning.service.goods.IGoodsPictureService;
import com.morning.test.base.BaseTest;

public class GoodsPictureServiceImplTest extends BaseTest{

	@Autowired
	private IGoodsPictureService goodsPictureService;
	
	@Test
	public void testSelectGoodsPictures() {
		List<GoodsPicture> goodsPictures = goodsPictureService.selectGoodsPictures(1);
		System.out.println(JSON.toJSON(goodsPictures));
	}

}
