package com.pussinboots.morning.os.modules.email.service.impl;

import com.pussinboots.morning.os.modules.email.entity.Email;
import com.pussinboots.morning.os.modules.email.mapper.EmailMapper;
import com.pussinboots.morning.os.modules.email.service.IEmailService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：EmailServiceImpl   
* 类描述：Email 表业务逻辑层接口实现类         
* 创建人：陈星星   
* 创建时间：2017年2月21日 下午10:56:06   
*
 */
@Service
public class EmailServiceImpl extends ServiceImpl<EmailMapper, Email> implements IEmailService {
	
	@Autowired
	private EmailMapper emailMapper;

	@Override
	public void insertByEmail(Email email) {
		emailMapper.insert(email);
	}
	
}
