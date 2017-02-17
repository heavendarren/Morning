package com.pussinboots.morning.cms.modules.administrator.mapper;

import java.util.List;

import com.pussinboots.morning.cms.modules.administrator.entity.User;
import com.pussinboots.morning.cms.modules.administrator.vo.UserVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：UserMapper   
* 类描述：User 表数据访问层接口        
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午12:43:45
 */
public interface UserMapper extends BaseMapper<User> {
	
	/**
	 * 根据用户查找管理员列表
	 * @param userVo 用户查询条件
	 * @return List<UserVO> 
	 */
	List<UserVO> selectAllUser(UserVO userVO);
	
	/**
	 * 根据管理员ID查找管理员信息
	 * @param userId 管理员ID
	 * @return UserVO
	 */
	UserVO selectByUserId(Long userId);
	
	/**
	 * 更新管理员信息
	 * @param user
	 */
	void updateUser(User user);
	
	/**
	 * 根据组织ID重置组织ID
	 * @param organizationId
	 */
	void updateOrganization(Long organizationId);
}