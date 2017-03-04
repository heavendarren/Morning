package com.pussinboots.morning.os.modules.product.service;

import com.pussinboots.morning.os.modules.product.entity.ProductParameter;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IProductParameterService   
* 类描述：ProductParameter表 / 商品参数表 业务逻辑层接口  
* 创建人：陈星星   
* 创建时间：2017年3月4日 上午4:27:43   
*
 */
public interface IProductParameterService extends IService<ProductParameter> {
	
	/**
	 * 根据商品ID查找商品参数列表
	 * @param productId 商品ID
	 * @param status 参数状态
	 * @return List<ProductParameter>
	 */
	List<ProductParameter> selectParametersByProductId(Long productId, Integer status);
}
