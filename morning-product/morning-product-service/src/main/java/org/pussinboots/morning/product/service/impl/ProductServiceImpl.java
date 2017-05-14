package org.pussinboots.morning.product.service.impl;

import org.pussinboots.morning.product.entity.Product;
import org.pussinboots.morning.product.mapper.ProductMapper;
import org.pussinboots.morning.product.pojo.vo.ProductVO;
import org.pussinboots.morning.product.service.IProductService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：ProductServiceImpl   
* 类描述：Product / 商品表 业务逻辑层接口实现        
* 创建人：陈星星   
* 创建时间：2017年4月11日 下午3:17:31   
*
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements IProductService {
	
	@Autowired
	private ProductMapper productMapper;

	@Override
	public ProductVO getByNumber(Long productNumber, Integer status) {
		return productMapper.getByNumber(productNumber, status);
	}
	
}
