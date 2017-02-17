package com.pussinboots.morning.cms.modules.administrator.service.impl;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.pussinboots.morning.cms.modules.administrator.entity.User;
import com.pussinboots.morning.cms.modules.administrator.service.IUserService;
import com.pussinboots.morning.cms.test.base.BaseTest;

public class UserServiceImplTest extends BaseTest{
	
	@Autowired
	private IUserService userService;

	@Test
	public void testSelectByLoginName() {
		User user = userService.selectByLoginName("admin");
		System.out.println(JSON.toJSON(user));
	}

}
