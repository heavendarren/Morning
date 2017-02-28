package com.pussinboots.morning.os.modules.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.pussinboots.morning.os.modules.product.entity.Product;
import com.pussinboots.morning.os.modules.product.entity.ProductCategory;
import com.pussinboots.morning.os.modules.product.vo.ProductVO;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：ProductCategoryMapper   
* 类描述：ProductCategory表 / 商品表分类表关联表  数据访问层接口    
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:46:05   
*
 */
public interface ProductCategoryMapper extends BaseMapper<ProductCategory> {
	
	/**
	 * 通过目录ID查找产品列表
	 * @param categoryIds 目录ID
	 * @param status 产品状态
	 * @param showInNav 是否显示首页
	 * @return
	 */
	List<Product> selectProductByCategoryIds(@Param("categoryIds") List<Long> categoryIds,
			@Param("status") Integer status, @Param("showInNav") Integer showInNav);
	
	/**
	 * 通过目录ID查找产品列表及标签（随机查询showNumber个）
	 * @param categoryIds categoryIds 目录ID
	 * @param status 产品状态
	 * @param showNumber 显示数量
	 * @return
	 */
	List<ProductVO> selectProductVOsByCategoryIds(@Param("categoryIds") List<Long> categoryIds,
			@Param("status") Integer status, @Param("showNumber") Integer showNumber);
	
	/**
	 * 通过目录ID列表查找产品列表及标签（热门产品前showNumber个）
	 * @param categoryIds categoryIds 目录ID列表
	 * @param status 产品状态
	 * @param showNumber 显示数量
	 * @return
	 */
	List<ProductVO> selectHotProductVOsByCategoryIds(@Param("categoryIds") List<Long> categoryIds,
			@Param("status") Integer status, @Param("showNumber") Integer showNumber);
	
	/**
	 * 通过目录ID查找产品列表及标签（随机查询showNumber个）
	 * @param categoryId 目录ID
	 * @param status 产品状态
	 * @param showNumber 显示数量
	 * @return
	 */
	List<ProductVO> selectProductVOs(@Param("categoryId") Long categoryId, @Param("status") Integer status,
			@Param("showNumber") Integer showNumber);
	
}