package com.pussinboots.morning.cms.modules.administrator.service;

import java.util.List;

import com.pussinboots.morning.cms.common.security.AuthorizingUser;
import com.pussinboots.morning.cms.modules.administrator.entity.Organization;
import com.pussinboots.morning.cms.modules.administrator.vo.OrganizationVO;
import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-cms-facade   
* 类名称：IOrganizationService   
* 类描述：Organization 表业务逻辑层接口  
* 创建人：陈星星   
* 创建时间：2017年2月17日 上午12:08:28
 */
public interface IOrganizationService extends IService<Organization> {
	
	/**
	 * 创建组织
	 * @param organization 组织信息
	 * @param authorizingUser 当前管理员信息
	 */
	void insertOrganization(Organization organization, AuthorizingUser authorizingUser);
	
	/**
	 * 查找所有组织
	 * @return
	 */
	List<Organization> selectOrganizations();
	
	/**
	 * 查找组织及其组织人员
	 * @return
	 */
	List<OrganizationVO> selectOrganizationsDetail();
	
	/**
	 * 根据组织状态查找组织列表
	 * @param status 组织状态
	 * @return
	 */
	List<Organization> selectOrganizations(Integer status);
	
	/**
	 * 更新组织信息
	 * @param organization 组织信息
	 * @param authorizingUser 当前管理员信息
	 */
	void updateOrganization(Organization organization, AuthorizingUser authorizingUser);
	
	/**
	 * 更新组织状态
	 * @param organizationId 组织ID
	 * @param status 组织状态
	 */
	void updateOrganizationStatus(Long organizationId, Integer status);
	
	/**
	 * 根据组织ID删除组织，同时重置用户表组织ID
	 * @param organizationId
	 */
	void deleteOrganization(Long organizationId);
	
}
