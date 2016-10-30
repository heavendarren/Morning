package security;

import org.apache.commons.codec.binary.Base64;



public class MorningBase64 {

	private static String src = "morning security base64";
	
	public static void main(String[] args) {
		commonsCodecBase64();
		bouncyCastleBase64();
	}
	
	
	/**
	 * jdkBase64
	 */
	public static void jdkBase64(){
		
	}
	
	/**
	 * commonsCodecBase64
	 */
	public static void commonsCodecBase64(){
		byte[] encodeBytes = Base64.encodeBase64(src.getBytes());
		System.out.println("encode:"+new String(encodeBytes));
		
		byte[] decodeBytes = Base64.decodeBase64(encodeBytes);
		System.out.println("decode:"+new String(decodeBytes));
	}
	
	/**
	 * bouncyCastleBase64
	 */
	public static void bouncyCastleBase64(){
		byte[] encodeBytes = org.bouncycastle.util.encoders.Base64.encode(src.getBytes());
		System.out.println("encode:"+new String(encodeBytes));
		
		byte[] decodeBytes = org.bouncycastle.util.encoders.Base64.decode(encodeBytes);
		System.out.println("decode:"+new String(decodeBytes));
	}
	
	
	/**
	 * Base64算法
	 * 基于64个字符的编码算法
	 * Base64算法与加密算法（基于64字符替换的算法）
	 */

}
