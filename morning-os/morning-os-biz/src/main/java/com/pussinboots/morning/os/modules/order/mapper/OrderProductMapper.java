package com.pussinboots.morning.os.modules.order.mapper;

import com.pussinboots.morning.os.modules.order.entity.OrderProduct;
import com.pussinboots.morning.os.modules.product.vo.ShoppingCartVO;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：OrderProductMapper   
* 类描述：OrderProduct表 / 订单明细表  数据访问层接口   
* 创建人：陈星星   
* 创建时间：2017年3月28日 下午3:42:01   
*
 */
public interface OrderProductMapper extends BaseMapper<OrderProduct> {
	
	/**
	 * 创建订单明细表
	 * @param shoppingCartVOs 购物车选中商品
	 * @param orderId 订单ID
	 */
	void insertProducts(@Param("shoppingCartVOs") List<ShoppingCartVO> shoppingCartVOs, @Param("orderId") Long orderId);

}