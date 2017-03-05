package com.pussinboots.morning.os.modules.product.service.impl;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.product.enums.ProductSortEnum;
import com.pussinboots.morning.os.modules.product.service.IProductCategoryService;
import com.pussinboots.morning.os.test.base.BaseTest;

public class ProductCategoryServiceImplTest extends BaseTest {
	
	@Autowired
	private IProductCategoryService productCategoryService;

	@Test
	public void testSelectProductVOs() {
		try {
			PageInfo pageInfo = new PageInfo();
			pageInfo.setPagesize(20);
			pageInfo.setSort(ProductSortEnum.SALES_ASC.getSort());
			pageInfo.setOrder(ProductSortEnum.SALES_ASC.getOrder());
			productCategoryService.selectProductVOs(9L, pageInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
