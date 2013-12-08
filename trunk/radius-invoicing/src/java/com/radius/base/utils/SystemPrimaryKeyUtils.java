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
 * @author �²��� E-mail:goodluck.sunlight@gmail.com
 * @version ����ʱ�䣺2013-12-7 ����11:16:35
 * ��˵�� ϵͳ���������ɹ���
 */
public class SystemPrimaryKeyUtils  implements Constants{
	private static Logger log=Logger.getLogger(SystemPrimaryKeyUtils.class);
	
	private static final ReentrantLock orderIdLock=new ReentrantLock();
	private static int orderSerialNum=0;
	
	/**
	 * ���ɲɹ�������
	 * <p>�ɹ������ŵ����ɹ���CG-Dyyyymmdd(ab)</p>
	 * @return
	 */
	public static String getStockOrderUId(){
		StringBuilder sb=new StringBuilder();
		sb.append(STOCK_PREFIX).append("-");
		sb.append("D");
		
		String time=DateConvertUtils.format(new Date(), DATEFORMAT_YEAR_MONTH_DAY);//ʱ���ʽ
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
			log.error("���ɲɹ������ŷ����쳣.....");
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
			log.info("ϵͳ��ǰʱ��:"+c.getTime());
			if(c.get(Calendar.HOUR_OF_DAY)==0){//������ʱ��12��ʱ,ϵͳ����������ϵ�й���
				SystemPrimaryKeyUtils.orderSerialNum=0;
				log.info("�Ѿ���ϵͳ������ϵ�й���");
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
