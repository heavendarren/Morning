package org.pussinboots.morning.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.product.entity.ProductCategory;
import org.pussinboots.morning.product.pojo.vo.ProductVO;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：ProductCategoryMapper   
* 类描述：ProductCategory / 商品分类关联表 数据访问层接口   
* 创建人：陈星星   
* 创建时间：2017年4月12日 下午4:23:24   
*
 */
public interface ProductCategoryMapper extends BaseMapper<ProductCategory> {
	
	
	/**
	 * 根据类目ID列表查找显示置顶商品列表
	 * @param categoryIds  类目ID列表
	 * @param showInShelve 商品状态
	 * @param showInTop 是否置顶
	 * @param showNumber 显示数量
	 * @return
	 */
	List<ProductVO> listTopByCategoryIds(@Param("categoryIds") List<Long> categoryIds, @Param("status") Integer status,
			@Param("showInTop") Integer showInTop, @Param("showNumber") Integer showNumber);
	
	/**
	 * 根据类目ID列表查找显示热门商品列表
	 * @param categoryIds  类目ID列表
	 * @param showInShelve 商品状态
	 * @param showInHot 是否置顶
	 * @param showNumber 显示数量
	 * @return
	 */
	List<ProductVO> listHotByCategoryIds(@Param("categoryIds") List<Long> categoryIds, @Param("status") Integer status,
			@Param("showInHot") Integer showInHot, @Param("showNumber") Integer showNumber);
	
	/**
	 * 根据类目ID查找显示热门商品列表
	 * @param categoryIds  类目ID
	 * @param showInShelve 商品状态
	 * @param showInHot 是否置顶
	 * @param showNumber 显示数量
	 * @return
	 */
	List<ProductVO> listHotByCategoryId(@Param("categoryId") Long categoryId, @Param("status") Integer status,
			@Param("showInHot") Integer showInHot, @Param("showNumber") Integer showNumber);
	
	/**
	 * 根据商品ID查找热门评论
	 * @param productId 商品ID
	 * @param type 评论类型
	 * @param status 状态
	 * @return
	 */
	ProductVO getComment(@Param("productId") Long productId, @Param("type") Integer type,
			@Param("status") Integer status);
	
	/**
	 * 根据类目ID列表查找显示导航商品列表
	 * @param categoryIds  类目ID列表
	 * @param showInShelve 商品状态
	 * @param showInHot 是否置顶
	 * @param showNumber 显示数量
	 * @return
	 */
	List<ProductVO> listNavByCategoryIds(@Param("categoryIds") List<Long> categoryIds, @Param("status") Integer status,
			@Param("showInNav") Integer showInNav, @Param("showNumber") Integer showNumber);
	
	/**
	 * 根据类目ID列表、分类、排序查找商品列表及标签（分类查找）
	 * @param categoryIds 目录ID列表
	 * @param status 商品状态
	 * @param pageInfo 排序方式
	 * @param rowBounds 分页实体类
	 * @return
	 */
	List<ProductVO> listByPage(@Param("categoryIds") List<Long> categoryIds, @Param("status") Integer status,
			@Param("pageInfo") PageInfo pageInfo, RowBounds rowBounds);
	
	/**
	 * 根据搜索内容、分类、排序查找商品列表及标签
	 * @param search 搜索内容
	 * @param status 商品状态
	 * @param pageInfo 排序方式
	 * @param rowBounds 分页实体类
	 * @return
	 */
	List<ProductVO> listBySearch(@Param("search") String search, @Param("status") Integer status,
			@Param("pageInfo") PageInfo pageInfo, RowBounds rowBounds);
}