package org.pussinboots.morning.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.pussinboots.morning.product.entity.ProductImage;
import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：ProductImageMapper   
* 类描述：ProductImage / 商品图片表 数据访问层接口            
* 创建人：陈星星   
* 创建时间：2017年4月14日 上午2:04:32   
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
	List<ProductImage> listByProductId(@Param("productId") Long productId, @Param("showNumber") Integer showNumber,
			@Param("status") Integer status);

}