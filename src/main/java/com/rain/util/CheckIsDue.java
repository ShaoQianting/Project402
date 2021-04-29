package com.rain.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import com.rain.bean.HistoryBean;
import com.rain.bean.OverdueBean;
import com.rain.dao.BookDao;
import com.rain.dao.EmailDao;
import com.rain.dao.OverdueDao;


public class CheckIsDue extends java.util.TimerTask{
	
	CommonFunctions cf;
	@SuppressWarnings("deprecation")
	public void run() {
		cf = new CommonFunctions();
		try {
			CheckIsDueToday();
			CheckIsDueAll();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    } 
	
	public void CheckIsDueToday() {
		BookDao bookdao = new BookDao();
		OverdueDao overduedao = new OverdueDao();
		//bookdao.get_HistoryListStatus();
		ArrayList<HistoryBean> bookdata = new ArrayList<HistoryBean>();
		bookdata = (ArrayList<HistoryBean>)bookdao.get_HistoryListStatus();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		
		Date now = new Date(System.currentTimeMillis());
		//String nowDate = ft.format(now);
		
	    for (HistoryBean bean : bookdata){
	    	try {
				Date enddate = ft.parse(bean.getEndtime());
				if(enddate.before(now)) {
					int days = cf.diffDays(bean.getEndtime());
					//System.out.println(days);
				    bookdao.updateIsOverdue(bean.getHid(),days);
				    overduedao.addOverdueRecord(bean.getHid(), bean.getAid(), bean.getBid(), bean.getCard(), bean.getBookname(), bean.getAdminname(), bean.getUsername(), bean.getBegintime(), bean.getEndtime(), days, days*0.1, 0, "");
					//System.out.println(ft.format(enddate));
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    System.out.println("Finish "+ ft.format(now));
	}
	
	public void CheckIsDueAll() throws ParseException {
		BookDao bookdao = new BookDao();
		OverdueDao overduedao = new OverdueDao();
		EmailDao emaildao = new EmailDao();
		ArrayList<OverdueBean> overdueBooksList = new ArrayList<OverdueBean>();
		overdueBooksList = (ArrayList<OverdueBean>)overduedao.get_ListForOverdue();
		for (OverdueBean bean : overdueBooksList){
			int days = cf.diffDays(bean.getEndtime());
			//System.out.println(days);
			switch(days){
			    case 1 :
			    	emaildao.initEmail(bean.getAid(),1);
			       break;
			    case 7 :
			    	emaildao.initEmail(bean.getAid(),2);
			       break; 
			    case 30 :
			    	emaildao.initEmail(bean.getAid(),3);
			       break; 
			    case 90 :
			    	emaildao.initEmail(bean.getAid(),4);
			       break; 
			    case 180 :
			    	emaildao.initEmail(bean.getAid(),5);
			       break; 
			    case 360 :
			    	emaildao.initEmail(bean.getAid(),6);
			       break; 
			    default :
			}
			overduedao.updateOverdueInfo(bean.getOid(),days,days*0.1);
			bookdao.updateIsOverdue(bean.getHid(),days);
			
	    	//System.out.println(bean.getOid());
	    }
	}
}
