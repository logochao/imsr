package com.radius.base.cache.memcache;

import java.net.InetSocketAddress;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import net.spy.memcached.MemcachedClient;


/**
 * memcachedClient 工厂类 主要生成MemcachedClient对象
 * @author xianchao.sun@downjoy.com
 * @date 2012-5-4
 */
public abstract class MemcachedClientFactory {

    private static volatile Map<Integer, MemcachedClient> map=new ConcurrentHashMap<Integer, MemcachedClient>();

    private static final Object locker=new Object();

    /**
     * 获得memcache客户端。
     * @param key
     * @return MemcachedClient
     * @throws Exception
     */
    public static MemcachedClient getMemcachedClient(String key) throws Exception {
        MemcachedClient client=null;
        try {
            key=(null == key) ? "" : key;
            int hash=Math.abs(key.hashCode());
            String[] address=getAddress();
            Integer clientKey=hash % address.length;
            client=map.get(clientKey);
            if(client == null) { // 是否MemcachedClient获取到
                synchronized(locker) {
                    client=map.get(clientKey);
                    if(client == null) { // 是否MemcachedClient获取到
                        String hostname=address[clientKey].split(":")[0];
                        String port=address[clientKey].split(":")[1];
                        client=new MemcachedClient(new InetSocketAddress(hostname, Integer.valueOf(port)));
                        map.put(clientKey, client);
                    }
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return client;
    }

    public static String[] getAddress() throws Exception {
//        String address="115.182.10.143:11211";
        String address="127.0.01:11211";
        if(null == address) {
            throw new Exception("no memcache.client.address property");
        }
        return address.split(",");
    }
}
