package com.morning.service.system;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.morning.entity.system.SystemMenu;
import com.morning.entity.system.SystemRole;
import com.morning.test.base.BaseTest;

public class ISystemUserRoleServiceTest extends BaseTest{
	
	private static Logger logger = LoggerFactory.getLogger(ISystemUserRoleServiceTest.class);

	@Autowired
	private ISystemUserRoleService systemUserRoleService;
	
	@Autowired
	private ISystemRoleMenuService systemRoleMenuService;
	
	@Autowired
	private ISystemMenuService systemMenuService;
	
	@Autowired
	private ISystemRoleService systemRoleService;
	
	@Test
	public void testselectSystemMenu(){
		List<SystemMenu> menus = systemMenuService.selectSystemMenu();
		logger.info("menus={}", JSON.toJSON(menus));
	}
	
	@Test
	public void testselectRoleAndNumber(){
		List<SystemRole> roles = systemRoleService.selectRoleList();
		logger.info("roles={}", JSON.toJSON(roles));
	}
	
	@Test
	public void testselectMenu() {
		List<SystemMenu> systemMenus = systemMenuService.selectMenus();
		logger.info("menus={}", JSON.toJSON(systemMenus));
	}
}
