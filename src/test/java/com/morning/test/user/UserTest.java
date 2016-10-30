package com.morning.test.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.morning.entity.system.SystemRole;
import com.morning.entity.system.SystemUser;
import com.morning.entity.system.SystemUserRole;
import com.morning.entity.user.User;
import com.morning.service.system.SystemRoleService;
import com.morning.service.system.SystemUserService;
import com.morning.service.user.UserService;
import com.morning.test.statistics.StatisticsDayTest;

@RunWith(SpringJUnit4ClassRunner.class)		//表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:spring/spring-context.xml", "classpath:spring/spring-context-mybatis.xml" })  
public class UserTest {
	
	private static final Logger logger = Logger.getLogger(StatisticsDayTest.class);
	
	@Resource
	private UserService userService;
	@Resource
	private SystemUserService systemUserService;
	@Resource
	private SystemRoleService systemRoleService;
	
//	@Test
//	public void test(){
//		User user = new User();
//		user.setAccountId(137);
//		user.setStatus(1);
//		userService.updateUserStates(user);
//	}
	
	@Test
	public void test(){
		try {
			List<SystemUser> systemUsers = systemUserService.querySysUsersByRole(1);
			logger.info(JSON.toJSON(systemUsers));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
