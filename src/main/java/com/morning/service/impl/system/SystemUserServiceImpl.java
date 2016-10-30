package com.morning.service.impl.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.common.util.MD5Utils;
import com.morning.dao.system.SystemUserMapper;
import com.morning.entity.system.SystemUser;
import com.morning.entity.system.SystemUserRole;
import com.morning.entity.user.QueryUser;
import com.morning.service.system.SystemUserService;

/**
 * 
 * @description：后台管理员业务层实现
 * @author CXX
 * @version 创建时间：2016年9月14日  下午3:07:53
 */
@Service("systemUserService")
@Transactional
public class SystemUserServiceImpl implements SystemUserService {
	
	private static final Logger logger = Logger.getLogger(SystemUserServiceImpl.class);
	
	@Autowired
	private SystemUserMapper systemUserMapper;

	@Override
	public SystemUser queryLoginUser(SystemUser systemUser) {
		return systemUserMapper.queryLoginUser(systemUser);
	}
	
	@Override
	public boolean checkLoginName(String loginName) {
		int count = systemUserMapper.checkLoginName(loginName);
		if(count>0){
			return true;
		}
		return false;
	}

	@Override
	public void updateUserLoginLog(Integer accountId, Date lastLoginTime,
			String lastLoginIp) {
		Map<String,Object> parameter = new HashMap<String, Object>();
		parameter.put("accountId", accountId);
		parameter.put("lastLoginTime", lastLoginTime);
		parameter.put("lastLoginIp", lastLoginIp);
		systemUserMapper.updateUserLoginLog(parameter);
	}
	
	@Override
	public void updateUserPws(SystemUser systemUser) {
		systemUserMapper.updateUserPws(systemUser);
	}
	
	@Override
	public void updateUserInfo(SystemUser systemUser) {
		systemUserMapper.updateUserInfo(systemUser);
	}
	
	@Override
	public SystemUser querySysUserByUserId(Integer accountId) {
		return systemUserMapper.querySysUserByUserId(accountId);
	}
	
	@Override
	public List<SystemUser> querySysUsersByRole(Integer roleId) {
		return systemUserMapper.querySysUsersByRole(roleId);
	}

	@Override
	public SystemUser querySysUserByUserName(String loginName) {
		return systemUserMapper.querySysUserByUserName(loginName);
	}
	
	@Override
	public int querySysUserNumber() {
		return systemUserMapper.querySysUserNumber();
	}
	
	@Override
	public List<SystemUser> querySysUserList(QueryUser queryUser) {
		return systemUserMapper.querySysUserList(queryUser);
	}
	
	@Override
	public void updateSysUserStates(SystemUser systemUser) {
		systemUserMapper.updateSysUserStates(systemUser);
	}

	@Override
	public void deleteSysUserRole(Integer accountId) {
		systemUserMapper.deleteSysUserRole(accountId);	
	}
	
	@Override
	public void deleteSysUser(Integer accountId) {
		deleteSysUserRole(accountId);
		systemUserMapper.deleteSysUser(accountId);
	}
	
	@Override
	public int createsystemUser(SystemUser systemUser) {
		SystemUser sysUser = getSystemUser();
		systemUser.setLoginPassword(MD5Utils.getMD5(systemUser.getLoginPassword()));
		systemUser.setCreateBy(sysUser.getUserName());
		systemUser.setCreateTime(new Date());
		return systemUserMapper.createsystemUser(systemUser);
	}
	
	@Override
	public void createUserRole(String[] roleIds ,Integer accountId) {
		List<SystemUserRole> systemUserRoles = new ArrayList<SystemUserRole>();
		for(int i = 0; i<roleIds.length; i++){
			SystemUserRole systemUserRole = new SystemUserRole();
			systemUserRole.setAccountId(accountId);
			systemUserRole.setCreateTime(new Date());
			systemUserRole.setRoleId(Integer.valueOf(roleIds[i]).intValue());
			systemUserRole.setCreateBy(getSystemUser().getUserName());
			systemUserRoles.add(systemUserRole);
		}
		systemUserMapper.createUserRole(systemUserRoles);
	}
	
	@Override
	public void updateSystemUserRole(SystemUser systemUser, String[] roleIds) {
		SystemUser sysUser = this.getSystemUser();
		systemUser.setUpdateBy(sysUser.getUserName());
		systemUser.setUpdateTime(new Date());
		this.updateUserInfo(systemUser);
		this.deleteSysUserRole(systemUser.getAccountId());
		this.createUserRole(roleIds, systemUser.getAccountId());
	}
	
	@Override
	public void createSystemUserRole(SystemUser systemUser, String[] roleIds) {
		this.createsystemUser(systemUser);
		this.createUserRole(roleIds, systemUser.getAccountId());
	}

	@Override
	public SystemUser getSystemUser(){
		try{
			Subject subject = SecurityUtils.getSubject();
			SystemUser systemUser = (SystemUser)subject.getPrincipal();
			if (systemUser != null){
				return systemUser;
			}
		}catch (UnavailableSecurityManagerException e) {
			logger.error("SystemUserServiceImpl.getSystemUser", e);
		}catch (InvalidSessionException e){
			logger.error("SystemUserServiceImpl.getSystemUser", e);
		}
		return null;
	}

}
