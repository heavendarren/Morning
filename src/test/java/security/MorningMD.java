package security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Security;

import org.apache.commons.codec.binary.Hex;
import org.apache.commons.codec.digest.DigestUtils;
import org.bouncycastle.crypto.Digest;
import org.bouncycastle.crypto.digests.MD4Digest;
import org.bouncycastle.crypto.digests.MD5Digest;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

public class MorningMD {
	
	private static String src = "morning security md";
	
	public static void main(String[] args) {
		jdkMD2();
		jdkMD5();
		bcMD4();
		bcMD5();
		ccMD5();
		bcMD4ToJdk();
	}
	
	/**
	 * jdkMD5
	 */
	public static void jdkMD2(){
		try {
			MessageDigest md = MessageDigest.getInstance("MD2");
			byte[] md5bytes = md.digest(src.getBytes());
			System.out.println("jdkMD2:"+Hex.encodeHexString(md5bytes));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}

	/**
	 * jdkMD5
	 */
	public static void jdkMD5(){
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] md5bytes = md.digest(src.getBytes());
			System.out.println("jdkMD5:"+Hex.encodeHexString(md5bytes));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * bcMD4
	 */
	public static void bcMD4(){
		Digest digest = new MD4Digest();
		digest.update(src.getBytes(),0, src.getBytes().length);
		byte[] md4bytes = new byte[digest.getDigestSize()];
		digest.doFinal(md4bytes, 0);
		System.out.println("bcMD4:"+org.bouncycastle.util.encoders.Hex.toHexString(md4bytes));
	}
	
	/**
	 * bcMD4 to jdk
	 */
	public static void bcMD4ToJdk(){
		try {
			Security.addProvider(new BouncyCastleProvider());
			MessageDigest md = MessageDigest.getInstance("MD4");
			byte[] md4bytes = md.digest(src.getBytes());
			System.out.println("jdkMD4ToJdk:"+Hex.encodeHexString(md4bytes));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} 
	}
	
	/**
	 * bcMD5
	 */
	public static void bcMD5(){
		Digest digest = new MD5Digest();
		digest.update(src.getBytes(),0, src.getBytes().length);
		byte[] md5bytes = new byte[digest.getDigestSize()];
		digest.doFinal(md5bytes, 0);
		System.out.println("bcMD5:"+org.bouncycastle.util.encoders.Hex.toHexString(md5bytes));
	}
	
	/**
	 * ccMD5
	 */
	public static void ccMD5(){
		System.out.println("ccMD5:"+DigestUtils.md5Hex(src.getBytes()));
	}
	
	
	/**
	 * 消息摘要算法
	 * MD5算法应用
	 * 1.用户注册→2.对密码进行信息摘要→3.信息持久化（用户名：明文;密码：密文）→4.返回注册结果
	 * 1.用户登录→2.对密码进行信息摘要→3.通过用户名及（密码）摘要查询→4.返回登录结果
	 * 常用网站密码处理方法
	 */
}
