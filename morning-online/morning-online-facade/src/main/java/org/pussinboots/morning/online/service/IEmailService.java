package org.pussinboots.morning.online.service;

import org.pussinboots.morning.online.entity.Email;
import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-online-facade   
* 类名称：IEmailService   
* 类描述：Email / 邮箱记录表  业务逻辑层接口
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午3:49:25   
*
 */
public interface IEmailService extends IService<Email> {
	
	/**
	 * 根据邮箱标志查找邮箱
	 * @param emailSign 邮箱标志
	 * @return Email
	 */
	Email getByEmailSign(Long emailSign);
	
	/**
	 * 根据邮箱ID更新邮箱状态
	 * @param emailId 邮箱ID
	 * @param status 邮箱状态
	 * @return
	 */
	Integer updateStatus(Long emailId, Integer status);
	
}
