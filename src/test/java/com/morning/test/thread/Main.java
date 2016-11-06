package com.morning.test.thread;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;

public class Main {
    
    public static void main(String[] args) {
        
        List<String> list = new ArrayList<String>();
        Map<Long,Integer> map = new HashMap<Long,Integer>();
        for(int i = 0;i<100;i++){
            list.add(""+i);
        }
        
        
        int pcount = Runtime.getRuntime().availableProcessors();//8个线程
        
        long start = System.currentTimeMillis();//创建时间
        
        System.out.println(pcount);
        
        for(int i=0;i<pcount;i++){
            
           Thread t = new MyThread1(list,map);
            map.put(t.getId(),Integer.valueOf(i));
            System.out.println(JSON.toJSON(map));
            t.start();
           // System.out.println(list.get(i));
        }
        
        System.out.println("----"+(System.currentTimeMillis() - start));
    }
    
    
}

