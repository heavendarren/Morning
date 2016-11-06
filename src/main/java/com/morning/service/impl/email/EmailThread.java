package com.morning.service.impl.email;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Getter;

import com.alibaba.fastjson.JSON;
import com.morning.common.util.DateUtil;
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
	
	private MailService mailService;
	private UserEmailMsg userEmailMsg;
	@Getter
	private int sumNum = 0;
	@Getter
	private List<String> list = new ArrayList<String>();
    
	public EmailThread(List<String> list, UserEmailMsg userEmailMsg, MailService mailService) {
		this.list.addAll(list);
		this.userEmailMsg = userEmailMsg;
		this.mailService = mailService;
		sumNum += list.size();
	}

	@Override
	public void run() {
        try {
            //每10个邮箱批量发一次，发完休息1秒，直到发完为止
    		System.out.println(Thread.currentThread().getName());
                while(true){
                    if(list.size()>0){
                        List<String> list = queryList(10);
                    	System.out.println(Thread.currentThread().getName());
                        String[] arr = (String[])list.toArray(new String[list.size()]);
                    	System.out.println(arr);
                        for(String mail : arr){
                    		userEmailMsg.setToEmails(mail);
                        	System.out.println(Thread.currentThread().getName()+"邮件"+JSON.toJSON(mail));
                    		mailService.sendMail(userEmailMsg);
                        }
                        Thread.sleep(1000);
                    }else{
                        sumNum =0;
                        break;
                    }
                }
        }catch (Exception e){
            e.printStackTrace();
        }
	}
	
    //获得要发送的list加锁
	public synchronized List<String> queryList(int num) {
		List<String> newList = new ArrayList<String>();
		if (list.size() <= num) {
			System.out.println("发送完成时间" + DateUtil.formatDateTime(new Date()));
			for (int i = 0; i < list.size(); i++) {
				newList.add(list.get(i));
			}
			list = new ArrayList<String>();
			System.out.println(JSON.toJSON(newList));
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
