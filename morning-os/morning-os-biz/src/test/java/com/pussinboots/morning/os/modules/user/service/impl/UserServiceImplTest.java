package com.pussinboots.morning.os.modules.user.service.impl;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.pussinboots.morning.os.modules.user.service.IUserService;
import com.pussinboots.morning.os.test.base.BaseTest;

public class UserServiceImplTest extends BaseTest{
	
	@Autowired
	private IUserService userService;

	@Test
	public void testCheckEmail() {
		System.out.println(userService.checkEmail("810170512@qq.com"));
	}

}
