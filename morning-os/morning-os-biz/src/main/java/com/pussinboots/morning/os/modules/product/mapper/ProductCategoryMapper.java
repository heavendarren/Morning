package com.pussinboots.morning.os.modules.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.pussinboots.morning.common.model.PageInfo;
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
	 * 根据目录ID查找产品列表
	 * @param categoryIds 目录ID
	 * @param status 产品状态
	 * @param showInNav 是否显示首页
	 * @return
	 */
	List<Product> selectProductByCategoryIds(@Param("categoryIds") List<Long> categoryIds,
			@Param("status") Integer status, @Param("showInNav") Integer showInNav);
	
	/**
	 * 根据目录ID查找产品列表及标签（随机查询showNumber个）
	 * @param categoryIds categoryIds 目录ID
	 * @param status 产品状态
	 * @param showNumber 显示数量
	 * @return
	 */
	List<ProductVO> selectProductVOsByCategoryIds(@Param("categoryIds") List<Long> categoryIds,
			@Param("status") Integer status, @Param("showNumber") Integer showNumber);
	
	/**
	 * 根据目录ID列表查找产品列表及标签（热门产品前showNumber个）
	 * @param categoryIds categoryIds 目录ID列表
	 * @param status 产品状态
	 * @param showNumber 显示数量
	 * @return
	 */
	List<ProductVO> selectHotProductVOsByCategoryIds(@Param("categoryIds") List<Long> categoryIds,
			@Param("status") Integer status, @Param("showNumber") Integer showNumber);
	
	/**
	 * 根据目录ID查找产品列表及标签（随机查询showNumber个）
	 * @param categoryId 目录ID
	 * @param status 产品状态
	 * @param showNumber 显示数量
	 * @return
	 */
	List<ProductVO> selectProductVOs(@Param("categoryId") Long categoryId, @Param("status") Integer status,
			@Param("showNumber") Integer showNumber);
	
	/**
	 * 根据类目ID列表、分类、排序查找产品列表及标签（分类查找）
	 * @param categoryIds categoryIds 目录ID列表
	 * @param status 产品状态
	 * @param rowBounds 分页实体类
	 * @param pageInfo 排序方式
	 * @return
	 */
	List<ProductVO> selectProductVOsByPage(@Param("categoryIds") List<Long> categoryIds,
			@Param("status") Integer status, RowBounds rowBounds, @Param("pageInfo") PageInfo pageInfo);
}