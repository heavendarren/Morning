package com.pussinboots.morning.os.modules.product.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.os.modules.product.entity.Product;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IProductService   
* 类描述：Product表 / 商品表 业务逻辑层接口      
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:43:38   
*
 */
public interface IProductService extends IService<Product> {
	
	/**
	 * 根据是否是明星产品查询产品列表
	 * @param starProduct 明星产品 1:是/0:否
	 * @param showNumber 显示数量
	 * @return
	 */
	List<Product> selectProductsByStar(Integer starProduct, Integer showNumber);
	
	/**
	 * 根据商品编号和状态查找商品
	 * @param productNumber 商品编号
	 * @param status 商品状态
	 * @return Product
	 */
	Product selectProductByNumber(Long productNumber, Integer status);
	
}
