package org.pussinboots.morning.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.math.BigInteger;
import java.security.InvalidParameterException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.Provider;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.RSAPublicKeySpec;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
* 项目名称：morning-common   
* 类名称：RSAUtils   
* 类描述：RSAUtils工具类：提供一些RSA算法加密/解密的方法        
* 创建人：陈星星   
* 创建时间：2017年4月1日 上午1:18:59   
*
 */
public class RSAUtils {

    private static final Logger logger = LoggerFactory.getLogger(RSAUtils.class);

	/** 算法名称 */
	private static final String ALGORITHOM = "RSA";
	/** 保存生成的密钥对的文件名称 */
	private static final String RSA_PAIR_FILENAME = "/MORNING_RSA_PAIR.txt";
	/** 密钥大小 */
	private static final int KEY_SIZE = 1024;
	/** 默认的安全服务提供者 */
	private static final Provider DEFAULT_PROVIDER = new BouncyCastleProvider();
	/** 用于生成公钥和私钥对 */
	private static KeyPairGenerator keyPairGenerator = null;
	/** 密钥工厂用于将密钥（Key 类型的不透明加密密钥）转换成密钥规范（底层密钥材料的透明表示） */
	private static KeyFactory keyFactory = null;
	/** 缓存的密钥对 */
	private static KeyPair oneKeyPair = null;

	private static File rsaPairFile = null;

	static {
		try {
			keyPairGenerator = KeyPairGenerator.getInstance(ALGORITHOM,DEFAULT_PROVIDER);//返回生成指定算法的 public/private 密钥对的 KeyPairGenerator 对象
			keyFactory = KeyFactory.getInstance(ALGORITHOM, DEFAULT_PROVIDER);//返回转换指定算法的 public/private 关键字的 KeyFactory 对象
		} catch (NoSuchAlgorithmException ex) {
			logger.error("RSAUtils.static",ex);
		}
		rsaPairFile = new File(getRSAPairFilePath());
	}

    private RSAUtils() { 
		throw new AssertionError();
    }

	/**
     * 生成并返回RSA密钥对
     */
    private static synchronized KeyPair generateKeyPair() {
        try {
        	keyPairGenerator.initialize(KEY_SIZE, new SecureRandom(DateFormatUtils.format(new Date(),"yyyyMMdd").getBytes()));//使用给定的随机源（和默认的参数集合）初始化确定密钥大小的密钥对生成器 
            oneKeyPair = keyPairGenerator.generateKeyPair();//生成一个密钥对
            saveKeyPair(oneKeyPair);
            return oneKeyPair;
        } catch (InvalidParameterException ex) { //当将无效参数传递给某个方法时抛出此异常，设计该异常供 JCA/JCE 引擎类使用
            logger.error("KeyPairGenerator does not support a key length of " + KEY_SIZE + ".", ex);
        } catch (NullPointerException ex) {//当应用程序试图在需要对象的地方使用 null 时，抛出该异常
            logger.error("RSAUtils#KEY_PAIR_GEN is null, can not generate KeyPairGenerator instance.",ex);
        }
        return null;
    }

	/**
	 * 返回生成/读取的密钥对文件的路径
	 */
	private static String getRSAPairFilePath() {
		String urlPath = RSAUtils.class.getResource("/").getPath();
		return new File(urlPath).getParent() + File.separator + RSA_PAIR_FILENAME;
	}
    
    /**
     * 若需要创建新的密钥对文件，则返回 {@code true}，否则 {@code false}
     */
	private static boolean isCreateKeyPairFile() {
		// 是否创建新的密钥对文件
		boolean createNewKeyPair = false;
		if (!rsaPairFile.exists() || rsaPairFile.isDirectory()) {
			createNewKeyPair = true;
		}
		return createNewKeyPair;
	}

