package org.pussinboots.morning.administrator.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.pussinboots.morning.administrator.entity.Organization;
import org.pussinboots.morning.administrator.entity.User;
import org.pussinboots.morning.administrator.mapper.OrganizationMapper;
import org.pussinboots.morning.administrator.mapper.UserMapper;
import org.pussinboots.morning.administrator.pojo.vo.OrganizationVO;
import org.pussinboots.morning.administrator.service.IOrganizationService;
import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-administrator-service   
* 类名称：OrganizationServiceImpl   
* 类描述：Organization / 组织表 业务逻辑层接口实现      
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午6:04:32   
*
 */
@Service
public class OrganizationServiceImpl extends ServiceImpl<OrganizationMapper, Organization> implements IOrganizationService {
	
	@Autowired
	private OrganizationMapper organizationMapper;
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public Integer insertOrganization(Organization organization, String userName) {
		organization.setCreateBy(userName);
		organization.setCreateTime(new Date());
		organization.setUpdateBy(userName);
		organization.setUpdateTime(new Date());
		return organizationMapper.insert(organization);
	}

	@Override
	public List<Organization> listBySataus(Integer status) {
		Organization organization = new Organization();
		organization.setStatus(status);
		return organizationMapper.selectList(new EntityWrapper<Organization>(organization));
	}

	@Override
	public BasePageDTO<Organization> listByPage(PageInfo pageInfo, String search) {
		Page<Organization> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());
		List<Organization> organizations = organizationMapper.listByPage(pageInfo, search, page);
		pageInfo.setTotal(page.getTotal());
		return new BasePageDTO<Organization>(pageInfo, organizations);
	}
	
	@Override
	public List<OrganizationVO> listOrganizationsDetail() {
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
	public Integer updateStatus(Long organizationId) {
		Organization organization = organizationMapper.selectById(organizationId);

		if (organization != null && StatusEnum.NORMAL.getStatus().equals(organization.getStatus())) {
			Organization updateOrganization = new Organization();
			updateOrganization.setOrganizationId(organization.getOrganizationId());
			updateOrganization.setStatus(StatusEnum.FREEZE.getStatus());
			return organizationMapper.updateById(updateOrganization);
		} else if (organization != null && StatusEnum.FREEZE.getStatus().equals(organization.getStatus())) {
			Organization updateOrganization = new Organization();
			updateOrganization.setOrganizationId(organization.getOrganizationId());
			updateOrganization.setStatus(StatusEnum.NORMAL.getStatus());
			return organizationMapper.updateById(updateOrganization);
		}
		return null;
	}
	
	@Override
	public Integer updateOrganization(Organization organization, String userName) {
		organization.setUpdateBy(userName);
		organization.setUpdateTime(new Date());
		return organizationMapper.updateById(organization);
	}

	@Override
	public Integer deleteByOrganizationId(Long organizationId) {

		// 重置管理员组织记录
		userMapper.updateOrganization(organizationId);

		// 删除组织表中记录
		return organizationMapper.deleteById(organizationId);
	}

}
