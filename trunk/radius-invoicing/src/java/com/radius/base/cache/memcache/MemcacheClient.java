package com.radius.base.cache.memcache;

import org.apache.log4j.Logger;

import net.spy.memcached.MemcachedClient;


/**
 * @author xianchao.sun@downjoy.com
 * @date 2012-5-7
 *
 */
public abstract class MemcacheClient {

    protected static final Logger logger=Logger.getLogger(MemcacheClient.class);
    
    public static final String SPLIT_STR="_";
    
    public static MemcachedClient getCacheInstance(String key) throws Exception {
        return MemcachedClientFactory.getMemcachedClient(key);
    }
    
    public static String getMemcachedKey(String keyName) {
        StringBuilder tmp=new StringBuilder();
        tmp.append(keyName.hashCode()).append(SPLIT_STR).append(getHashCode(keyName));
        if(keyName.length() > 2) {
            int mid=keyName.length() / 2;
            tmp.append(SPLIT_STR).append(keyName.substring(0, mid).hashCode());
            tmp.append(SPLIT_STR).append(keyName.substring(mid).hashCode());
        }
        return tmp.toString();
    }

    /**
     * 生成字符串的HashCode
     * @param buf
     * @return
     */
    public static int getHashCode(String buf) {
        int hash=5381;
        int len=buf.length();

        while(len-- > 0) {
            hash=((hash << 5) + hash) + buf.charAt(len); /* hash * 33 + c */
        }
        return hash;
    }

    public static Object get(String keyName){
        String key=getMemcachedKey(keyName);
        try{
            MemcachedClient client=getCacheInstance(key);
            return client.get(key);
        }catch(Exception ex){
            logger.error(ex.getMessage(), ex);
        }
        return null;
    }

    public static void set(String keyName, Object value, int exp) {
        if(keyName == null || value == null) {
            return;
        }
        String key=getMemcachedKey(keyName);
        try{
            MemcachedClient client=getCacheInstance(key);
            client.set(key, exp, value);
        }catch(Exception ex){
            logger.error(ex.getMessage(), ex);
        }
    }

    public static void delete(String keyName) {
        String key=getMemcachedKey(keyName);
        try{
            MemcachedClient client=getCacheInstance(key);
            client.delete(key);
        }catch(Exception ex){
            logger.error(ex.getMessage(), ex);
        }
    }

    public static void delete(String[] keys) throws Exception {
        if(keys == null) {
            return;
        }
        String key=null;
        for(int i=0; i < keys.length; i++) {
            key=keys[i];
            delete(key);
        }
    }
}
