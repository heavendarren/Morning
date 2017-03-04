package com.pussinboots.morning.os.modules.product.service.impl;

import com.pussinboots.morning.os.modules.product.entity.ProductAttribute;
import com.pussinboots.morning.os.modules.product.mapper.ProductAttributeMapper;
import com.pussinboots.morning.os.modules.product.service.IProductAttributeService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：ProductAttributeServiceImpl   
* 类描述：ProductAttribute表 / 商品属性表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年2月27日 下午1:28:32   
*
 */
@Service
public class ProductAttributeServiceImpl extends ServiceImpl<ProductAttributeMapper, ProductAttribute> implements IProductAttributeService {

	@Autowired
	private ProductAttributeMapper productAttributeMapper;
	
	@Override
	public ProductAttribute selectByProductId(Long productId) {
		return productAttributeMapper.selectOne(new ProductAttribute(productId));
	}
	
}
