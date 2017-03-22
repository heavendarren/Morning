package com.pussinboots.morning.os.modules.product.service;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.os.modules.product.entity.ShoppingCart;
import com.pussinboots.morning.os.modules.product.vo.CartVO;
import com.pussinboots.morning.os.modules.product.vo.ShoppingCartVO;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IShoppingCartService   
* 类描述：ShoppingCart表 / 购物车表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年3月19日 下午10:26:07   
*
 */
public interface IShoppingCartService extends IService<ShoppingCart> {
	
	/**
	 * 创建购物车商品信息
	 * @param productSpecNumber 商品规格编号
	 * @param userId 用户ID
	 */
	void insertByProductSpecNumber(Long productSpecNumber, Long userId);
	
	/**
	 * 根据用户ID、产品规格编号查找购物车商品信息
	 * @param userId 用户ID
	 * @param productSpecNumber 产品规格编号
	 * @return ShoppingCartVO
	 */
	ShoppingCartVO selectCartVO(Long userId, Long productSpecNumber);
	
	/**
	 * 根据用户ID、购物车商品状态查找购物车列表
	 * @param userId 用户ID
	 * @param status 购物车商品状态
	 * @return
	 */
	CartVO selectCartVOs(Long userId, Integer status);
	
	/**
	 * 根据产品规格编号、用户ID、购买数量更新购物车商品
	 * @param productSpecNumber  产品规格编号
	 * @param userId 用户ID
	 * @param buyNumber 购买数量
	 */
	void updateByProductSpecNumber(Long productSpecNumber, Long userId, Integer buyNumber);
	
	/**
	 * 根据产品规格编号、用户ID、选中状态更新购物车商品
	 * @param productSpecNumber 产品规格编号
	 * @param userId 用户ID
	 * @param checkStatus 选中状态
	 */
	void updateStatusByProductSpecNumber(Long productSpecNumber, Long userId, Integer checkStatus);
	
	/**
	 * 删除购物车商品
	 * @param productSpecNumber 商品规格编号
	 * @param userId 用户ID
	 */
	void deleteByProductSpecNumber(Long productSpecNumber, Long userId);
}
