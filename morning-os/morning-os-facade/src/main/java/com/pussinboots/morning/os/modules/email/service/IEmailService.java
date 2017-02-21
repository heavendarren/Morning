package com.pussinboots.morning.os.modules.email.service;

import com.pussinboots.morning.os.modules.email.entity.Email;
import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IEmailService   
* 类描述：Email 表业务逻辑层接口      
* 创建人：陈星星   
* 创建时间：2017年2月21日 下午10:54:53   
*
 */
public interface IEmailService extends IService<Email> {
	
	/**
	 * 创建邮件发送记录
	 * @param email
	 */
	void insertByEmail(Email email);
	
}
