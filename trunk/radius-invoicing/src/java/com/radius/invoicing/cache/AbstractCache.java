package com.radius.invoicing.cache;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.apache.log4j.Logger;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明 线程缓存抽象类
 */
public abstract class AbstractCache implements Runnable {

	private static Logger logger=Logger.getLogger(AbstractCache.class);
	
	private boolean isRun=false;//是否运行
	
	private int interval=10*60*1000;//10钟就启动一次
	
	private Thread thread=null;
	
	@PostConstruct
	public void init(){//初始化
		if(thread==null){
			thread=new Thread(this);
		}
		if(!isRun){
			isRun=true;
			thread.start();
		}
	}
	
	@PreDestroy
	public void destroy(){
		if(thread!=null){
			thread=null;
		}
		if(isRun){
			isRun=false;
		}
	}
	
	
	@Override
    protected void finalize() throws Throwable {
        super.finalize();
        this.isRun=false;
    }
	
	public void run() {
		while(isRun){//表示启动线程方法
			
			try{
				//更新缓存对象
				updatecache();
				//间隔时间
				Thread.sleep(interval);	
			}catch(Exception e){
				logger.error("更新缓存对象是发生异常.....");
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 更新memcache中的对象
	 */
	public abstract void updatecache();
	
	public int getInterval() {
        return interval;
    }

    public void setInterval(int interval) {
        this.interval=interval;
    }
}
