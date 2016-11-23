package com.morning.service.impl.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.morning.common.util.MD5Utils;
import com.morning.common.util.SingletonLoginUtils;
import com.morning.dao.system.SystemUserLoginLogMapper;
import com.morning.dao.system.SystemUserMapper;
import com.morning.dao.system.SystemUserRoleMapper;
import com.morning.entity.system.SystemUser;
import com.morning.entity.system.SystemUserLoginLog;
import com.morning.entity.system.SystemUserRole;
import com.morning.entity.user.QueryUser;
import com.morning.service.system.ISystemUserService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemUserServiceImpl   
* 类描述：SystemUser 表业务逻辑层接口实现类   
* 创建人：陈星星   
* 创建时间：2016年11月12日 下午10:12:17   
* 修改人：陈星星   
* 修改时间：2016年11月12日 下午10:12:17   
* @version
 */
@Service
public class SystemUserServiceImpl extends SuperServiceImpl<SystemUserMapper, SystemUser> implements ISystemUserService {

	@Autowired
	private SystemUserMapper systemUserMapper;
	@Autowired
	private SystemUserLoginLogMapper systemUserLoginLogMapper;
	@Autowired 
	private SystemUserRoleMapper systemUserRoleMapper;
	
	@Override
	public void insertSystemUser(SystemUser systemUser, String[] roleIds) {
		systemUser.setLoginPassword(MD5Utils.getMD5(systemUser.getLoginPassword()));
		systemUser.setCreateBy(SingletonLoginUtils.getSystemUserName());
		systemUser.setCreateTime(new Date());
		this.insertSelective(systemUser);//插入用户
		
		if (roleIds != null && roleIds.length > 0) {
			List<SystemUserRole> systemUserRoles = new ArrayList<>();
			for(int i = 0; i<roleIds.length; i++){
				SystemUserRole systemUserRole = new SystemUserRole();
				systemUserRole.setAccountId(systemUser.getAccountId());
				systemUserRole.setCreateTime(new Date());
				systemUserRole.setRoleId(Integer.valueOf(roleIds[i]));
				systemUserRole.setCreateBy(SingletonLoginUtils.getSystemUserName());
				systemUserRoles.add(systemUserRole);
			}
			systemUserRoleMapper.insertUserRoles(systemUserRoles);//插入角色列表
		}
	}
	
	@Override
//	@Cacheable(value="userCache",key="'systemUser'+#loginName")
	public SystemUser selectByLoginName(String loginName) {
		SystemUser systemUser = new SystemUser();
		systemUser.setLoginName(loginName);
		return systemUserMapper.selectOne(systemUser);
	}
	
	@Override
	public Integer selectAllSystemUserNumber() {
		return systemUserMapper.selectCount(null);
	}
	
	@Override
	public List<SystemUser> selectAllSystemUser(QueryUser queryUser) {
		return systemUserMapper.selectAllSystemUser(queryUser);
	}
	
	@Override
	public List<SystemUser> selectSysUserByRoleId(Integer roleId) {
		return systemUserMapper.selectSysUserByRoleId(roleId);
	}
	
	@Override
	public boolean checkLoginName(String loginName) {
		SystemUser systemUser = new SystemUser();
		systemUser.setLoginName(loginName);
		int count = systemUserMapper.selectCount(systemUser);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	@Transactional
//	@CacheEvict(value="userCache",key="'sysUserLog'+#accountId")
	public void updateLogByLoginName(Integer accountId, String ipAddr,
			String browser, String operatingSystem) {
		//更新systemUser表用户登录信息
		SystemUser systemUser = new SystemUser();
		systemUser.setAccountId(accountId);
		systemUser.setLastLoginTime(new Date());
		systemUser.setLastLoginIp(ipAddr);
		systemUserMapper.updateSelectiveById(systemUser);
		//创建用户登录日志
		SystemUserLoginLog systemUserLoginLog = new SystemUserLoginLog();
		systemUserLoginLog.setUserId(accountId);
		systemUserLoginLog.setUserIp(ipAddr);
		systemUserLoginLog.setBrowser(browser);
		systemUserLoginLog.setOperatingSystem(operatingSystem);
		systemUserLoginLog.setLoginTime(new Date());
		systemUserLoginLogMapper.insertSelective(systemUserLoginLog);
	}

	@Override
	public void updateUserStatus(Integer accountId, Integer status) {
		SystemUser systemUser = new SystemUser();
		systemUser.setAccountId(accountId);
		systemUser.setStatus(status);
		systemUser.setUpdateTime(new Date());
		systemUser.setUserName(SingletonLoginUtils.getSystemUserName());
		systemUserMapper.updateSelectiveById(systemUser);
	}
	
	@Override
	public void updateUserInfoBySystem(SystemUser systemUser, String[] roleIds) {
		systemUser.setUpdateTime(new Date());
		systemUser.setUpdateBy(SingletonLoginUtils.getSystemUserName());
		systemUserMapper.updateUserInfo(systemUser);//更新用户信息
		//删除SystemUserLoginLog 表用户记录
		SystemUserRole userRole = new SystemUserRole();
		userRole.setAccountId(systemUser.getAccountId());
		systemUserRoleMapper.deleteSelective(userRole);
		//插入SystemUserLoginLog 表用户记录
		
		if (roleIds != null && roleIds.length > 0) {
			List<SystemUserRole> systemUserRoles = new ArrayList<>();
			for(int i = 0; i<roleIds.length; i++){
				SystemUserRole systemUserRole = new SystemUserRole();
				systemUserRole.setAccountId(systemUser.getAccountId());
				systemUserRole.setCreateTime(new Date());
				systemUserRole.setRoleId(Integer.valueOf(roleIds[i]));
				systemUserRole.setCreateBy(SingletonLoginUtils.getSystemUserName());
				systemUserRoles.add(systemUserRole);
			}
			systemUserRoleMapper.insertUserRoles(systemUserRoles);//插入角色列表
		}
	}
	
	@Override
	public void updateUserInfo(SystemUser systemUser) {
		systemUser.setUpdateTime(new Date());
		systemUser.setUpdateBy(SingletonLoginUtils.getSystemUserName());
		systemUserMapper.updateSelectiveById(systemUser);//更新用户信息
	}
	
	@Override
	public void updateUserPws(Integer accountId, String loginPassword) {
		SystemUser systemUser = new SystemUser();
		systemUser.setAccountId(accountId);
		systemUser.setLoginPassword(MD5Utils.getMD5(loginPassword));
		systemUserMapper.updateSelectiveById(systemUser);
	}

	@Override
	public void deleteSysUser(Integer accountId) {
		//删除SystemUser 表信息
		systemUserMapper.deleteById(Long.valueOf(accountId));
		//删除SystemUserLoginLog 表用户记录
		SystemUserLoginLog loginLog = new SystemUserLoginLog();
		loginLog.setUserId(accountId);
		systemUserLoginLogMapper.deleteSelective(loginLog);
		//删除 SystemUserRoleMapper 表用户角色记录
		SystemUserRole userRole = new SystemUserRole();
		userRole.setAccountId(accountId);
		systemUserRoleMapper.deleteSelective(userRole);
	}

}