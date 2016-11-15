package com.morning.dao.order;

import com.morning.entity.order.OrderLog;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：OrderLogMapper   
* 类描述：订单日志数据访问层接口   
* 创建人：陈星星   
* 创建时间：2016年11月9日 下午3:14:41   
* 修改人：陈星星   
* 修改时间：2016年11月9日 下午3:14:41   
* @version
 */
public interface OrderLogMapper {
	
	/**
	 * 创建订单日志
	 * @param record
	 */
    public void createOrderLog(OrderLog record);

    int insertSelective(OrderLog record);
}