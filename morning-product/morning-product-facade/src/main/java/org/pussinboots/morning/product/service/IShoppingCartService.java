package org.pussinboots.morning.product.service;

import org.pussinboots.morning.product.entity.ShoppingCart;
import org.pussinboots.morning.product.pojo.vo.CartVO;
import org.pussinboots.morning.product.pojo.vo.ShoppingCartVO;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：IShoppingCartService   
* 类描述：ShoppingCart / 购物车表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年5月10日 下午3:54:52   
*
 */
public interface IShoppingCartService extends IService<ShoppingCart> {
	
	/**
	 * 创建购物车商品信息
	 * @param productSpecNumber 商品规格编号
	 * @param userId 用户ID
	 * @return
	 */
	Integer insertShoppingCart(Long productSpecNumber, Long userId);
	
	/**
	 * 根据用户ID、产品规格编号查找购物车商品信息
	 * @param userId 用户ID
	 * @param productSpecNumber 产品规格编号
	 * @return
	 */
	ShoppingCartVO getCart(Long userId, Long productSpecNumber);
	
	/**
	 * 根据用户ID、购物车商品状态查找购物车列表
	 * @param userId 用户ID
	 * @param status 购物车商品状态
	 * @return
	 */
	CartVO list(Long userId, Integer status);
	
	/**
	 * 根据产品规格编号、用户ID、购买数量更新购物车商品
	 * @param productSpecNumber  产品规格编号
	 * @param userId 用户ID
	 * @param buyNumber 购买数量
	 * @return
	 */
	Integer updateBuyNumber(Long productSpecNumber, Long userId, Integer buyNumber);
	
	/**
	 * 根据产品规格编号、用户ID、选中状态更新购物车商品
	 * @param productSpecNumber 产品规格编号
	 * @param userId 用户ID
	 * @param checkStatus 选中状态
	 * @return
	 */
	Integer updateStatus(Long productSpecNumber, Long userId, Integer status);
	
	/**
	 * 根据用户ID、产品规格编号删除购物车商品信息
	 * @param productSpecNumber 商品规格编号
	 * @param userId 用户ID
	 * @return
	 */
	Integer delete(Long productSpecNumber, Long userId);

	/**
	 * 根据用户ID删除购物车中选中的商品
	 * @param userId 用户ID
	 * @return
	 */
	Integer deleteCheckStatus(Long userId);
	
}
