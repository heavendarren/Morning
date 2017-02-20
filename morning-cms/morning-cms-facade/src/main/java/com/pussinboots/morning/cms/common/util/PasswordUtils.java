package com.pussinboots.morning.cms.common.util;

import org.apache.shiro.crypto.hash.Md5Hash;

import com.pussinboots.morning.common.util.RandomUtils;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：PasswordUtils   
* 类描述：工具类：提供一些密码加密的方法   
* 创建人：陈星星   
* 创建时间：2017年2月5日 下午9:09:37
 */
public class PasswordUtils {
	
	private static int iterations = 6;
	
	private static int saltNumber = 6;
	
	private PasswordUtils() { }
	
	/**
	 * 字符串加密函数MD5实现
	 * @param password 密码
	 * @param loginName 用户名
	 * @param salt 盐值
	 * @return
	 */
	public static String getMd5(String password, String loginName, String salt) {
		String md5Password = new Md5Hash(password, getCredentialsSalt(
				loginName, salt), iterations).toString();
		return md5Password;
	}

	/** 证书凭证 */
	public static String getCredentialsSalt(String loginName, String salt) {
		return loginName + salt;
	}
	
	/** 获得密码盐值 */
	public static String getSalt() {
		return RandomUtils.String(saltNumber);
	}
}
