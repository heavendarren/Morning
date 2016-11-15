package com.morning.test.thread;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.morning.common.util.toolbox.DateUtil;

public class TreaTest {
	
	
    public static void main(String[] args) {
        
        List<String> list = new ArrayList<String>();
        list.add("810170512@qq.com");
        list.add("5524551@qq.com");
        list.add("18857105127@qq.com");
//        for(int i = 0;i<15;i++){
//            list.add(""+i);
//        }
        
        
        
//        int pcount = Runtime.getRuntime().availableProcessors();//8个线程
        int pcount = 2;
        long start = System.currentTimeMillis();//创建时间
        
        TreadModel emailThread = new TreadModel(list);
        
        System.out.println("批量发送邮件线程启动：线程数："+pcount+"发送邮件数："+list.size());
        System.out.println("开始发送时间"+ DateUtil.formatDateTime(new Date()));
        System.out.println(JSON.toJSON(list));
        //启动多少线程
        for(int i=0;i<pcount;i++){
        	new Thread(emailThread).start();
        }
        System.out.println("----"+(System.currentTimeMillis() - start));
    }

}
