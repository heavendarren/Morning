package security;

import javax.crypto.KeyGenerator;
import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.bouncycastle.crypto.digests.MD5Digest;
import org.bouncycastle.crypto.macs.HMac;
import org.bouncycastle.crypto.params.KeyParameter;
import org.bouncycastle.util.encoders.Hex;


public class MorningMAC {
	
	private static String src = "morning security hmac";
	
	public static void main(String[] args) {
		jdkHmacMD5();
		bcHmacMD5();
	}
	
	/**
	 * jdkHmacMD5
	 */
	public static void jdkHmacMD5(){
		try {
			KeyGenerator keyGenerator = KeyGenerator.getInstance("HmacMD5");//初始化KeyGenerator
			SecretKey secretkey = keyGenerator.generateKey();//产生密钥
			byte[] key = secretkey.getEncoded();//获得密钥
			
			key = org.apache.commons.codec.binary.Hex.decodeHex(new char[]{'a','a','a','a','a','a','a','a','a','a'});
			
			//还原密钥
			SecretKey restoreSecretKey = new SecretKeySpec(key, "HmacMD5");//
			Mac mac = Mac.getInstance(restoreSecretKey.getAlgorithm());//实例化MAC
			mac.init(restoreSecretKey);
			byte[] hmacMD4Bytes = mac.doFinal(src.getBytes());//执行摘要
			System.out.println("jdk hmacMD5:"+Hex.toHexString(hmacMD4Bytes));
		} catch (Exception e) {
			e.printStackTrace( );
		}
		
	}
	
	/**
	 * bcHmacMD5
	 */
	public static void bcHmacMD5(){
		HMac hmac =new HMac(new MD5Digest());
		hmac.init(new KeyParameter(Hex.decode("aaaaaaaaaa")));
		hmac.update(src.getBytes(), 0, src.getBytes().length);
		
		byte[] hmacMD5Bytes = new byte[hmac.getMacSize()];
		hmac.doFinal(hmacMD5Bytes, 0);
		System.out.println("bc hmacMD5:"+Hex.toHexString(hmacMD5Bytes));
	}
	
	/**
	 * 消息摘要算法
	 * MAC算法应用
	 * 1.发布消息摘要算法
	 * 2.构建密钥
	 * 3.发送密钥
	 * 4.对待发消息进行摘要处理
	 * 5.发送消息摘要
	 * 6.发送消息
	 * 7.消息鉴别
	 */
}
