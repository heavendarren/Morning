package org.pussinboots.morning.online.service.impl;

import org.pussinboots.morning.online.entity.Email;
import org.pussinboots.morning.online.mapper.EmailMapper;
import org.pussinboots.morning.online.service.IEmailService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-online-service   
* 类名称：EmailServiceImpl   
* 类描述： Email / 邮箱记录表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午3:50:35   
*
 */
@Service
public class EmailServiceImpl extends ServiceImpl<EmailMapper, Email> implements IEmailService {
	
	@Autowired
	private EmailMapper emailMapper;

	@Override
	public Email getByEmailSign(Long emailSign) {
		Email email = new Email();
		email.setEmailSign(emailSign);
		return emailMapper.selectOne(email);
	}

	@Override
	public Integer updateStatus(Long emailId, Integer status) {
		Email email = new Email();
		email.setEmailId(emailId);
		email.setStatus(status);
		return emailMapper.updateById(email);
	}
}
