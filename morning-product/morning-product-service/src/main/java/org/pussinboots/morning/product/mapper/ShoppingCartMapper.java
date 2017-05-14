package org.pussinboots.morning.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.pussinboots.morning.product.entity.ShoppingCart;
import org.pussinboots.morning.product.pojo.vo.ShoppingCartVO;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：ShoppingCartMapper   
* 类描述：ShoppingCart / 购物车表 数据访问层接口   
* 创建人：陈星星   
* 创建时间：2017年5月10日 下午3:55:42   
*
 */
public interface ShoppingCartMapper extends BaseMapper<ShoppingCart> {
	
	/**
	 * 根据用户ID、产品规格编号查找购物车商品信息
	 * @param userId 用户ID
	 * @param productSpecNumber 产品规格编号
	 * @return
	 */
	ShoppingCartVO getCart(@Param("userId") Long userId, @Param("productSpecNumber") Long productSpecNumber);
	
	/**
	 * 根据用户ID查找购物车商品列表
	 * @param userId 用户ID
	 * @param checkStatus 选中状态
	 * @return
	 */
	List<ShoppingCartVO> list(@Param("userId") Long userId, @Param("checkStatus") Integer checkStatus);
}