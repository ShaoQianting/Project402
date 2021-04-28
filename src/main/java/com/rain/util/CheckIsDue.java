package com.rain.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import com.rain.bean.HistoryBean;
import com.rain.dao.BookDao;
import com.rain.dao.OverdueDao;

public class CheckIsDue extends java.util.TimerTask{
	
	@SuppressWarnings("deprecation")
	public void run() {
		BookDao bookdao = new BookDao();
		OverdueDao overduedao = new OverdueDao();
		bookdao.get_HistoryListStatus();
		ArrayList<HistoryBean> bookdata = new ArrayList<HistoryBean>();
		bookdata = (ArrayList<HistoryBean>)bookdao.get_HistoryListStatus();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		
		Date now = new Date(System.currentTimeMillis());
	    for (HistoryBean bean : bookdata){
	    	try {
				Date enddate = ft.parse(bean.getEndtime());
				if(enddate.before(now)) {
					long from1 = now.getTime();  
				    long to1 = enddate.getTime();  
					int days = (int) ((from1-to1) / (1000 * 60 * 60 * 24));  
				    //System.out.println("两个时间之间的天数差为：" + days);
				    bookdao.updateIsOverdue(bean.getHid());
				    overduedao.addOverdueRecord(bean.getHid(), bean.getAid(), bean.getBid(), bean.getCard(), bean.getBookname(), bean.getAdminname(), bean.getUsername(), bean.getBegintime(), bean.getEndtime(), days, days*0.1, 0, "");
					//System.out.println(ft.format(enddate));
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    }
	    System.out.println("now "+ ft.format(now));  
        
    } 
}
