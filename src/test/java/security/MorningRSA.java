package security;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.interfaces.RSAPrivateCrtKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

import javax.crypto.Cipher;

public class MorningRSA {

	private static String src = "morning security rsa";
	
	public static void main(String[] args) {
		jdkRSA();
	}
	
	public static void jdkRSA(){
		try {
			//1.初始化密钥
			KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
			keyPairGenerator.initialize(512);//秘钥长度 
			KeyPair keyPair = keyPairGenerator.generateKeyPair();//初始化秘钥对 
			RSAPublicKey rsaPublicKey = (RSAPublicKey) keyPair.getPublic();//公钥  
			RSAPrivateCrtKey rsaPrivateKey = (RSAPrivateCrtKey) keyPair.getPrivate();//公钥  
			System.out.println("Public Key:"+org.apache.commons.codec.binary.Base64.encodeBase64String(rsaPublicKey.getEncoded()));
			System.out.println("Private Key:"+org.apache.commons.codec.binary.Base64.encodeBase64String(rsaPrivateKey.getEncoded()));
			
			//2.私钥加密、公钥解密——加密
			PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(rsaPrivateKey.getEncoded());//生成私钥  
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			PrivateKey privateKey = keyFactory.generatePrivate(pkcs8EncodedKeySpec);
			Cipher cipher = Cipher.getInstance("RSA");//Cipher类为加密和解密提供密码功能，通过getinstance实例化对象  
			cipher.init(Cipher.ENCRYPT_MODE, privateKey);//初始化加密  
			byte[] result = cipher.doFinal(src.getBytes());
			System.out.println("私钥加密、公钥解密——加密:"+org.apache.commons.codec.binary.Base64.encodeBase64String(result)); 
			
			//2.私钥加密、公钥解密——解密
			X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(rsaPublicKey.getEncoded());//生成公钥
			keyFactory = KeyFactory.getInstance("RSA");
			PublicKey publicKey =keyFactory.generatePublic(x509EncodedKeySpec);
			cipher =Cipher.getInstance("RSA");
			cipher.init(Cipher.DECRYPT_MODE, publicKey);//初始化解密 
			result = cipher.doFinal(result);
			System.out.println("私钥加密、公钥解密——解密:"+ new String(result));

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 非对称加密算法
	 * RSA（基于因子分解）
	 * RSA算法传输数据-1：私钥加密、公钥解密
	 * 1.使用私钥加密数据
	 * 2.发送加密数据
	 * 3.使用公钥解密数据
	 * 
	 * RSA算法传输数据-2：公钥加密、私钥解密
	 * 1.使用公钥加密数据
	 * 2.发送加密数据
	 * 3.使用私钥解密数据
	 */

}