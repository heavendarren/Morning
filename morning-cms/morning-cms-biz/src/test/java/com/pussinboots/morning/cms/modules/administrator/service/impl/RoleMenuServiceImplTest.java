package com.pussinboots.morning.cms.modules.administrator.service.impl;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.pussinboots.morning.cms.common.security.AuthorizingUser;
import com.pussinboots.morning.cms.modules.administrator.service.IRoleMenuService;
import com.pussinboots.morning.cms.modules.administrator.vo.RoleMenuVO;
import com.pussinboots.morning.cms.test.base.BaseTest;

public class RoleMenuServiceImplTest extends BaseTest {
	
	@Autowired
	private IRoleMenuService roleMenuService;

	@Test
	public void testSelectCheckedMenus() {
		try {
			List<RoleMenuVO> menuVOs = roleMenuService.selectCheckedMenus(1L, 1);
			logger.info("menuVOs={}",JSON.toJSON(menuVOs));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testSelectMenusByAdmin () {
		try {
			AuthorizingUser authorizingUser = new AuthorizingUser();
			authorizingUser.setUserId(1L);
			List<RoleMenuVO>  roleMenuVOs = roleMenuService.selectMenusByAdmin(authorizingUser);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
