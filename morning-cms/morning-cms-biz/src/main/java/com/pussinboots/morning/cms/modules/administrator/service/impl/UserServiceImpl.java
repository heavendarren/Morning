package com.pussinboots.morning.cms.modules.administrator.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.cms.common.security.AuthorizingUser;
import com.pussinboots.morning.cms.common.util.PasswordUtils;
import com.pussinboots.morning.cms.common.util.UserUtils;
import com.pussinboots.morning.cms.modules.administrator.entity.Role;
import com.pussinboots.morning.cms.modules.administrator.entity.User;
import com.pussinboots.morning.cms.modules.administrator.entity.UserLoginLog;
import com.pussinboots.morning.cms.modules.administrator.entity.UserRole;
import com.pussinboots.morning.cms.modules.administrator.mapper.UserLoginLogMapper;
import com.pussinboots.morning.cms.modules.administrator.mapper.UserMapper;
import com.pussinboots.morning.cms.modules.administrator.mapper.UserRoleMapper;
import com.pussinboots.morning.cms.modules.administrator.service.IUserService;
import com.pussinboots.morning.cms.modules.administrator.vo.UserVO;
import com.pussinboots.morning.common.enums.StatusEnum;
import com.pussinboots.morning.common.exception.ValidateException;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：UserServiceImpl   
* 类描述：User 表业务逻辑层接口实现类   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:50:18
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
	@Transactional
	public void insertUser(User user, String[] roleIds, AuthorizingUser authorizingUser) throws ValidateException {
		// 验证用户名
		if(this.checkLoginName(user.getLoginName())){
			throw new ValidateException("该用户名已被使用!");
		}
		// 插入该管理员
		user.setSalt(PasswordUtils.getSalt());
		user.setLoginPassword(PasswordUtils.getMd5(user.getLoginPassword(), user.getLoginName(), user.getSalt()));
		user.setPicImg(UserUtils.getPicImg());
		user.setCreateBy(authorizingUser.getUserName());
		user.setCreateTime(new Date());
		user.setUpdateBy(authorizingUser.getUserName());
		user.setUpdateTime(new Date());
		userMapper.insert(user);
		
		// 插入角色列表
		if (roleIds != null && roleIds.length > 0) {
			List<UserRole> userRoles = new ArrayList<>();
			for (int i = 0; i < roleIds.length; i++) {
				UserRole userRole = new UserRole();
				userRole.setUserId(user.getUserId());
				userRole.setCreateTime(new Date());
				userRole.setRoleId(Long.valueOf(roleIds[i]));
				userRole.setCreateBy(authorizingUser.getUserName());
				userRoles.add(userRole);
			}
			userRoleMapper.insertUserRoles(userRoles);
		}
	}
	
	@Override
//	@Cacheable(value="userCache",key="'user'+#loginName")
	public User selectByLoginName(String loginName) {
		User user = new User();
		user.setLoginName(loginName);
		return userMapper.selectOne(user);
	}
	
	@Override
	public UserVO selectByUserId(Long userId) {
		return userMapper.selectByUserId(userId);
	}
	
	@Override
	public Integer selectAllUserNumber() {
		return userMapper.selectCount(null);
	}

	@Override
