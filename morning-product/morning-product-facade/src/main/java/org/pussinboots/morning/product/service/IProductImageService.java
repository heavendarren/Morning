package org.pussinboots.morning.product.service;

import java.util.List;

import org.pussinboots.morning.product.entity.ProductImage;
import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：IProductImageService   
* 类描述：ProductImage / 商品图片表 业务逻辑层接口    
* 创建人：陈星星   
* 创建时间：2017年4月14日 上午2:02:08   
*
 */
public interface IProductImageService extends IService<ProductImage> {
	
	/**
	 * 根据商品ID查找展示图片
	 * @param productId 商品ID
	 * @param showNumber 显示图片数量
	 * @param status 状态
	 * @return
	 */
	List<ProductImage> listByProductId(Long productId, Integer showNumber, Integer status);
	
}
