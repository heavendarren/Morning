package com.morning.dao.system;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.morning.entity.system.SystemUserRole;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemUserRoleMapper   
* 类描述：SystemUserRole 表数据访问层接口   
* 创建人：陈星星   
* 创建时间：2016年11月13日 上午11:38:25   
* 修改人：陈星星   
* 修改时间：2016年11月13日 上午11:38:25   
* @version
 */
public interface SystemUserRoleMapper extends AutoMapper<SystemUserRole> {
	
	/**
	 * 通过账号ID查找角色列表
	 * @param accountId 账号Id
	 * @return List<SystemUserRole> 
	 */
	List<SystemUserRole> selectRoleListByAccountId(@Param("accountId") Integer accountId);
	
	/**
	 * 插入用户角色记录 
	 * @param systemUserRoles 角色列表
	 */
	void insertUserRoles(@Param("systemUserRoles") List<SystemUserRole> systemUserRoles);
}