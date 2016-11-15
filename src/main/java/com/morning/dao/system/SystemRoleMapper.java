package com.morning.dao.system;

import java.util.List;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.morning.entity.system.SystemRole;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemRoleMapper   
* 类描述：SystemRole 表数据访问层接口   
* 创建人：陈星星   
* 创建时间：2016年11月13日 下午9:51:45   
* 修改人：陈星星   
* 修改时间：2016年11月13日 下午9:51:45   
* @version
 */
public interface SystemRoleMapper extends AutoMapper<SystemRole> {
	
	/**
	 * 查找所有角色
	 * @return
	 */
	List<SystemRole> selectAllRole();


}