/**
 * 
 */
package com.radius.base.utils;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

/**
 * @author boning.cheng
 *
 *
 */
public class DESUtils {

	public static final String KEY_ALGORITHM="DES";
	
	public static final String	CIPHER_ALGORTHM="DES/ECB/PKCS5Padding";
	
	public static Key getKey(byte[] key)throws Exception{
		//实例化DES秘钥材料
		DESKeySpec dks=new DESKeySpec(key);
		//实例化秘钥工厂
		SecretKeyFactory keyFactory=SecretKeyFactory.getInstance(KEY_ALGORITHM);
		//生成秘钥
		SecretKey secretKey=keyFactory.generateSecret(dks);
		
		return secretKey;
	} 
	
	/**
	 * 解密
	 * @param data
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static byte[] decrypt(byte[] data,byte[] key)throws Exception{
		//获取钥匙对象
		Key k=getKey(key);
		//实例化
		Cipher cipher=Cipher.getInstance(CIPHER_ALGORTHM);
		//初始化,设置为解密模式
		cipher.init(Cipher.DECRYPT_MODE, k);
		return cipher.doFinal(data);
	}
	
	/**
	 * 加密
	 * @param data
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static byte[] encrypt(byte[]data,byte[]key)throws Exception {
		Key k=getKey(key);
		Cipher cipher=Cipher.getInstance(CIPHER_ALGORTHM);
		cipher.init(Cipher.DECRYPT_MODE, k);
		return cipher.doFinal(data);
	}
	/**
	 * 生成秘钥
	 * @return
	 * @throws Exception
	 */
	public static byte[] initKey()throws Exception{
		
		KeyGenerator kg=KeyGenerator.getInstance(KEY_ALGORITHM);
		kg.init(56);
		SecretKey secretKey=kg.generateKey();
		return secretKey.getEncoded();
	}
}
