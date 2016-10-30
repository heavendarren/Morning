package security;

import java.security.Key;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Hex;

public class MorningAES {

	private static String src = "morning security aes";

	public static void main(String[] args) {
		jdkAES();
	}
	
	public static void jdkAES(){
		try {
			//生成key
			KeyGenerator keyGenerator = KeyGenerator.getInstance("AES");//初始化KeyGenerator
			keyGenerator.init(new SecureRandom());
			SecretKey secretkey = keyGenerator.generateKey();//产生密钥
			byte[] keyBytes = secretkey.getEncoded();//获得密钥
			
			//key转换
			Key key = new SecretKeySpec(keyBytes, "AES");
			
			//加密
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, key);  //模式，key转换
			byte[] desBytes = cipher.doFinal(src.getBytes());
			System.out.println("jdk aes-加密:"+ Hex.encodeHexString(desBytes));
			
			//解密
			cipher.init(Cipher.DECRYPT_MODE, key);
			desBytes = cipher.doFinal(desBytes);
			System.out.println("jkd aes-解密："+new String(desBytes));
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

}
