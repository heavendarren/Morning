package org.pussinboots.morning.product.service;

import org.pussinboots.morning.product.entity.Product;
import org.pussinboots.morning.product.pojo.vo.ProductVO;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：IProductService   
* 类描述：Product / 商品表 业务逻辑层接口          
* 创建人：陈星星   
* 创建时间：2017年4月11日 下午3:13:06   
*
 */
public interface IProductService extends IService<Product> {
	
	/**
	 * 根据商品编号和状态查找商品
	 * @param productNumber 商品编号
	 * @param status 状态
	 * @return
	 */
	ProductVO getByNumber(Long productNumber, Integer status);
	
}
