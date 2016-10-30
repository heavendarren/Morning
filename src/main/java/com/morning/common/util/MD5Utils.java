package com.morning.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.log4j.Logger;
import org.bouncycastle.util.encoders.Hex;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：MD5Utils   
* 类描述：MD5加密工具类   
* 创建人：陈星星   
* 创建时间：2016年10月16日 上午3:36:52   
* 修改人：陈星星   
* 修改时间：2016年10月16日 上午3:36:52   
* 修改备注：   
* @version    
*
 */
public class MD5Utils {
	
	private static final Logger logger = Logger.getLogger(MD5Utils.class);
	
	public static String getMD5(String src){
		try {
			// 创建加密对象
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");//提供信息摘要算法的功能
			byte[] md5bytes = messageDigest.digest(src.getBytes());//使用指定的 byte 数组对摘要进行最后更新，然后完成摘要计算
			String encrypt = Hex.toHexString(md5bytes);
			return encrypt;
		} catch (NoSuchAlgorithmException e) {
			logger.info("MD5Utils.getMD5", e);
		}
		return null;
	}

}
