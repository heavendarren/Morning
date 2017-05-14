package org.pussinboots.morning.administrator.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.pussinboots.morning.administrator.entity.UserLoginLog;
import org.pussinboots.morning.common.support.page.PageInfo;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-administrator-service   
* 类名称：UserLoginLogMapper   
* 类描述：UserLoginLog / 管理员登陆表 数据访问层接口      
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午5:43:54   
*
 */
public interface UserLoginLogMapper extends BaseMapper<UserLoginLog> {
	
	/**
	 * 根据管理员ID查找管理员登录日志列表
	 * @param userId 管理员ID
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @param rowBounds 分页实体
	 * @return
	 */
	List<UserLoginLog> listByPage(@Param("userId") Long userId, @Param("pageInfo") PageInfo pageInfo,
			@Param("search") String search, RowBounds rowBounds);
}