    /**
     * 将指定的RSA密钥对以文件形式保存
     * @param keyPair 要保存的密钥对
     */
	private static void saveKeyPair(KeyPair keyPair) {
		FileOutputStream fileOutputStream = null;
		ObjectOutputStream objectOutputStream = null;
		try {
			fileOutputStream = FileUtils.openOutputStream(rsaPairFile);
			objectOutputStream = new ObjectOutputStream(fileOutputStream);
			objectOutputStream.writeObject(keyPair);
		} catch (Exception ex) {
			logger.error("RSAUtils.saveKeyPair", ex);
		} finally {
			IOUtils.closeQuietly(objectOutputStream);
			IOUtils.closeQuietly(fileOutputStream);
		}
	}

    /**
     * 返回RSA密钥对
     */
	public static KeyPair getKeyPair() {
		// 首先判断是否需要重新生成新的密钥对文件
		if (isCreateKeyPairFile()) {
			// 直接强制生成密钥对文件，并存入缓存
			return generateKeyPair();
		}
		if (oneKeyPair != null) {
			return oneKeyPair;
		}
		return readKeyPair();
	}
    
    // 同步读出保存的密钥对
	private static KeyPair readKeyPair() {
		FileInputStream fileInputStream = null;
		ObjectInputStream objectInputStream = null;
		try {
			fileInputStream = FileUtils.openInputStream(rsaPairFile);
			objectInputStream = new ObjectInputStream(fileInputStream);
			oneKeyPair = (KeyPair) objectInputStream.readObject();
			return oneKeyPair;
		} catch (Exception ex) {
			logger.error("RSAUtils.readKeyPair", ex);
		} finally {
			IOUtils.closeQuietly(objectInputStream);
			IOUtils.closeQuietly(fileInputStream);
		}
		return null;
	}

    /**
     * 根据给定的系数和专用指数构造一个RSA专用的公钥对象
     * @param modulus 系数
     * @param publicExponent 专用指数
     * @return RSA专用公钥对象
     */
	public static RSAPublicKey generateRSAPublicKey(byte[] modulus, byte[] publicExponent) {
		RSAPublicKeySpec publicKeySpec = new RSAPublicKeySpec(new BigInteger(modulus), new BigInteger(publicExponent));// 创建一个新的RSAPublicKeySpec
		try {
			return (RSAPublicKey) keyFactory.generatePublic(publicKeySpec);// 根据提供的密钥规范（密钥材料）生成公钥对象
		} catch (InvalidKeySpecException ex) {
			logger.error("RSAPublicKeySpec is unavailable.", ex);
		} catch (NullPointerException ex) {
			logger.error("RSAUtils#KEY_FACTORY is null, can not generate KeyFactory instance.", ex);
		}
		return null;
	}

    /**
     * 根据给定的系数和专用指数构造一个RSA专用的私钥对象
     * @param modulus 系数
     * @param privateExponent 专用指数
     * @return RSA专用私钥对象
     */
	public static RSAPrivateKey generateRSAPrivateKey(byte[] modulus, byte[] privateExponent) {
		RSAPrivateKeySpec privateKeySpec = new RSAPrivateKeySpec(new BigInteger(modulus),
				new BigInteger(privateExponent));
		try {
			return (RSAPrivateKey) keyFactory.generatePrivate(privateKeySpec);
		} catch (InvalidKeySpecException ex) {
			logger.error("RSAPrivateKeySpec is unavailable.", ex);
		} catch (NullPointerException ex) {
			logger.error("RSAUtils#KEY_FACTORY is null, can not generate KeyFactory instance.", ex);
		}
		return null;
	}
    
