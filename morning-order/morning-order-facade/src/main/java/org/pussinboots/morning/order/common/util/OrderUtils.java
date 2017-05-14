package org.pussinboots.morning.order.common.util;

import java.math.BigDecimal;
import java.util.Date;

import org.pussinboots.morning.common.util.RandomUtils;

/**
 * 
* 项目名称：morning-order-facade   
* 类名称：OrderUtils   
* 类描述：OrderUtils工具类：提供一些订单操作的方法      
* 创建人：陈星星   
* 创建时间：2017年5月11日 上午12:12:15   
*
 */
public class OrderUtils {
	
	/** 订单编号后缀位数 */
	private static final int SUFFIX_NUMBER = 4;

	private OrderUtils() {
		throw new AssertionError();
	}

	/** 获得订单编号 */
	public static Long getOrderNuber() {
		String prefixNumber = Long.toString(new Date().getTime());
		String suffixNumber = RandomUtils.number(SUFFIX_NUMBER);
		String userNumber = prefixNumber + suffixNumber;
		return Long.valueOf(userNumber);
	}

	/** 获得支付金额 */
	public static BigDecimal getPayAmount(BigDecimal shipmentAmount, BigDecimal orderAmount) {
		if (shipmentAmount != null) {
			orderAmount.add(shipmentAmount);
		}
		return orderAmount;
	}
}
