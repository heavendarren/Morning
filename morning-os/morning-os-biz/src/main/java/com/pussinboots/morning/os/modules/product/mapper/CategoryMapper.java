package com.pussinboots.morning.os.modules.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.pussinboots.morning.os.modules.product.dto.CategoryAdvertDTO;
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
	
	/**
	 * 根据父类目ID查找子类目ID
	 * @param categoryId 父类目ID
	 * @param status 类目状态
	 * @return List<Long> 
	 */
	List<Long> selectCategoryIds(@Param("categoryId") Long categoryId, @Param("status") Integer status);
	
	/**
	 * 根据类目ID查找类目广告
	 * @param categoryId 类目ID
	 * @param status 广告显示状态
	 * @param showNumber 广告显示数量
	 * @return
	 */
	List<CategoryAdvertDTO> selectCategoryAdvert(@Param("categoryId") Long categoryId, @Param("status") Integer status,
			@Param("showNumber") Integer showNumber);
	
}