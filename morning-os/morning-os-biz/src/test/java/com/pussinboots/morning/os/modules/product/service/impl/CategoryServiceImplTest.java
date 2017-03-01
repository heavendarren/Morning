package com.pussinboots.morning.os.modules.product.service.impl;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.pussinboots.morning.os.modules.product.entity.Category;
import com.pussinboots.morning.os.modules.product.service.ICategoryService;
import com.pussinboots.morning.os.test.base.BaseTest;

public class CategoryServiceImplTest extends BaseTest {
	
	@Autowired
	private ICategoryService categoryService;

	@Test
	public void testSelectCategories() {
		List<Category> categories = categoryService.selectUpperCategories(31L, 1);
		logger.info("categories={}", JSON.toJSON(categories));
	}

}
