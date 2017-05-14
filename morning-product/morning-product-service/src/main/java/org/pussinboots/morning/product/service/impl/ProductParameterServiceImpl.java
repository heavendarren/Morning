package org.pussinboots.morning.product.service.impl;

import java.util.List;

import org.pussinboots.morning.product.entity.ProductParameter;
import org.pussinboots.morning.product.mapper.ProductParameterMapper;
import org.pussinboots.morning.product.service.IProductParameterService;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：ProductParameterServiceImpl   
* 类描述：ProductParameter / 商品参数表 业务逻辑层接口实现          
* 创建人：陈星星   
* 创建时间：2017年4月14日 上午2:07:35   
*
 */
@Service
public class ProductParameterServiceImpl extends ServiceImpl<ProductParameterMapper, ProductParameter> implements IProductParameterService {

	@Autowired
	private ProductParameterMapper productParameterMapper;
	
	@Override
	public List<ProductParameter> listByProductId(Long productId, Integer status) {
		ProductParameter productParameter = new ProductParameter();
		productParameter.setProductId(productId);
		productParameter.setStatus(status);
		return productParameterMapper
				.selectList(new EntityWrapper<ProductParameter>(productParameter).orderBy("sort", true));
	}
}
