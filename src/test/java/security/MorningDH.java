package security;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.X509EncodedKeySpec;
import java.util.Objects;

import javax.crypto.Cipher;
import javax.crypto.KeyAgreement;
import javax.crypto.SecretKey;
import javax.crypto.interfaces.DHPublicKey;
import javax.crypto.spec.DHParameterSpec;


public class MorningDH {

	
	private static String src = "morning security dh";

	
	public static void main(String[] args) {
		jdkDH();
	}
	
	public static void jdkDH(){
		try {
			//1.初始化密钥发送发密钥
			KeyPairGenerator senderKeyPairGenerator = KeyPairGenerator.getInstance("DH");
			senderKeyPairGenerator.initialize(512);
			KeyPair senderKeyPair = senderKeyPairGenerator.generateKeyPair();
			byte[] senderPublicKerEnc = senderKeyPair.getPublic().getEncoded();//发送发公钥，发送给接收方（网络、文件）
			
			//2.初始化接收方密钥
			KeyFactory receiverkeyFactory = KeyFactory.getInstance("DH");
			X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(senderPublicKerEnc);
			PublicKey receiverPublicKey = receiverkeyFactory.generatePublic(x509EncodedKeySpec);
			DHParameterSpec dhParameterSpec = ((DHPublicKey)receiverPublicKey).getParams();
			KeyPairGenerator receiverKeyPairGenerator = KeyPairGenerator.getInstance("DH");
			receiverKeyPairGenerator.initialize(dhParameterSpec);
			KeyPair receiverKeyPair = receiverKeyPairGenerator.generateKeyPair();
			PrivateKey receiverPrivateKey = receiverKeyPair.getPrivate();
			byte[] receiverPulicKeyEnc = receiverKeyPair.getPublic().getEncoded();
			
			//3.密钥构建
			KeyAgreement receiverKeyAgreement = KeyAgreement.getInstance("DH");
			receiverKeyAgreement.init(receiverPrivateKey);
			receiverKeyAgreement.doPhase(receiverPublicKey, true);
			SecretKey receiverSecretKey = receiverKeyAgreement.generateSecret("DES");
			
			KeyFactory senderKeyFactory = KeyFactory.getInstance("DH");
			x509EncodedKeySpec = new X509EncodedKeySpec(receiverPulicKeyEnc);
			PublicKey senderPublicKey = senderKeyFactory.generatePublic(x509EncodedKeySpec);
			KeyAgreement senderKeyAgreement = KeyAgreement.getInstance("DH");
			senderKeyAgreement.init(senderKeyPair.getPrivate());
			senderKeyAgreement.doPhase(senderPublicKey, true);
			SecretKey senderSecretKey = senderKeyAgreement.generateSecret("DES");
			if(Objects.equals(receiverSecretKey, senderSecretKey)){
				System.out.println("双方密钥相同");
			}
			
			//4.加密
			Cipher cipher = Cipher.getInstance("DES");
			cipher.init(Cipher.ENCRYPT_MODE, senderSecretKey);
			byte[] result = cipher.doFinal(src.getBytes());
			System.out.println("jdk dh eccrypt:"+ org.apache.commons.codec.binary.Base64.encodeBase64String(result));
			
			
			//5.解密
			cipher.init(Cipher.DECRYPT_MODE, receiverSecretKey);
			result = cipher.doFinal(result);
			System.out.println("jdk dh decrypt:"+ new String(result));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 非对称加密算法
	 * DH（密钥交换）
	 初始化DH算法密钥对
	 * 1.构建发送发密钥
	 * 2.公布发送方密钥
	 * 3.使用发送发密钥构建自己的密钥
	 * 4.公布接收方公钥
	 * 
	 * DH算法加密消息传递
	 * 1.使用本地密钥加密消息
	 * 2.发送加密消息
	 * 3.使用本地密钥解密
	 */

}
