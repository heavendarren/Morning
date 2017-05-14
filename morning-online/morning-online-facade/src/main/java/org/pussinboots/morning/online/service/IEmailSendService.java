package org.pussinboots.morning.online.service;

import org.pussinboots.morning.online.pojo.dto.EmailSendResultDTO;

/**
 * 
* 项目名称：morning-online-facade   
* 类名称：IEmailSendService   
* 类描述：EmailSend / 邮件发送  业务逻辑层接口            
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午4:00:41   
*
 */
public interface IEmailSendService {
	
	/**
	 * 发送Velocity模版邮件通过邮件账号及邮件类型
	 * @param email 邮件账号
	 * @param userName 用户昵称
	 * @param type 邮件类型
	 * @return EmailSendResult
	 */
	EmailSendResultDTO sendMailByVelocity(String email, String userName, Integer type);
}
