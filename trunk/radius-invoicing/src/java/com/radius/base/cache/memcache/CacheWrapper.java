package com.radius.base.cache.memcache;

import java.io.Serializable;

/**
 * 存储在memcache中的对象
 * @author xianchao.sun@downjoy.com
 * @date 2012-5-4
 *
 */
public class CacheWrapper implements Serializable {

    private static final long serialVersionUID=1L;

    private Object cacheObject;

    public CacheWrapper() {

    }

    public Object getCacheObject() {
        return cacheObject;
    }

    public void setCacheObject(Object cacheObject) {
        this.cacheObject=cacheObject;
    }

}
