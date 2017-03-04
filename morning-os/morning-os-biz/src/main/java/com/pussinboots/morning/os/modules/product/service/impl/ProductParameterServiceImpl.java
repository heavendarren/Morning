package com.pussinboots.morning.os.modules.product.service.impl;

import com.pussinboots.morning.os.modules.product.entity.ProductParameter;
import com.pussinboots.morning.os.modules.product.mapper.ProductParameterMapper;
import com.pussinboots.morning.os.modules.product.service.IProductParameterService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：ProductParameterServiceImpl   
* 类描述：ProductParameter表 / 商品参数表 业务逻辑层实现   
* 创建人：陈星星   
* 创建时间：2017年3月4日 上午4:28:18   
*
 */
@Service
public class ProductParameterServiceImpl extends ServiceImpl<ProductParameterMapper, ProductParameter> implements IProductParameterService {
	
	@Autowired
	private ProductParameterMapper productParameterMapper;

	@Override
	public List<ProductParameter> selectParametersByProductId(Long productId, Integer status) {
		ProductParameter productParameter = new ProductParameter();
		productParameter.setProductId(productId);
		productParameter.setStatus(status);
		return productParameterMapper
				.selectList(new EntityWrapper<ProductParameter>(productParameter).orderBy("sort", true));
	}
}
