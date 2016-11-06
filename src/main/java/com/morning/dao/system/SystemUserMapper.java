package com.morning.dao.system;

import java.util.List;
import java.util.Map;

import com.morning.entity.system.SystemUser;
import com.morning.entity.system.SystemUserRole;
import com.morning.entity.user.QueryUser;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemUserMapper   
* 类描述：后台管理员数据访问层接口   
* 创建人：陈星星   
* 创建时间：2016年9月14日  下午3:03:47  
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:38:24   
* @version
 */
public interface SystemUserMapper {
	
	/**
	 * 查询登录用户
	 * @param systemUser
	 * @return
	 */
	public  SystemUser queryLoginUser(SystemUser systemUser);
	
	/**
	 * 查询用户名是否存在
	 * @param loginName
	 * @return
	 */
	public Integer checkLoginName(String loginName);
	
	/***
	 * 修改用户登录最后登录时间和IP
	 * @param parameter
	 */
	public void updateUserLoginLog(Map<String,Object> parameter);
	
	/**
	 * 更新管理员密码
	 * @param systemUser
	 */
	public void updateUserPws(SystemUser systemUser);
	
	/**
	 * 更新管理员信息
	 * @param systemUser
	 */
	public void updateUserInfo(SystemUser systemUser);
	
	/**
	 * 通过ID，查询用户实体信息
	 * @param accountId
	 * @return
	 */
	public  SystemUser querySysUserByUserId(Integer accountId);
	
	/**
	 * 根据角色，查询用户列表
	 * @param roleId 角色编号
	 * @return
	 */
	public List<SystemUser> querySysUsersByRole(Integer roleId);
	
	/**
	 * 通过账户，查询用户实体信息
	 * @param loginName
	 * @return
	 */
	public SystemUser querySysUserByUserName(String loginName);
	
	/**
	 * 查询管理员数量
	 * @return int sysUserNumber
	 */
	public int querySysUserNumber();
	
	/**
	 * 查询管理员列表
	 * @param queryUser
	 * @return
	 */
	public List<SystemUser> querySysUserList(QueryUser queryUser);
	
	/**
	 * 冻结或解冻用户
	 * @param user
	 */
	public void updateSysUserStates(SystemUser systemUser);
	
	/**
	 * 删除用户 
	 * @param accountId
	 */
	public void deleteSysUser(Integer accountId);
	
	/**
	 * 删除用户角色表中，用户记录
	 * @param accountId
	 */
	public void deleteSysUserRole(Integer accountId);
	
	/**
	 * 创建用户
	 * @param systemUser
	 */
	public int createsystemUser(SystemUser systemUser);
	
	/**
	 * 批量插入用户角色记录
	 * @param systemUserRoles
	 */
	public void  createUserRole(List<SystemUserRole> systemUserRoles);
}