    /**
     * 根据给定的16进制系数和专用指数字符串构造一个RSA专用的私钥对象
     * @param modulus 系数
     * @param privateExponent 专用指数
     * @return RSA专用私钥对象
     */
	public static RSAPrivateKey getRSAPrivateKey(String hexModulus, String hexPrivateExponent) {
		if (StringUtils.isBlank(hexModulus) || StringUtils.isBlank(hexPrivateExponent)) {
			if (logger.isDebugEnabled()) {
				logger.debug(
						"hexModulus and hexPrivateExponent cannot be empty. RSAPrivateKey value is null to return.");
			}
			return null;
		}
		byte[] modulus = null;
		byte[] privateExponent = null;
		try {
			modulus = Hex.decodeHex(hexModulus.toCharArray());
			privateExponent = Hex.decodeHex(hexPrivateExponent.toCharArray());
		} catch (DecoderException ex) {
			logger.error("hexModulus or hexPrivateExponent value is invalid. return null(RSAPrivateKey).", ex);
		}
		if (modulus != null && privateExponent != null) {
			return generateRSAPrivateKey(modulus, privateExponent);
		}
		return null;
	}
    
    /**
     * 根据给定的16进制系数和专用指数字符串构造一个RSA专用的公钥对象
     * 
     * @param modulus 系数
     * @param publicExponent 专用指数
     * @return RSA专用公钥对象
     */
	public static RSAPublicKey getRSAPublidKey(String hexModulus, String hexPublicExponent) {
		if (StringUtils.isBlank(hexModulus) || StringUtils.isBlank(hexPublicExponent)) {
			if (logger.isDebugEnabled()) {
				logger.debug("hexModulus and hexPublicExponent cannot be empty. return null(RSAPublicKey).");
			}
			return null;
		}
		byte[] modulus = null;
		byte[] publicExponent = null;
		try {
			modulus = Hex.decodeHex(hexModulus.toCharArray());
			publicExponent = Hex.decodeHex(hexPublicExponent.toCharArray());
		} catch (DecoderException ex) {
			logger.error("hexModulus or hexPublicExponent value is invalid. return null(RSAPublicKey).", ex);
		}
		if (modulus != null && publicExponent != null) {
			return generateRSAPublicKey(modulus, publicExponent);
		}
		return null;
	}

    /**
     * 使用指定的公钥加密数据
     * @param publicKey 给定的公钥
     * @param data 要加密的数据
     * @return 加密后的数据
     */
	public static byte[] encrypt(PublicKey publicKey, byte[] data) throws Exception {
		Cipher ci = Cipher.getInstance(ALGORITHOM, DEFAULT_PROVIDER);// Cipher类为加密和解密提供密码功能，通过getinstance实例化对象
		ci.init(Cipher.ENCRYPT_MODE, publicKey);// 用密钥初始化此 Cipher
		return ci.doFinal(data);// 按单部分操作加密或解密数据，或者结束一个多部分操作
	}

    /**
     * 使用指定的私钥解密数据
     * @param privateKey 给定的私钥
     * @param data 要解密的数据
     * @return 原数据
     */
	public static byte[] decrypt(PrivateKey privateKey, byte[] data) throws Exception {
		Cipher ci = Cipher.getInstance(ALGORITHOM, DEFAULT_PROVIDER);
		ci.init(Cipher.DECRYPT_MODE, privateKey);
		return ci.doFinal(data);
	}

    /**
     * 使用给定的公钥加密给定的字符串
     * 若 {@code publicKey} 为 {@code null}，或者 {@code plaintext} 为 {@code null} 则返回 {@code null}
     * @param publicKey 给定的公钥
     * @param plaintext 字符串
     * @return 给定字符串的密文
     */
	public static String encryptString(PublicKey publicKey, String plaintext) {
		if (publicKey == null || plaintext == null) {
			return null;
		}
		byte[] data = plaintext.getBytes();
		try {
			byte[] enData = encrypt(publicKey, data);
			return new String(Hex.encodeHex(enData));
		} catch (Exception ex) {
			logger.error("RSAUtils.encryptString", ex);
		}
		return null;
	}
    
