package com.morning.service.system;

import java.util.List;

import com.morning.entity.system.SystemUser;
import com.morning.entity.user.QueryUser;
import com.baomidou.framework.service.ISuperService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：ISystemUserService   
* 类描述：SystemUser 表业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年11月12日 下午10:11:49   
* 修改人：陈星星   
* 修改时间：2016年11月12日 下午10:11:49   
* @version
 */
public interface ISystemUserService extends ISuperService<SystemUser> {
	
	/**
	 * 创建新的管理员
	 * @param systemUser 管理员信息
	 * @param roleIds 角色ID列表
	 */
	void insertSystemUser(SystemUser systemUser, String[] roleIds);

	/**
	 * 根据用户名查找管理员
	 * @param loginName 登录名
	 * @return SystemUser
	 */
	SystemUser selectByLoginName(String loginName);
	
	/**
	 * 查找所有管理员数量
	 * @return Integer null返回0
	 */
	Integer selectAllSystemUserNumber();
	
	/**
	 * 根据查找条件查找所有管理员
	 * @param queryUser 查询用户实体类 
	 * @return List<SystemUser> 
	 */
	List<SystemUser> selectAllSystemUser(QueryUser queryUser);
	
	/**
	 * 根据角色ID查找管理员
	 * @param roleId 角色ID
	 * @return List<SystemUser>
	 */
	List<SystemUser> selectSysUserByRoleId(Integer roleId);
	
	/**
	 * 查找用户名是否存在
	 * @param loginName 登录名
	 * @return true存在/false不存在
	 */
	boolean checkLoginName(String loginName);
	
	/**
	 * 更新用户登录日志
	 * @param accountId 用户ID
	 * @param ipAddr 当前IP地址
	 * @param browser 用户游览器型号
	 * @param operatingSystem 用户系统型号
	 */
	void updateLogByLoginName(Integer accountId, String ipAddr, String browser,
			String operatingSystem);
	
	/**
	 * 更新用户状态
	 * @param accountId 用户ID
	 * @param status 用户状态
	 */
	void updateUserStatus(Integer accountId, Integer status);
	
	/**
	 * 更新用户信息通过管理员
	 * @param systemUser 管理员信息
	 * @param roleIds 角色ID列表
	 */
	void updateUserInfoBySystem(SystemUser systemUser, String[] roleIds);
	
	/**
	 * 更新个人信息
	 * @param systemUser 管理员信息
	 */
	void updateUserInfo(SystemUser systemUser);
	
	/**
	 * 更新用户密码
	 * @param accountId 用户ID
	 * @param loginPassword 用户密码
	 */
	void updateUserPws(Integer accountId, String loginPassword);
	
	/**
	 * 删除用户，同时删除角色记录、登录日志
	 * @param accountId
	 */
	void deleteSysUser(Integer accountId);
}