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
	
	/**
	 * 通过邮箱标志查找邮箱
	 * @param emailSign 邮箱标志
	 * @return
	 */
	Email selectByEmailSign(Long emailSign);
	
	/**
	 * 通过邮箱标识更新邮箱验证码状态
	 * @param emailSign 邮箱标志
	 */
	void updateStatus(Long emailSign);
	
}
