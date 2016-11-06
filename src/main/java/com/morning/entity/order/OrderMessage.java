package com.morning.entity.order;

import java.io.Serializable;

import com.morning.entity.goods.Goods;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * @description：订单详情实体类
 * @author CXX
 * @version 创建时间：2016年8月29日  下午5:21:16
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class OrderMessage implements Serializable{
	
	private static final long serialVersionUID = -6800637303825877829L;
	/**订单详情ID*/
	private Integer orderMessageId;
	/**商品编号*/
    private Integer goodsId;
	/**购买数量*/
    private Integer orderNumber;
	/**公益价格*/
    private Double orderMoney;
	/**商品颜色*/
    private String goodsColor;
	/**商品版本*/
    private String goodsStandard;
	/**公益套餐*/
    private Integer publicType;
	/**订单ID*/
    private Integer orderId;
    /**商品实体类*/
    private Goods goods;
    /**购物车临时编号*/
    private Integer cartId;
}