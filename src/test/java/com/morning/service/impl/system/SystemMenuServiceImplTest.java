package com.morning.service.impl.system;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.morning.entity.system.SystemMenu;
import com.morning.service.system.ISystemMenuService;
import com.morning.test.base.BaseTest;

public class SystemMenuServiceImplTest extends BaseTest {
	
	private static Logger logger = LoggerFactory.getLogger(SystemMenuServiceImplTest.class);

	@Autowired
	private ISystemMenuService systemMenuService;
	
	@Test
	public void testSelectCheckedMenus() {
		List<SystemMenu> systemMenus = systemMenuService.selectCheckedMenus(1);
		logger.info("systemMenus:{}",JSON.toJSON(systemMenus));
	}
	
	@Test
	public void testselectMenuList() {
		List<SystemMenu> systemMenus = systemMenuService.selectMenuList();
		logger.info("systemMenus:{}",JSON.toJSON(systemMenus));
	}
	
	@Test
	public void testdeleteMenu() {
		systemMenuService.deleteMenu(79);
	}

}
