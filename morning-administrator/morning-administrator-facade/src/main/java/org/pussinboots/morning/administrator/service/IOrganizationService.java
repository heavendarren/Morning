package org.pussinboots.morning.administrator.service;

import java.util.List;

import org.pussinboots.morning.administrator.entity.Organization;
import org.pussinboots.morning.administrator.pojo.vo.OrganizationVO;
import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-administrator-facade   
* 类名称：IOrganizationService   
* 类描述：Organization / 组织表 业务逻辑层接口                  
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午5:48:31   
*
 */
public interface IOrganizationService extends IService<Organization> {
	
	/**
	 * 创建组织
	 * @param organization 组织信息
	 * @param userName 操作人
	 * @return
	 */
	Integer insertOrganization(Organization organization, String userName);
	
	/**
	 * 根据组织状态查找组织列表
	 * @param status 组织状态
	 * @return List<Organization>
	 */ 
	List<Organization> listBySataus(Integer status);
	
	/**
	 * 根据分页信息/搜索内容查找组织列表
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @return
	 */
	BasePageDTO<Organization> listByPage(PageInfo pageInfo, String search);
	
	/**
	 * 查找组织及其组织人员
	 * @return
	 */
	List<OrganizationVO> listOrganizationsDetail();
	
	/**
	 * 更新组织状态
	 * @param organizationId 组织ID
	 * @return
	 */
	Integer updateStatus(Long organizationId);
	
	/**
	 * 更新组织信息
	 * @param organization 组织信息
	 * @param userName 操作人
	 * @return
	 */
	Integer updateOrganization(Organization organization, String userName);
	
	/**
	 * 根据组织ID删除组织信息,同时重置用户表组织ID
	 * @param organizationId
	 * @return
	 */
	Integer deleteByOrganizationId(Long organizationId);
}
