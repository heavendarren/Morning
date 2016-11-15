package com.morning.service.order;


/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：OrderLogService   
* 类描述：订单日志业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年11月9日 下午3:17:07   
* 修改人：陈星星   
* 修改时间：2016年11月9日 下午3:17:07   
* @version
 */
public interface OrderLogService {
	
	/**
	 * 
	 * @param content 内容
	 * @param createBy 创建者
	 * @param createType 操作者类型
	 * @param orderId	订单ID
	 * @param orderNumber	订单编号
	 */
    public void createOrderLog(String content, String createBy,
			String createType, Integer orderId, String orderNumber);

}
