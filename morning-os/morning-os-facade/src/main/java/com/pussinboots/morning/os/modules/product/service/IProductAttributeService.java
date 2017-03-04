package com.pussinboots.morning.os.modules.product.service;

import com.pussinboots.morning.os.modules.product.entity.ProductAttribute;
import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IProductAttributeService   
* 类描述：ProductAttribute表 / 商品属性表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年2月27日 下午1:27:53   
*
 */
public interface IProductAttributeService extends IService<ProductAttribute> {
	
	/**
	 * 根据商品ID查找商品参数
	 * @param productId 商品ID
	 * @return ProductAttribute
	 */
	ProductAttribute selectByProductId(Long productId);
	
}
