package com.pussinboots.morning.cms.modules.administrator.service.impl;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.pussinboots.morning.cms.modules.administrator.entity.User;
import com.pussinboots.morning.cms.modules.administrator.service.IUserService;
import com.pussinboots.morning.cms.test.base.BaseTest;

public class UserServiceImplTest extends BaseTest {

	@Autowired
	private IUserService userService;
	
	@Test
	public void testSelectByUserId() {
		User user = userService.selectById(1L);
	}

}
