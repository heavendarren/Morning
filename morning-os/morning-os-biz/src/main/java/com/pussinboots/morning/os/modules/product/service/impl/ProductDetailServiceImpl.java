package com.pussinboots.morning.os.modules.product.service.impl;

import com.pussinboots.morning.os.modules.product.entity.ProductDetail;
import com.pussinboots.morning.os.modules.product.mapper.ProductDetailMapper;
import com.pussinboots.morning.os.modules.product.service.IProductDetailService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：ProductDetailServiceImpl   
* 类描述：ProductDetail表 / 商品描述表 业务逻辑层接口实现类            
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:48:45   
*
 */
@Service
public class ProductDetailServiceImpl extends ServiceImpl<ProductDetailMapper, ProductDetail> implements IProductDetailService {
	
}
