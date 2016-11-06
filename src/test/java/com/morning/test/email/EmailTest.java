package com.morning.test.email;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.morning.entity.email.UserEmailMsg;
import com.morning.service.email.MailService;
import com.morning.service.email.UserEmailMsgService;



@RunWith(SpringJUnit4ClassRunner.class)		//表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:spring/spring-context.xml", "classpath:spring/spring-context-mybatis.xml" , "classpath:spring/spring-context-mail.xml" })  
public class EmailTest {
	
	private static Logger logger = LogManager.getLogger(EmailTest.class.getName()); 
	
	@Autowired
	private MailService mailService;
	@Autowired
	private UserEmailMsgService userEmailMsgService;
	

    
	@Test
	public void test(){
		
		String email = "810170512@qq.com;5524551@qq.com";
    	UserEmailMsg userEmailMsg=new UserEmailMsg();
    	// 验证邮箱
		Map<String, Object> returnMap = userEmailMsgService.checkEmail(email);
		System.out.println(JSON.toJSON(returnMap.get("returnList").toString().split(",")));
    	userEmailMsg.setToEmails(returnMap.get("returnList").toString());

        //内容
        Map<String, Object> model = new HashMap<String, Object>();

		//模版
		userEmailMsg.setVelocityTemplate("EmailCaptcha.vm");
        //主题
    	userEmailMsg.setSubject("【但行好事·莫问前程】很高兴遇见您！");
    	userEmailMsg.setFromName("猫宁客服团队 ");
        model.put("emailCaptcha", "5468466");
        model.put("registerTime", new Date());
		
        userEmailMsg.setModel(model);
        try {
        	userEmailMsgService.batchSendEmail(userEmailMsg, 3);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
