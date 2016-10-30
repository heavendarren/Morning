package security;

import java.security.SecureRandom;
import java.security.Security;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.DESedeKeySpec;

import org.apache.commons.codec.binary.Hex;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

public class MorningDES {
	
	private static String src = "morning security des";
	
	public static void main(String[] args) {
		jdkDES();
		bcDES();
		jdk3DES();
	}
	
	/**
	 * jdkDES()
	 */
	public static void jdkDES(){
		try {
			KeyGenerator keyGenerator = KeyGenerator.getInstance("DES");//初始化KeyGenerator
			keyGenerator.init(56);
			SecretKey secretkey = keyGenerator.generateKey();//产生密钥
			byte[] key = secretkey.getEncoded();//获得密钥
			
			//key转换
			DESKeySpec desKeySpec = new DESKeySpec(key);
			SecretKeyFactory factory = SecretKeyFactory.getInstance("DES");
			SecretKey convertSecretkey = factory.generateSecret(desKeySpec);
			
			//加密
			Cipher cipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, convertSecretkey);  //模式，key转换
			byte[] desBytes = cipher.doFinal(src.getBytes());
			System.out.println("jdk des-加密:"+ Hex.encodeHexString(desBytes));
			
			//解密
			cipher.init(Cipher.DECRYPT_MODE, convertSecretkey);
			desBytes = cipher.doFinal(desBytes);
			System.out.println("jkd des-解密："+new String(desBytes));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * bcDES()
	 */
	public static void bcDES(){
		try {
			Security.addProvider(new BouncyCastleProvider());
			
			KeyGenerator keyGenerator = KeyGenerator.getInstance("DES","BC");//初始化KeyGenerator
			keyGenerator.init(56);
			SecretKey secretkey = keyGenerator.generateKey();//产生密钥
			byte[] key = secretkey.getEncoded();//获得密钥
			
			//key转换
			DESKeySpec desKeySpec = new DESKeySpec(key);
			SecretKeyFactory factory = SecretKeyFactory.getInstance("DES");
			SecretKey convertSecretkey = factory.generateSecret(desKeySpec);
			
			//加密
			Cipher cipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, convertSecretkey);  //模式，key转换
			byte[] desBytes = cipher.doFinal(src.getBytes());
			System.out.println("bc des-加密:"+ Hex.encodeHexString(desBytes));
			
			//解密
			cipher.init(Cipher.DECRYPT_MODE, convertSecretkey);
			desBytes = cipher.doFinal(desBytes);
			System.out.println("bc des-解密："+new String(desBytes));
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	/**
	 * 对称加密算法
	 * DES
	 * 1.构建密钥
	 * 2.公布密钥
	 * 3.使用密钥对数据加密
	 * 4.发送加密数据
	 * 5.使用密钥对数据解密
	 */
	
	/**
	 * jdk3DES()
	 */
	public static void jdk3DES(){
		try {
			KeyGenerator keyGenerator = KeyGenerator.getInstance("DESede");//初始化KeyGenerator
//			keyGenerator.init(168);
			keyGenerator.init(new SecureRandom());
			SecretKey secretkey = keyGenerator.generateKey();//产生密钥
			byte[] key = secretkey.getEncoded();//获得密钥
			
			//key转换
			DESedeKeySpec desKeySpec = new DESedeKeySpec(key);
			SecretKeyFactory factory = SecretKeyFactory.getInstance("DESede");
			SecretKey convertSecretkey = factory.generateSecret(desKeySpec);
			
			//加密
			Cipher cipher = Cipher.getInstance("DESede/ECB/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, convertSecretkey);  //模式，key转换
			byte[] desBytes = cipher.doFinal(src.getBytes());
			System.out.println("jdk 3des-加密:"+ Hex.encodeHexString(desBytes));
			
			//解密
			cipher.init(Cipher.DECRYPT_MODE, convertSecretkey);
			desBytes = cipher.doFinal(desBytes);
			System.out.println("jkd 3des-解密："+new String(desBytes));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
