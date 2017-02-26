package com.pussinboots.morning.os.modules.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.pussinboots.morning.os.modules.product.entity.Category;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：CategoryMapper   
* 类描述：Category表 / 商品分类表   数据访问层接口
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:45:16   
*
 */
public interface CategoryMapper extends BaseMapper<Category> {
	
	/**
	 * 根据分类导航状态和分类状态查找分类列表
	 * @param status 分类状态
	 * @param showInNav 分类导航状态
	 * @return
	 */
	List<Category> selectCategorysByStatus(@Param("status") Integer status,@Param("showInNav") Integer showInNav);

}