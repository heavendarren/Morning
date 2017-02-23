package com.pussinboots.morning.os.modules.content.service.impl;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.pussinboots.morning.os.modules.content.entity.NavigationBar;
import com.pussinboots.morning.os.modules.content.service.INavigationBarService;
import com.pussinboots.morning.os.test.base.BaseTest;

public class NavigationBarServiceImplTest extends BaseTest {
	
	@Autowired
	private INavigationBarService navigationBarService;

	@Test
	public void testSelectNavigationBarByType() {
		List<NavigationBar> indexTop = navigationBarService.selectNavigationBarByType(
				1, 1);
		logger.info("indexTop={}", JSON.toJSON(indexTop));
	}

}
