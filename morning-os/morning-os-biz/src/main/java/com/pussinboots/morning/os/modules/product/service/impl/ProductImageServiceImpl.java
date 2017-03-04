package com.pussinboots.morning.os.modules.product.service.impl;

import com.pussinboots.morning.os.modules.product.entity.ProductImage;
import com.pussinboots.morning.os.modules.product.mapper.ProductImageMapper;
import com.pussinboots.morning.os.modules.product.service.IProductImageService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：ProductImageServiceImpl   
* 类描述：ProductImage表 / 商品图片表 业务逻辑层接口实现类            
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:48:45   
*
 */
@Service
public class ProductImageServiceImpl extends ServiceImpl<ProductImageMapper, ProductImage> implements IProductImageService {
	
	@Autowired
	private ProductImageMapper productImageMapper;

	@Override
	public List<ProductImage> selectByProductId(Long productId, Integer showNumber, Integer status) {
		return productImageMapper.selectByProductId(productId, showNumber, status);
	}
	
}
