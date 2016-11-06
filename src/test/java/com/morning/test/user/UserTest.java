package com.morning.test.user;


import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.morning.service.system.SystemRoleService;
import com.morning.service.system.SystemUserService;
import com.morning.service.user.UserService;

@RunWith(SpringJUnit4ClassRunner.class)		//表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:spring/spring-context.xml", "classpath:spring/spring-context-mybatis.xml" })  
public class UserTest {
	
	private static Logger logger = LogManager.getLogger(UserTest.class.getName()); 

	
	@Resource
	private UserService userService;
	@Resource
	private SystemUserService systemUserService;
	@Resource
	private SystemRoleService systemRoleService;
	
    
    @Test  
    public void getTimestampTest() throws InterruptedException{  
        System.out.println("第一次调用：" + systemUserService.querySysUserByUserName("admin"));
        Thread.sleep(2000);
        System.out.println("2秒之后调用：" + systemUserService.querySysUserByUserName("admin"));
        Thread.sleep(11000);
        System.out.println("再过11秒之后调用：" + systemUserService.querySysUserByUserName("admin"));
    } 
}
