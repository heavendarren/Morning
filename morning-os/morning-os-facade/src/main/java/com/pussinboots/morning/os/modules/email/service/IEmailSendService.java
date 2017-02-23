package com.pussinboots.morning.os.modules.email.service;

import java.util.Map;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IEmailSendService   
* 类描述：EmailSend 邮件发送业务逻辑层接口         
* 创建人：陈星星   
* 创建时间：2017年2月21日 下午11:20:24   
*
 */
public interface IEmailSendService {
	
	/**
	 * 发送Velocity模版邮件通过邮件账号及邮件类型
	 * @param email 邮件账号
	 * @param type 邮件类型
	 * @return result:true,成功/false:失败 emailSign：邮箱标识
	 */
	Map<String, Object> sendMailByVelocity(String email, Integer type);
	
	
}
