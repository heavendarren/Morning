package org.pussinboots.morning.administrator.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.pussinboots.morning.administrator.entity.User;
import org.pussinboots.morning.administrator.pojo.vo.UserVO;
import org.pussinboots.morning.common.support.page.PageInfo;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-administrator-service   
* 类名称：UserMapper   
* 类描述：User / 管理员表 数据访问层接口   
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午5:21:11   
*
 */
public interface UserMapper extends BaseMapper<User> {
	
	/**
	 * 根据管理员ID查找管理员信息
	 * @param userId 管理员ID
	 * @return
	 */
	UserVO getById(@Param("userId") Long userId);
	
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
	 * @param rowBounds 分页实体
	 * @return
	 */
	List<UserVO> listByPage(@Param("pageInfo") PageInfo pageInfo, @Param("search") String search, RowBounds rowBounds);
	
	/**
	 * 根据组织ID/分页信息/搜索内容查找管理员列表
	 * @param organizationId 组织ID
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @param rowBounds 分页实体
	 * @return
	 */
	List<UserVO> listByOrganizationId(@Param("organizationId") Long organizationId,
			@Param("pageInfo") PageInfo pageInfo, @Param("search") String search, RowBounds rowBounds);
	
	/**
	 * 根据组织ID重置组织ID
	 * @param organizationId 组织ID
	 * @return
	 */
	Integer updateOrganization(@Param("organizationId") Long organizationId);

}