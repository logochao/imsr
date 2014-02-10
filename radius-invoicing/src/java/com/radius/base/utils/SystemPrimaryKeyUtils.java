/**
 * 
 */
package com.radius.base.utils;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.locks.ReentrantLock;

import org.apache.log4j.Logger;

/**
 * @author 陈波宁 E-mail:goodluck.sunlight@gmail.com
 * @version 创建时间：2013-12-7 下午11:16:35
 * 类说明 系统主键的生成工具
 */
public class SystemPrimaryKeyUtils  implements Constants{
	private static Logger log=Logger.getLogger(SystemPrimaryKeyUtils.class);
	
	private static final ReentrantLock orderIdLock=new ReentrantLock();
	private static int orderSerialNum=0;
	
	/**
	 * 生成采购订单号
	 * <p>采购订单号的生成规则CG-Dyyyymmdd(ab)</p>
	 * @return
	 */
	public static String getStockOrderUId(){
		StringBuilder sb=new StringBuilder();
		sb.append(STOCK_PREFIX).append("-");
		sb.append("D");
		
		String time=DateConvertUtils.format(new Date(), DATE_FORMAT_YEAR_MONTH_DAY);//时间格式
		sb.append(time);
		try{
			orderIdLock.lock();
			orderSerialNum++;
			if(orderSerialNum>10){
				sb.append("0").append(orderSerialNum);
			}else{
				sb.append(orderSerialNum);
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error("生成采购订单号发生异常.....");
		}finally{
			orderIdLock.unlock();
		}
		return sb.toString();
	}
	
	public static void main(String[] args) {
		Calendar c= Calendar.getInstance();
		System.out.println(c.get(Calendar.HOUR_OF_DAY));
	}
	 
	private static  Timer timer=new Timer();
	
	private static class SystemPrimaryKeyTask extends TimerTask{

		@Override
		public void run() {
			Calendar c= Calendar.getInstance();
			log.info("系统当前时间:"+c.getTime());
			if(c.get(Calendar.HOUR_OF_DAY)==0){//当晚上时间12点时,系统主键的自增系列归零
				SystemPrimaryKeyUtils.orderSerialNum=0;
				log.info("已经将系统的自增系列归零");
				return ;
			}
			
			c.set(Calendar.HOUR, c.get(Calendar.HOUR)+1);
			timer.schedule(new SystemPrimaryKeyTask(), c.getTime());
		}
	}
	
	static{
		orderSerialNum++;
		timer.schedule(new SystemPrimaryKeyTask(), 1000 * 60 * 60 * 24);
	}
}
