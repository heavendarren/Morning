package com.pussinboots.morning.os.modules.product.service.impl;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.pussinboots.morning.os.modules.product.service.IKindService;
import com.pussinboots.morning.os.modules.product.service.IProductSpecificationService;
import com.pussinboots.morning.os.modules.product.vo.KindVO;
import com.pussinboots.morning.os.test.base.BaseTest;

public class ProductSpecificationServiceImplTest extends BaseTest{

	@Autowired
	private IProductSpecificationService productSpecificationService;
	@Autowired
	private IKindService kindService;
	
	@Test
	public void testSelectByProductId() {
		
		try {
			List<KindVO> kindVOs = kindService.selectByProductId(1L, 1);
			Map<String, Object> productSpecificationVOs = productSpecificationService.selectByProductId(1L, 1, kindVOs);
			System.out.println(JSON.toJSON(productSpecificationVOs));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
