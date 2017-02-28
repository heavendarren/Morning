package com.pussinboots.morning.os.modules.product.service.impl;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.pussinboots.morning.os.modules.product.service.ICategoryService;
import com.pussinboots.morning.os.modules.product.vo.CategoryVO;
import com.pussinboots.morning.os.test.base.BaseTest;

public class CategoryServiceImplTest extends BaseTest {
	
	@Autowired
	private ICategoryService categoryService;

	@Test
	public void testSelectProductsByCategory() {
		 try {
			List<CategoryVO> categoryVOs = categoryService.selectProductsByCategory(3L, 8);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
