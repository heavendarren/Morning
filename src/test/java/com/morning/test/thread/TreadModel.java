package com.morning.test.thread;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;

import com.alibaba.fastjson.JSON;
import com.morning.common.util.toolbox.DateUtil;
import com.morning.entity.email.UserEmailMsg;
import com.morning.service.email.MailService;
import com.morning.test.email.EmailTest;

import lombok.Getter;


public class TreadModel implements Runnable{

	private static Logger logger = LogManager.getLogger(TreadModel.class.getName()); 

	@Getter
	private int sumNum = 0;
	@Getter
	private List<String> list = new ArrayList<String>();
    
	public TreadModel(List<String> list) {
		this.list.addAll(list);
		sumNum += list.size();
	}

	@Override
	public void run() {
        try {
            //每10个邮箱批量发一次，发完休息1秒，直到发完为止
                while(true){
                	try{
                		Thread.sleep(500);
                	}catch(InterruptedException e){
                		e.printStackTrace();
                	}
                    if(list.size()>0){
                        List<String> list = queryList(3);
                        String[] arr = (String[])list.toArray(new String[list.size()]);
                        for(String mail : arr){
                        	System.out.println(mail);
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
