package com.morning.service.impl.email;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.entity.email.UserEmailMsg;
import com.morning.service.email.MailService;
import com.morning.service.email.UserEmailMsgService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：UserEmailMsgServiceImpl   
* 类描述：用户发送邮件业务逻辑层实现   
* 创建人：陈星星   
* 创建时间：2016年11月6日 下午10:58:19   
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:58:19   
* @version
 */
@Service("userEmailMsgService")
public class UserEmailMsgServiceImpl implements UserEmailMsgService{
	
	private static Logger logger = LoggerFactory.getLogger(UserEmailMsgServiceImpl.class);
	
	@Autowired
	private MailService mailService;
	
	/**
	 * 验证邮箱，并去重
	 * @param emailStr
	 * @return
	 */
	@Override
	public Map<String, Object> checkEmail(String emailStr) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		emailStr = emailStr.trim();
		emailStr = emailStr.replaceAll("\r\n", "");// 去除空格回车
		emailStr = emailStr.replaceAll(" ", "");// 去除空格回车
		emailStr = emailStr.replaceAll("；", ";");
		emailStr = emailStr.replaceAll(",", ";");
		emailStr = emailStr.replaceAll("，", ";");

		String[] lm = emailStr.split(";");// 定义数组
		
		List<String> list = new ArrayList<String>();// new一个arralist
		Set<String> set = new HashSet<String>();// new 一个hashset
		set.addAll(Arrays.asList(lm));// 将数组转为list并存入set中，就可以去掉重复项了
		for (Iterator<String> it = set.iterator(); it.hasNext();) {
			list.add((String) it.next());// 遍历set 将所有元素键入list中
		}
		String noRepeatList = list.toString();
		noRepeatList = noRepeatList.replace("[", "");
		noRepeatList = noRepeatList.replace("]", "");
		noRepeatList = noRepeatList.replace(" ", "");
		noRepeatList = noRepeatList.trim();
		
		boolean flag = true;
		String errorMessage = "";
		String[] lms = noRepeatList.split(",");
		if (lms.length > 0) {
			for (int i = 0; i < lms.length; i++) {
				if (!lms[i].trim().matches("^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$")) {
					flag = false;
					errorMessage = lms[i] + "格式有误";
					break;
				}
			}
		}
		returnMap.put("flag", flag);
		returnMap.put("returnList", noRepeatList);
		returnMap.put("errorMessage", errorMessage);
		return returnMap;
	}
	
	/**
	 * 启动线程，发送邮件
	 * @param userEmailMsg
	 * @param num
	 */
	@Override
    public void batchSendEmail(UserEmailMsg userEmailMsg , int num){
    	String [] toEmail = userEmailMsg.getToEmails().split(",");
        if(toEmail.length > 100 ){
            List<String> list = new ArrayList<String>();
            list.addAll(Arrays.asList(toEmail));
            EmailThread emailThread = new EmailThread(list,userEmailMsg ,mailService);
            System.out.println("批量发送邮件线程启动：线程数："+num+"发送邮件数："+list.size());
            //启动多少线程
            for(int i=0;i<num;i++){
                new Thread(emailThread).start();
            }
        }else{
        	for(String email : toEmail){
        		userEmailMsg.setToEmails(email);
        		try {
					mailService.sendMail(userEmailMsg);
				} catch (Exception e) {
					e.printStackTrace();
					logger.error("UserEmailMsgServiceImpl.batchSendEmail", e);
				}
        	}
        }
    }
}
