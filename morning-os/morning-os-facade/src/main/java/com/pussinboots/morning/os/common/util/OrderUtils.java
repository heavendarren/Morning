package com.pussinboots.morning.os.common.util;

import java.math.BigDecimal;
import java.util.Date;

import com.pussinboots.morning.common.util.RandomUtils;

public class OrderUtils {
	
	/** 订单编号后缀位数 */
	private static final int SUFFIX_NUMBER = 4;

	private OrderUtils() { }
	
	/** 获得订单编号 */
	public static Long getOrderNuber() {
		String prefixNumber = Long.toString(new Date().getTime());
		String suffixNumber = RandomUtils.number(SUFFIX_NUMBER);
		String userNumber = prefixNumber + suffixNumber;
		return Long.valueOf(userNumber);
	}
	
	/** 获得支付金额*/ 
	public static BigDecimal getPayAmount(BigDecimal shipmentAmount, BigDecimal orderAmount) {
		if (shipmentAmount != null) {
			orderAmount.add(shipmentAmount);
		}
		return orderAmount;
	}
}
