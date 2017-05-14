package org.pussinboots.morning.product.service.impl;

import org.pussinboots.morning.product.entity.ProductDetail;
import org.pussinboots.morning.product.mapper.ProductDetailMapper;
import org.pussinboots.morning.product.service.IProductDetailService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：ProductDetailServiceImpl   
* 类描述：ProductDetail / 商品描述表 业务逻辑层接口实现         
* 创建人：陈星星   
* 创建时间：2017年4月14日 上午2:07:04   
*
 */
@Service
public class ProductDetailServiceImpl extends ServiceImpl<ProductDetailMapper, ProductDetail> implements IProductDetailService {
	
}
