package com.pussinboots.morning.os.modules.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.pussinboots.morning.os.modules.product.entity.ProductImage;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：ProductImageMapper   
* 类描述：ProductImage表 / 商品图片表  数据访问层接口      
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:46:59   
*
 */
public interface ProductImageMapper extends BaseMapper<ProductImage> {
	
	/**
	 * 根据商品ID查找展示图片
	 * @param productId 商品ID
	 * @param showNumber 显示数量
	 * @param status 图片状态
	 * @return
	 */
	List<ProductImage> selectByProductId(@Param("productId") Long productId, @Param("showNumber") Integer showNumber,
			@Param("status") Integer status);

}