package org.pussinboots.morning.administrator.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.pussinboots.morning.administrator.entity.Role;
import org.pussinboots.morning.administrator.entity.UserRole;
import org.pussinboots.morning.administrator.pojo.vo.UserVO;
import org.pussinboots.morning.common.support.page.PageInfo;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-administrator-service   
* 类名称：UserRoleMapper   
* 类描述：UserRole / 管理员角色关联表  数据访问层接口   
* 创建人：陈星星   
* 创建时间：2017年4月1日 下午5:51:58   
*
 */
public interface UserRoleMapper extends BaseMapper<UserRole> {
	
	/**
	 * 插入用户角色记录 
	 * @param userRoles 用户角色记录信息
	 * @return
	 */
	Integer insertUserRoles(@Param("userRoles") List<UserRole> userRoles);
	
	/**
	 * 根据管理员ID查找角色列表
	 * @param userId 管理员ID
	 * @param status 角色状态
	 * @return List<Role>
	 */
	List<Role> listByUserId(@Param("userId") Long userId, @Param("status") Integer status);
	
	/**
	 * 根据角色ID查找管理员列表
	 * @param roleId 角色ID
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @param rowBounds 分页实体
	 * @return
	 */
	List<UserVO> listByRoleId(@Param("roleId") Long roleId, @Param("pageInfo") PageInfo pageInfo,
			@Param("search") String search, RowBounds rowBounds);
}