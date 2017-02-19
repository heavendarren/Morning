package com.pussinboots.morning.cms.modules.administrator.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.cms.common.security.AuthorizingUser;
import com.pussinboots.morning.cms.modules.administrator.entity.Organization;
import com.pussinboots.morning.cms.modules.administrator.entity.User;
import com.pussinboots.morning.cms.modules.administrator.mapper.OrganizationMapper;
import com.pussinboots.morning.cms.modules.administrator.mapper.UserMapper;
import com.pussinboots.morning.cms.modules.administrator.service.IOrganizationService;
import com.pussinboots.morning.cms.modules.administrator.vo.OrganizationVO;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：OrganizationServiceImpl   
* 类描述：Organization 表业务逻辑层接口实现类     
* 创建人：陈星星   
* 创建时间：2017年2月17日 上午12:09:12
 */
@Service
public class OrganizationServiceImpl extends ServiceImpl<OrganizationMapper, Organization> implements IOrganizationService {
	
	@Autowired
	private OrganizationMapper organizationMapper;
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public void insertOrganization(Organization organization,
			AuthorizingUser authorizingUser) {
		// 创建组织
		organization.setCreateBy(authorizingUser.getUserName());
		organization.setCreateTime(new Date());
		organization.setUpdateBy(authorizingUser.getUserName());
		organization.setUpdateTime(new Date());
		organizationMapper.insert(organization);
	}
	
	@Override
	public List<Organization> selectOrganizations() {
		return organizationMapper.selectList(new EntityWrapper<Organization>());
	}
	
	@Override
	public List<OrganizationVO> selectOrganizationsDetail() {
		List<OrganizationVO> organizationVOs = new ArrayList<>();
		// 查询所有组织
		List<Organization> organizations = organizationMapper.selectList(new EntityWrapper<Organization>());
		// 循环遍历组织,将用户信息添加该组织中
		for (Organization organization : organizations) {
			User user = new User();
			user.setOrganizationId(organization.getOrganizationId());
			List<User> users = userMapper.selectList(new EntityWrapper<User>(user));
			OrganizationVO organizationVO = new OrganizationVO();
			BeanUtils.copyProperties(organization, organizationVO);
			organizationVO.setUsers(users);
			organizationVO.setNumberUser(users.size());
			organizationVOs.add(organizationVO);
		}
		return organizationVOs;
	}
	
	@Override
	public List<Organization> selectOrganizations(Integer status) {
		Organization organization = new Organization();
		organization.setStatus(status);
		return organizationMapper.selectList(new EntityWrapper<Organization>(organization));
	}

	@Override
	public void updateOrganization(Organization organization,
			AuthorizingUser authorizingUser) {
		// 更新组织信息
		organization.setUpdateBy(authorizingUser.getUserName());
		organization.setUpdateTime(new Date());
		organizationMapper.updateById(organization);
	}

	@Override
	public void updateOrganizationStatus(Long organizationId, Integer status) {
		Organization organization = new Organization();
		organization.setStatus(status);
		organization.setOrganizationId(organizationId);
		organizationMapper.updateById(organization);
	}

	@Override
	public void deleteOrganization(Long organizationId) {
		// 删除组织表中记录
		organizationMapper.deleteById(organizationId);
		
		// 重置管理员组织记录
		userMapper.updateOrganization(organizationId);
	}


}
