package org.pussinboots.morning.product.service;

import org.pussinboots.morning.product.entity.ProductSpecification;
import org.pussinboots.morning.product.pojo.dto.ProductSpecificationDTO;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：IProductSpecificationService   
* 类描述：ProductSpecification / 商品规格表 业务逻辑层接口        
* 创建人：陈星星   
* 创建时间：2017年4月14日 上午2:02:46   
*
 */
public interface IProductSpecificationService extends IService<ProductSpecification> {
	
	/**
	 * 根据商品ID查找商品类型列表以及商品规格列表
	 * @param productId 商品ID
	 * @param status 状态
	 * @return
	 */
	ProductSpecificationDTO getByProductId(Long productId, Integer status);
	
}
