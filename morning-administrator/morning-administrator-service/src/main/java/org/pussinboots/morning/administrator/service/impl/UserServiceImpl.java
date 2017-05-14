package org.pussinboots.morning.administrator.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.pussinboots.morning.administrator.common.constant.UserReturnCode;
import org.pussinboots.morning.administrator.common.util.PasswordUtils;
import org.pussinboots.morning.administrator.common.util.UserUtils;
import org.pussinboots.morning.administrator.entity.Role;
import org.pussinboots.morning.administrator.entity.User;
import org.pussinboots.morning.administrator.entity.UserLoginLog;
import org.pussinboots.morning.administrator.entity.UserRole;
import org.pussinboots.morning.administrator.mapper.UserLoginLogMapper;
import org.pussinboots.morning.administrator.mapper.UserMapper;
import org.pussinboots.morning.administrator.mapper.UserRoleMapper;
import org.pussinboots.morning.administrator.pojo.dto.UserPageDTO;
import org.pussinboots.morning.administrator.pojo.vo.UserVO;
import org.pussinboots.morning.administrator.service.IUserService;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.common.exception.ValidateException;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-administrator-service   
* 类名称：UserServiceImpl   
* 类描述：User / 管理员表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午5:20:43   
*
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private UserLoginLogMapper userLoginLogMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	@Override
	public Integer insertUser(User user, String[] roleIds, String userName) throws ValidateException {
		// 验证用户名
		if (this.checkLoginName(user.getLoginName())) {
			throw new ValidateException(UserReturnCode.ACCOUNT_ERROR);
		}

		// 插入该管理员
		user.setSalt(PasswordUtils.getSalt());
		user.setLoginPassword(PasswordUtils.getMd5(user.getLoginPassword(), user.getLoginName(), user.getSalt()));
		user.setPicImg(UserUtils.getPicImg());
		user.setCreateBy(userName);
		user.setCreateTime(new Date());
		user.setUpdateBy(userName);
		user.setUpdateTime(new Date());
		Integer count = userMapper.insert(user);

		// 插入角色列表
		if (roleIds != null && roleIds.length > 0) {
			List<UserRole> userRoles = new ArrayList<>();
			for (int i = 0; i < roleIds.length; i++) {
				UserRole userRole = new UserRole();
				userRole.setUserId(user.getUserId());
				userRole.setCreateTime(new Date());
				userRole.setRoleId(Long.valueOf(roleIds[i]));
				userRole.setCreateBy(userName);
				userRoles.add(userRole);
			}
			userRoleMapper.insertUserRoles(userRoles);
		}
		return count;
	}
	
	@Override
	public User getByLoginName(String loginName) {
		User user = new User();
		user.setLoginName(loginName);
		return userMapper.selectOne(user);
	}
	
	@Override
	public UserVO getById(Long userId) {
		return userMapper.getById(userId);
	}
	
	@Override
	public List<UserVO> listByUser(UserVO userVo) {
		return userMapper.listByUser(userVo);
	}
	
	@Override
	public UserPageDTO listByPage(PageInfo pageInfo, String search) {
		Page<UserVO> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());
		List<UserVO> userVOs = userMapper.listByPage(pageInfo, search, page);
		pageInfo.setTotal(page.getTotal());
		return new UserPageDTO(userVOs, pageInfo);
	}
	
	@Override
	public List<UserVO> listByOrganizationId(Long organizationId) {
		// TODO 对该sql语句进行整合

		// 通过组织ID查找管理员
		UserVO userVO = new UserVO();
		userVO.setOrganizationId(organizationId);
		List<UserVO> userVOs = userMapper.listByUser(userVO);

		// 对管理员列表进行遍历,获取角色信息
		for (UserVO vo : userVOs) {
			List<Role> roles = userRoleMapper.listByUserId(vo.getUserId(), StatusEnum.NORMAL.getStatus());
			vo.setRoles(roles);
		}
		return userVOs;
	}
	
	@Override
	public UserPageDTO listByOrganizationId(Long organizationId, PageInfo pageInfo, String search) {
		Page<UserVO> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());
		List<UserVO> userVOs = userMapper.listByOrganizationId(organizationId, pageInfo, search, page);
		pageInfo.setTotal(page.getTotal());
		return new UserPageDTO(userVOs, pageInfo);
	}

	@Override
	public Integer updateLogById(Long userId, UserLoginLog userLoginLog) {

		// 创建用户登录日志
		userLoginLogMapper.insert(userLoginLog);

		// 更新User表用户登录信息
		User user = new User();
		user.setUserId(userId);
		user.setLastLoginTime(new Date());
		user.setLastLoginIp(userLoginLog.getUserIp());
		return userMapper.updateById(user);
	}

	@Override
	public Integer updateByUserId(User user) {
		user.setUpdateTime(new Date());
		return userMapper.updateById(user);
	}
	
	@Override
	public Integer updateUser(User user, String[] roleIds, String userName) {
		// 更新用户信息
		user.setUpdateTime(new Date());
		user.setUpdateBy(userName);
		Integer count = userMapper.updateById(user);

		// 删除UserRole 表用户记录
		UserRole userRoleById = new UserRole();
		userRoleById.setUserId(user.getUserId());
		userRoleMapper.delete(new EntityWrapper<UserRole>(userRoleById));

		// 插入SystemUserLoginLog 表用户记录
		if (roleIds != null && roleIds.length > 0) {
			List<UserRole> userRoles = new ArrayList<>();
			for (int i = 0; i < roleIds.length; i++) {
				UserRole userRole = new UserRole();
				userRole.setUserId(user.getUserId());
				userRole.setCreateTime(new Date());
				userRole.setRoleId(Long.valueOf(roleIds[i]));
				userRole.setCreateBy(userName);
				userRoles.add(userRole);
			}
			// 插入角色列表
			userRoleMapper.insertUserRoles(userRoles);
		}
		return count;
	}

	@Override
	public Integer updatePsw(String nowPassword, String newPassword, Long userId, String userName)
			throws ValidateException {
		User user = userMapper.selectById(userId);

		String password = PasswordUtils.getMd5(nowPassword, user.getLoginName(), user.getSalt());
		if (user.getLoginPassword() == null || !user.getLoginPassword().equals(password)) {
			throw new ValidateException(UserReturnCode.WRONG_PASSWORD);
		}

		User updateUser = new User();
		updateUser.setUserId(userId);
		updateUser.setUpdateBy(userName);
		updateUser.setUpdateTime(new Date());
		updateUser.setLoginPassword(PasswordUtils.getMd5(newPassword, user.getLoginName(), user.getSalt()));
		return userMapper.updateById(updateUser);
	}

	@Override
	public Integer updateStatus(Long userId) {
		User user = userMapper.selectById(userId);
		if (user != null && StatusEnum.NORMAL.getStatus().equals(user.getStatus())) {
			User updateUser = new User();
			updateUser.setUserId(userId);
			updateUser.setStatus(StatusEnum.FREEZE.getStatus());
			return userMapper.updateById(updateUser);
		} else if (user != null && StatusEnum.FREEZE.getStatus().equals(user.getStatus())) {
			User updateUser = new User();
			updateUser.setUserId(userId);
			updateUser.setStatus(StatusEnum.NORMAL.getStatus());
			return userMapper.updateById(updateUser);
		}
		return null;
	}

	@Override
	public Integer deleteByUserId(Long userId) {

		// 删除管理员登录记录
		UserLoginLog loginLog = new UserLoginLog();
		loginLog.setUserId(userId);
		userLoginLogMapper.delete(new EntityWrapper<UserLoginLog>(loginLog));

		// 删除管理员角色记录
		UserRole userRole = new UserRole();
		userRole.setUserId(userId);
		userRoleMapper.delete(new EntityWrapper<UserRole>(userRole));

		// 删除管理员信息
		return userMapper.deleteById(userId);
	}
	
	private boolean checkLoginName(String loginName) {
		User user = new User();
		user.setLoginName(loginName);
		int count = userMapper.selectCount(new EntityWrapper<User>(user));
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public Integer updateAvatar(Long userId, String picImg) {
		User user = new User();
		user.setUserId(userId);
		user.setPicImg(picImg);
		user.setUpdateTime(new Date());
		return userMapper.updateById(user);
	}
}
