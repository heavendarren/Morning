package org.pussinboots.morning.online.common.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.pussinboots.morning.common.util.RandomUtils;

/**
 * 
* 项目名称：morning-online-facade   
* 类名称：EmailUtils   
* 类描述：EmailUtils工具类：提供一些邮箱操作的方法   
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午4:13:04   
*
 */
public class EmailUtils {
	
	/** 验证码位数 */
	private static final int CAPTCHA_NUMBER = 6;
	/** 验证码时长 */
	private static final int CAPTCHA_TIME = 3;
	/** 邮箱标识后缀位数 */
	private static final int SUFFIX_SIGN = 3;
	
	private EmailUtils() {
		throw new AssertionError();
	}
	
	/**
	 * 获取验证码
	 * @return
	 */
	public static String getCaptcha() {
		return RandomUtils.getString(CAPTCHA_NUMBER);
	}
	
	/**
	 * 获取验证码时长
	 * @return
	 */
	public static int getCaptchaTime() {
		return CAPTCHA_TIME;
	}
	
	/** 获得邮箱编号 */
	public static Long getEmailSign() {
		String prefixSign = Long.toString(new Date().getTime());
		String suffixSign = RandomUtils.number(SUFFIX_SIGN);
		String emailSign = prefixSign + suffixSign;
		return Long.valueOf(emailSign);
	}
	
	/**
	 * 验证邮箱格式 去重
	 * @param emailStr 待验证邮箱
	 * @return Map<String, Object> flag:true/false; date:数据; msg:错误消息;
	 */
	public static Map<String, Object> checkEmail(String emailStr) {
		Map<String, Object> returnMap = new HashMap<>();
		
		emailStr = emailStr.trim();
		emailStr = emailStr.replaceAll("\r\n", "");// 去除空格回车
		emailStr = emailStr.replaceAll(" ", "");// 去除空格回车
		emailStr = emailStr.replaceAll("；", ";");
		emailStr = emailStr.replaceAll(",", ";");
		emailStr = emailStr.replaceAll("，", ";");

		String[] lm = emailStr.split(";");// 定义数组
		
		List<String> list = new ArrayList<>();// new一个arralist
		Set<String> set = new HashSet<>();// new 一个hashset
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
		returnMap.put("date", noRepeatList);
		returnMap.put("msg", errorMessage);
		return returnMap;
	}

}
