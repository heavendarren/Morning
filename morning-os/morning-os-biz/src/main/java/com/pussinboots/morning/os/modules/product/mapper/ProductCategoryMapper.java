package com.pussinboots.morning.os.modules.product.mapper;

import com.pussinboots.morning.os.modules.product.entity.Product;
import com.pussinboots.morning.os.modules.product.entity.ProductCategory;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;

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
	 * @return List<Product> 
	 */
	List<Product> selectProductByCategoryIds(@Param("categoryIds") List<Long> categoryIds,
			@Param("status") Integer status, @Param("showInNav") Integer showInNav);
}