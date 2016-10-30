package security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Security;

import org.bouncycastle.crypto.Digest;
import org.bouncycastle.crypto.digests.SHA1Digest;
import org.bouncycastle.crypto.digests.SHA224Digest;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.util.encoders.Hex;

public class MorningSHA {
	
	private static String src = "morning security sha";
	
	public static void main(String[] args) {
		jdkSHA1();
		bcSHA1();
		bvSHA224();
		bvSHA224_2();
	}
	
	/**
	 * jdkSHA1
	 */
	public static void jdkSHA1(){
		try {
			MessageDigest md =MessageDigest.getInstance("SHA");
			md.update(src.getBytes());
			System.out.println("jds SHA-1:"+org.apache.commons.codec.binary.Hex.encodeHexString(md.digest()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * bcSHA1
	 */
	public static void bcSHA1(){
		Digest digest = new SHA1Digest();
		digest.update(src.getBytes(), 0, src.getBytes().length);
		byte[] sha1Bytes = new byte[digest.getDigestSize()];
		digest.doFinal(sha1Bytes, 0);
		System.out.println("bc SHA-1:"+Hex.toHexString(sha1Bytes));
	}
	
	/**
	 * bvSHA224
	 */
	public static void bvSHA224(){
		Digest digest = new SHA224Digest();
		digest.update(src.getBytes(), 0, src.getBytes().length);
		byte[] sha224Bytes = new byte[digest.getDigestSize()];
		digest.doFinal(sha224Bytes, 0);
		System.out.println("bc SHA-224:"+Hex.toHexString(sha224Bytes));
	}
	
	/**
	 * bvSHA224_2   to jdk
	 */
	public static void bvSHA224_2(){
		try {
			Security.addProvider(new BouncyCastleProvider());
			MessageDigest md = MessageDigest.getInstance("SHA224");
			md.update(src.getBytes());
			System.out.println("jds SHA-224:"+org.apache.commons.codec.binary.Hex.encodeHexString(md.digest()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 消息摘要算法
	 * SHA算法应用
	 * 1.公布消息摘要算法
	 * 2.对待发布的消息进行摘要处理
	 * 3.发布摘要信息
	 * 4.发送信息
	 * 5.消息鉴别
	 */

}
