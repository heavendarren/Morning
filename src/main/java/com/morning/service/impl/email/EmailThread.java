package com.morning.service.impl.email;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.morning.entity.email.UserEmailMsg;
import com.morning.service.email.MailService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：EmailThread   
* 类描述： 多线层发送邮件业务逻辑层  
* 创建人：陈星星   
* 创建时间：2016年11月6日 下午10:56:15   
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:56:15   
* @version
 */
public class EmailThread implements Runnable {
	
    private static final Logger LOGGER = LoggerFactory.getLogger(EmailThread.class);
	
	private MailService mailService;
	
	private UserEmailMsg userEmailMsg;
	
	private List<String> list = new ArrayList<>();
    
	public EmailThread(List<String> list, UserEmailMsg userEmailMsg, MailService mailService) {
		this.list.addAll(list);
		this.userEmailMsg = userEmailMsg;
		this.mailService = mailService;
		list.size();
	}

	@Override
	public void run() {
        try {
            //每10个邮箱批量发一次，发完休息1秒，直到发完为止
                while(true){
                    if(!list.isEmpty()){
                        List<String> listStrings = queryList(10);
                        String[] arr = listStrings.toArray(new String[listStrings.size()]);
                        for(String mail : arr){
                    		userEmailMsg.setToEmails(mail);
                    		mailService.sendMail(userEmailMsg);
                        }
                        Thread.sleep(1000);
                    }else{
                        break;
                    }
                }
        }catch (Exception e){
        	LOGGER.error("EmailThread.run:{}", e);
        }
	}
	
    //获得要发送的list加锁
	public synchronized List<String> queryList(int num) {
		List<String> newList = new ArrayList<>();
		if (list.size() <= num) {
			for (int i = 0; i < list.size(); i++) {
				newList.add(list.get(i));
			}
			list = new ArrayList<>();
			return newList;
		} else {
			for (int i = 0; i < num; i++) {
				newList.add(list.get(i));
			}
			for (int i = 0; i < num; i++) {
				list.remove(0);
			}
		}
		return newList;
	}
}
