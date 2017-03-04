package com.pussinboots.morning.os.modules.product.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.os.modules.product.entity.ProductImage;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IProductImageService   
* 类描述：ProductImage表 / 商品图片表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:43:12   
*
 */
public interface IProductImageService extends IService<ProductImage> {
	
	/**
	 * 根据商品ID查找展示图片
	 * @param productId 商品ID
	 * @param showNumber 显示数量
	 * @param status 图片状态
	 * @return
	 */
	List<ProductImage> selectByProductId(Long productId, Integer showNumber, Integer status);
	
}
