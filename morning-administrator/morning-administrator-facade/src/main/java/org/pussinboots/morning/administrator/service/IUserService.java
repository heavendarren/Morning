package org.pussinboots.morning.administrator.service;

import java.util.List;

import org.pussinboots.morning.administrator.entity.User;
import org.pussinboots.morning.administrator.entity.UserLoginLog;
import org.pussinboots.morning.administrator.pojo.dto.UserPageDTO;
import org.pussinboots.morning.administrator.pojo.vo.UserVO;
import org.pussinboots.morning.common.exception.ValidateException;
import org.pussinboots.morning.common.support.page.PageInfo;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-administrator-facade   
* 类名称：IUserService   
* 类描述：User / 管理员表 业务逻辑层接口      
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午4:48:13   
*
 */
public interface IUserService extends IService<User> {
	
	/**
	 * 创建管理员以及插入角色记录
	 * @param user 管理员信息
	 * @param roleIds 角色记录ID
	 * @param userName 操作人
	 * @throws ValidateException 验证异常
	 * @return
	 */
	Integer insertUser(User user, String[] roleIds, String userName) throws ValidateException;
	
	/**
	 * 根据管理员账号查找管理员
	 * @param loginName 管理员账号
	 * @return
	 */
	User getByLoginName(String loginName);
	
	/**
	 * 根据管理员ID查找管理员信息
	 * @param userId 管理员ID
	 * @return
	 */
	UserVO getById(Long userId);
	
	/**
	 * 根据管理员信息查找管理员列表
	 * @param userVo
	 * @return
	 */
	List<UserVO> listByUser(UserVO userVo);
	
	/**
	 * 根据分页信息/搜索内容查找管理员列表
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @return
	 */
	UserPageDTO listByPage(PageInfo pageInfo, String search);
	
	/**
	 * 根据组织ID查找管理员列表
	 * @param organizationId
	 * @return
	 */
	List<UserVO> listByOrganizationId(Long organizationId);
	
	/**
	 * 根据组织ID/分页信息/搜索内容查找管理员列表
	 * @param organizationId 组织ID
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @return
	 */
	UserPageDTO listByOrganizationId(Long organizationId, PageInfo pageInfo, String search);
	
	/**
	 * 更新管理员登录日志
	 * @param userId 管理员ID
	 * @param userLoginLog 管理员登录日志
	 */
	Integer updateLogById(Long userId, UserLoginLog userLoginLog);
	
	/**
	 * 更新管理员信息
	 * @param user 管理员信息
	 * @return
	 */
	Integer updateByUserId(User user);
	
	/**
	 * 更新管理员信息 
	 * @param user 管理员信息
	 * @param roleIds 角色记录ID 
	 * @param userName 操作人
	 * @return
	 */
	Integer updateUser(User user, String[] roleIds, String userName);
	
	/**
	 * 更新管理员密码
	 * @param nowPassword 密码
	 * @param newPassword 新密码
	 * @param userId 管理员ID
	 * @param userName 管理员昵称
	 * @return
	 */
	Integer updatePsw(String nowPassword, String newPassword, Long userId, String userName) throws ValidateException;
	
	/**
	 * 更新管理员状态
	 * @param userId 管理员ID
	 * @return
	 */
	Integer updateStatus(Long userId);
	
	/**
	 * 更新管理员头像
	 * @param userId 管理员ID
	 * @param picImg 管理员头像
	 * @return
	 */
	Integer updateAvatar(Long userId, String picImg);
	
	/**
	 * 根据管理员ID删除管理员,同时删除角色记录、登录日志
	 * @param userId 管理员ID
	 * @return
	 */
	Integer deleteByUserId(Long userId);
}
