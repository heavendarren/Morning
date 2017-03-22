package com.pussinboots.morning.os.modules.product.mapper;

import com.pussinboots.morning.os.modules.product.entity.ShoppingCart;
import com.pussinboots.morning.os.modules.product.vo.ShoppingCartVO;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：ShoppingCartMapper   
* 类描述：ShoppingCart表 / 购物车表 数据访问层接口     
* 创建人：陈星星   
* 创建时间：2017年3月19日 下午10:27:08   
*
 */
public interface ShoppingCartMapper extends BaseMapper<ShoppingCart> {
	
	/**
	 * 根据用户ID、产品规格编号查找购物车商品信息
	 * @param userId 用户ID
	 * @param productSpecNumber 产品规格编号
	 * @return ShoppingCartVO
	 */
	ShoppingCartVO selectCartVO(@Param("userId") Long userId, @Param("productSpecNumber") Long productSpecNumber);
	
	/**
	 * 根据用户ID查找购物车商品列表
	 * @param userId 用户ID
	 * @return List<ShoppingCartVO>
	 */
	List<ShoppingCartVO> selectCartVOs(@Param("userId") Long userId, @Param("checkStatus") Integer checkStatus);
	
}