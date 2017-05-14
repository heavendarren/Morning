package org.pussinboots.morning.product.service;

import org.pussinboots.morning.product.entity.ProductAttribute;
import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：IProductAttributeService   
* 类描述：ProductAttribute / 商品属性表 业务逻辑层接口      
* 创建人：陈星星   
* 创建时间：2017年4月14日 上午2:01:28   
*
 */
public interface IProductAttributeService extends IService<ProductAttribute> {
	
	/**
	 * 根据商品ID查找商品属性
	 * @param productId 商品ID
	 * @return
	 */
	ProductAttribute getByProductId(Long productId);
}
