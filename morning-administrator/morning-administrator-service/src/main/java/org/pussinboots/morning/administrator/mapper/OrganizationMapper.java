package org.pussinboots.morning.administrator.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.pussinboots.morning.administrator.entity.Organization;
import org.pussinboots.morning.common.support.page.PageInfo;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-administrator-service   
* 类名称：OrganizationMapper   
* 类描述：Organization / 组织表 数据访问层接口            
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午5:46:23   
*
 */
public interface OrganizationMapper extends BaseMapper<Organization> {
	
	/**
	 * 根据分页信息/搜索内容查找组织列表
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @param page 分页实体
	 * @return
	 */
	List<Organization> listByPage(@Param("pageInfo") PageInfo pageInfo, @Param("search") String search,
			RowBounds rowBounds);
}