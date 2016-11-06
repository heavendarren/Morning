package com.morning.service.impl.system;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.morning.common.util.ServletUtils;
import com.morning.dao.system.SystemUserLoginLogMapper;
import com.morning.entity.system.SystemUser;
import com.morning.entity.system.SystemUserLoginLog;
import com.morning.service.system.SystemUserLoginLogService;

import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemUserLoginLogSerivceImpl   
* 类描述：后台管理员登陆日志业务逻辑层实现   
* 创建人：陈星星   
* 创建时间：2016年9月14日  下午3:20:26
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午11:01:20   
* @version
 */
@Service("systemUserLoginLogSerivce")
public class SystemUserLoginLogSerivceImpl implements SystemUserLoginLogService {

	@Autowired	
	private SystemUserLoginLogMapper systemUserLoginLogMapper;
	
	@Override
	public void createLoginLog(SystemUserLoginLog systemUserLoginLog) {
		systemUserLoginLogMapper.createLoginLog(systemUserLoginLog);
	}

	@Override
	@Cacheable(value="userCache",key="'sysUserLog'+#accountId")
	public List<SystemUserLoginLog> querySysUserLoginLog(Integer accountId) {
		return systemUserLoginLogMapper.querySysUserLoginLog(accountId);
	}
	
	@Override
	@CacheEvict(value="userCache",key="'sysUserLog'+#systemUser.accountId")
	public void saveLoginLog(SystemUser systemUser){
		//添加登录记录
		UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
		Browser browser = userAgent.getBrowser(); 
		OperatingSystem operatingSystem = userAgent.getOperatingSystem();
		SystemUserLoginLog systemUserLoginLog = new SystemUserLoginLog();
		systemUserLoginLog.setUserId(systemUser.getAccountId());//用户ID
		systemUserLoginLog.setBrowser(browser.toString());//游览器
		systemUserLoginLog.setOperatingSystem(operatingSystem.toString());//系统
		systemUserLoginLog.setUserIp(ServletUtils.getIpAddr(ServletUtils.getRequest()));//登录Ip
		systemUserLoginLog.setLoginTime(new Date());
		//保存登录日志
		createLoginLog(systemUserLoginLog);
	}
}
