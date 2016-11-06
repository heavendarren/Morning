package com.morning.test.menu;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.morning.entity.system.SystemMenu;
import com.morning.entity.system.SystemRole;
import com.morning.service.system.SystemMenuService;
import com.morning.service.system.SystemRoleService;

@RunWith(SpringJUnit4ClassRunner.class)		//表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:spring/spring-context.xml", "classpath:spring/spring-context-mybatis.xml" }) 
public class SystemMenuTest {
	
	private static final Logger logger = LoggerFactory.getLogger(SystemMenuTest.class);
	
	@Resource
	private SystemMenuService systemMenuService;
	
	@Resource
	private SystemRoleService systemRoleService;
	
//	@Test
//	public void test(){
//		List<SystemMenu> systemMenuList = systemMenuService.querySysMenu(1, "menu");
//		
//		List<SystemMenu> systemMenus = systemMenuService.handleMenu(systemMenuList);
//		logger.info(systemMenus);
//	}
	
	@Test
	public void test(){
		List<SystemRole> systemRoles = systemRoleService.queryRoleByUserId(1);
		StringBuffer role = new StringBuffer();
		List<Integer> roleList = new ArrayList<Integer>();
		for (SystemRole systemRole : systemRoles) {
			roleList.add(systemRole.getRoleId());
			role.append(systemRole.getRoleName());
			role.append("&nbsp");
		}
		
		List<SystemMenu> systemMenus = new ArrayList<SystemMenu>();
		for(Integer roleId : roleList){
			List<SystemMenu> systemMenuList = systemMenuService.querySysMenuByRoleId(roleId);
			systemMenus.addAll(systemMenuList);
		}
	}
}
