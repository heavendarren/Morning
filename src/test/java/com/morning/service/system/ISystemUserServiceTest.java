package com.morning.service.system;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.morning.entity.system.SystemUser;
import com.morning.entity.system.SystemUserLoginLog;
import com.morning.entity.user.QueryUser;
import com.morning.test.base.BaseTest;

public class ISystemUserServiceTest extends BaseTest{
	
	private static Logger logger = LoggerFactory.getLogger(ISystemUserServiceTest.class);
	
	@Autowired
	private ISystemUserService iSystemUserService;
	@Autowired
	private ISystemUserLoginLogService systemUserLoginLogService;
	
	@Test
	public void testSelectByLoginName() {
		SystemUser user  =iSystemUserService.selectByLoginName("admin");
		logger.info("user={}", JSON.toJSON(user));
	}

	@Test
	public void testSelectAllSystemUserNumber() {
		int number = iSystemUserService.selectAllSystemUserNumber();
		logger.info("number={}", number);
	}

	@Test
	public void testSelectAllSystemUser() {
		QueryUser queryUser = new QueryUser();
		queryUser.setSearchContent("");
		List<SystemUser> systemUsers = iSystemUserService.selectAllSystemUser(queryUser);
		logger.info("systemUsers={}", JSON.toJSON(systemUsers));
	}

	@Test
	public void testUpdateLogByLoginName() {
		iSystemUserService.updateLogByLoginName(1, "136.445.157.1", "360安全","windows");
	}
	
	
	@Test
	public void testdeleteSysUser(){
		iSystemUserService.deleteSysUser(9);
	}
	
	@Test
	public void testSelectUserLoginLog(){
		List<SystemUserLoginLog> loginLogs = systemUserLoginLogService.selectUserLoginLog(2);
		logger.info("loginLogs={}", JSON.toJSON(loginLogs));
	}
	
	@Test
	public void testselectSysUserByRoleId(){
		List<SystemUser> systemUsers = iSystemUserService.selectSysUserByRoleId(1);
		logger.info("systemUsers={}", JSON.toJSON(systemUsers));
	}
}
