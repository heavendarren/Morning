package org.pussinboots.morning.administrator.common.util;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.pussinboots.morning.common.util.RandomUtils;


/**
 * 
* 项目名称：morning-administrator-facade   
* 类名称：PasswordUtils   
* 类描述：PasswordUtils工具类：提供一些密码加密的方法      
* 创建人：陈星星   
* 创建时间：2017年4月2日 下午2:45:31   
*
 */
public class PasswordUtils {
	
	/** 迭代次数 */
	private static final int ITERATIONS = 6;
	/** 盐值长度 */
	private static final int SALT_NUMBER = 6;
	
	private PasswordUtils() {
		throw new AssertionError();
	}
	
	/**
	 * 字符串加密函数MD5实现
	 * @param password 密码
	 * @param loginName 用户名
	 * @param salt 盐值
	 * @return
	 */
	public static String getMd5(String password, String loginName, String salt) {
		return new Md5Hash(password, getCredentialsSalt(loginName, salt), ITERATIONS).toString();
	}

	/** 证书凭证 */
	public static String getCredentialsSalt(String loginName, String salt) {
		return loginName + salt;
	}
	
	/** 获得密码盐值 */
	public static String getSalt() {
		return RandomUtils.getString(SALT_NUMBER);
	}
}
