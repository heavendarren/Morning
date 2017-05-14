package org.pussinboots.morning.administrator.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.pussinboots.morning.administrator.entity.Role;
import org.pussinboots.morning.common.support.page.PageInfo;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-administrator-service   
* 类名称：RoleMapper   
* 类描述：Role / 角色表 数据访问层接口            
* 创建人：陈星星   
* 创建时间：2017年4月6日 下午11:44:10   
*
 */
public interface RoleMapper extends BaseMapper<Role> {
	
	/**
	 * 根据分页信息/搜索内容查找角色列表
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @param rowBounds 分页实体
	 * @return
	 */
	List<Role> listByPage(@Param("pageInfo") PageInfo pageInfo, @Param("search") String search, RowBounds rowBounds);

}