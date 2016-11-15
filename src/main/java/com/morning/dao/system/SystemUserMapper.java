package com.morning.dao.system;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.morning.entity.system.SystemUser;
import com.morning.entity.user.QueryUser;
import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemUserMapper   
* 类描述：SystemUser 表数据访问层接口   
* 创建人：陈星星   
* 创建时间：2016年11月12日 下午10:13:08   
* 修改人：陈星星   
* 修改时间：2016年11月12日 下午10:13:08   
* @version
 */
public interface SystemUserMapper extends AutoMapper<SystemUser> {
	
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
	List<SystemUser> selectSysUserByRoleId(@Param("roleId") Integer roleId);
	
	/**
	 * 更新用户信息
	 * @param systemUser 用户信息
	 */
	void updateUserInfo(SystemUser systemUser);
	
}