//	@CacheEvict(value="userCache",key="'sysUserLog'+#accountId")
	public void updateLogByUserId(Long userId, UserLoginLog userLoginLog) {
		// 更新User表用户登录信息
		User user = new User();
		user.setUserId(userId);
		user.setLastLoginTime(new Date());
		user.setLastLoginIp(userLoginLog.getUserIp());
		userMapper.updateById(user);

		// 创建用户登录日志
		userLoginLogMapper.insert(userLoginLog);
	}
	
	@Override
	public List<UserVO> selectAllUser(UserVO userVO) {
		return userMapper.selectAllUser(userVO);
	}
	
	@Override
	public List<UserVO> selectUsersByOrganizationId(Long organizationId) {
		// 通过组织ID查找管理员
		UserVO userVO = new UserVO();
		userVO.setOrganizationId(organizationId);
		List<UserVO> userVOs = userMapper.selectAllUser(userVO);
		
		// 对管理员列表进行遍历,获取角色信息
		for(UserVO vo : userVOs){  // TODO 按理说,foreach循环不能对其中的元素进行修改. 但是这里,userVOs中重置了角色信息?
			List<Role> roles = userRoleMapper.selectRolesByUserId(vo.getUserId(), StatusEnum.NORMAL.getStatus());
			vo.setRoles(roles);
		}
		return userVOs;
	}
	
	@Override
	public void updateUserInfo(User user, AuthorizingUser authorizingUser) {
		user.setUpdateBy(authorizingUser.getUserName());
		user.setUpdateTime(new Date());
		userMapper.updateById(user);
	}

	@Override
	public void updateUserPsw(String nowPassword, String newPassword, AuthorizingUser authorizingUser)
			throws ValidateException {
		User user = userMapper.selectById(authorizingUser.getUserId());
		String password = PasswordUtils.getMd5(nowPassword, user.getLoginName(), user.getSalt());  
		if (user.getLoginPassword() == null || !user.getLoginPassword().equals(password)) {
			throw new ValidateException("原密码不正确!");
		}
		
		User updateUser = new User();
		updateUser.setUserId(user.getUserId());
		updateUser.setUpdateBy(authorizingUser.getUserName());
		updateUser.setUpdateTime(new Date());
		updateUser.setLoginPassword(PasswordUtils.getMd5(newPassword, user.getLoginName(), user.getSalt()));
		userMapper.updateById(updateUser);
	}

	@Override
	public void updateUserStatus(Long userId, Integer status) {
		User user = new User();
		user.setUserId(userId);
		user.setStatus(status);
		userMapper.updateById(user);
	}
	
	@Override
	@Transactional
	public void updateUserInfo(User user, String[] roleIds, AuthorizingUser authorizingUser) {
		
		//更新用户信息
		user.setUpdateTime(new Date());
		user.setUpdateBy(authorizingUser.getUserName());
		userMapper.updateUser(user);
		
		//删除UserRole 表用户记录
		UserRole userRoleById = new UserRole();
		userRoleById.setUserId(user.getUserId());
		userRoleMapper.delete(new EntityWrapper<UserRole>(userRoleById));
		
		//插入SystemUserLoginLog 表用户记录
		if (roleIds != null && roleIds.length > 0) {
			List<UserRole> userRoles = new ArrayList<>();
			for(int i = 0; i<roleIds.length; i++){
				UserRole userRole = new UserRole();
				userRole.setUserId(user.getUserId());
				userRole.setCreateTime(new Date());
				userRole.setRoleId(Long.valueOf(roleIds[i]));
				userRole.setCreateBy(authorizingUser.getUserName());
				userRoles.add(userRole);
			}
			// 插入角色列表
			userRoleMapper.insertUserRoles(userRoles);
		}		
	}
	
	@Override
	public void updateUserAvatar(Long userId, String picImg) {
		User user = new User();
		user.setUserId(userId);
		user.setPicImg(picImg);
		userMapper.updateById(user);
	}

	@Override
	@Transactional
	public void deleteUser(Long userId) {
		// 删除SystemUser 表信息
		userMapper.deleteById(userId);
		
		// 删除SystemUserLoginLog 表用户记录
		UserLoginLog loginLog = new UserLoginLog();
		loginLog.setUserId(userId);
		userLoginLogMapper.delete(new EntityWrapper<UserLoginLog>(loginLog));
		
		// 删除SystemUserRoleMapper 表用户角色记录
		UserRole userRole = new UserRole();
		userRole.setUserId(userId);
		userRoleMapper.delete(new EntityWrapper<UserRole>(userRole));
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
}
