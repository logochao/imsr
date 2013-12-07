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
		//ʵ����DES��Կ����
		DESKeySpec dks=new DESKeySpec(key);
		//ʵ������Կ����
		SecretKeyFactory keyFactory=SecretKeyFactory.getInstance(KEY_ALGORITHM);
		//������Կ
		SecretKey secretKey=keyFactory.generateSecret(dks);
		
		return secretKey;
	} 
	
	/**
	 * ����
	 * @param data
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static byte[] decrypt(byte[] data,byte[] key)throws Exception{
		//��ȡԿ�׶���
		Key k=getKey(key);
		//ʵ����
		Cipher cipher=Cipher.getInstance(CIPHER_ALGORTHM);
		//��ʼ��,����Ϊ����ģʽ
		cipher.init(Cipher.DECRYPT_MODE, k);
		return cipher.doFinal(data);
	}
	
	/**
	 * ����
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
	 * ������Կ
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