    /**
     * 使用默认的公钥加密给定的字符串
     * 若{@code plaintext} 为 {@code null} 则返回 {@code null}
     * @param plaintext 字符串
     * @return 给定字符串的密文
     */
	public static String encryptString(String plaintext) {
		if (plaintext == null) {
			return null;
		}
		byte[] data = plaintext.getBytes();
		KeyPair keyPair = getKeyPair();
		try {
			byte[] enData = encrypt((RSAPublicKey) keyPair.getPublic(), data);
			return new String(Hex.encodeHex(enData));
		} catch (NullPointerException ex) {
			logger.error("keyPair cannot be null.", ex);
		} catch (Exception ex) {
			logger.error("RSAUtils.encryptString", ex);
		}
		return null;
	}

    /**
     * 使用给定的私钥解密给定的字符串
     * 若私钥为 {@code null}，或者 {@code encrypttext} 为 {@code null}或空字符串则返回 {@code null}
     * 私钥不匹配时，返回 {@code null}
     * @param privateKey 给定的私钥
     * @param encrypttext 密文
     * @return 原文字符串
     */
	public static String decryptString(PrivateKey privateKey, String encrypttext) {
		if (privateKey == null || StringUtils.isBlank(encrypttext)) {
			return null;
		}
		try {
			byte[] enData = Hex.decodeHex(encrypttext.toCharArray());
			byte[] data = decrypt(privateKey, enData);
			return new String(data);
		} catch (Exception ex) {
			logger.error("RSAUtils.decryptString", ex);
			logger.error(String.format("\"%s\" Decryption failed. Cause: %s", encrypttext, ex.getCause().getMessage()));
		}
		return null;
	}
    
    /**
     * 使用默认的私钥解密给定的字符串
     * 若{@code encrypttext} 为 {@code null}或空字符串则返回 {@code null}
     * 私钥不匹配时，返回 {@code null}
     * @param encrypttext 密文
     * @return 原文字符串
     */
	public static String decryptString(String encrypttext) {
		if (StringUtils.isBlank(encrypttext)) {
			return null;
		}
		KeyPair keyPair = getKeyPair();
		try {
			byte[] enData = Hex.decodeHex(encrypttext.toCharArray());
			byte[] data = decrypt((RSAPrivateKey) keyPair.getPrivate(), enData);
			return new String(data);
		} catch (NullPointerException ex) {
			logger.error("keyPair cannot be null.", ex);
		} catch (Exception ex) {
			logger.error("RSAUtils.decryptString", ex);
			logger.error(String.format("\"%s\" Decryption failed. Cause: %s", encrypttext, ex.getMessage()));
		}
		return null;
	}
    
    /**
     * 使用默认的私钥解密由JS加密（使用此类提供的公钥加密）的字符串
     * @param encrypttext 密文
     * @return {@code encrypttext} 的原文字符串
     */
	public static String decryptStringByJs(String encrypttext) {
		String text = decryptString(encrypttext);
		if (text == null) {
			return null;
		}
		return StringUtils.reverse(text);
	}
    
	/** 返回已初始化的默认的公钥 */
	public static RSAPublicKey getDefaultPublicKey() {
		KeyPair keyPair = getKeyPair();
		if (keyPair != null) {
			return (RSAPublicKey) keyPair.getPublic();
		}
		return null;
	}
    
	/** 返回已初始化的默认的私钥 */
	public static RSAPrivateKey getDefaultPrivateKey() {
		KeyPair keyPair = getKeyPair();
		if (keyPair != null) {
			return (RSAPrivateKey) keyPair.getPrivate();
		}
		return null;
	}
    
    /**
     * 返回公钥
     * @return  Map<"modulus","exponent">
     */
    public static Map<String, Object> getPublicKeyMap() {
    	Map<String, Object> publicKeyMap = new HashMap<>();
    	RSAPublicKey rsaPublicKey = getDefaultPublicKey();
    	publicKeyMap.put("modulus", new String(Hex.encodeHex(rsaPublicKey.getModulus().toByteArray())));
    	publicKeyMap.put("exponent", new String(Hex.encodeHex(rsaPublicKey.getPublicExponent().toByteArray())));
		return publicKeyMap;
    }
}