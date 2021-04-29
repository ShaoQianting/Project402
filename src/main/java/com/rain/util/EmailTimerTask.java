package com.rain.util;

import java.util.ArrayList;

import com.rain.bean.AdminBean;
import com.rain.bean.EmailBean;
import com.rain.dao.AdminDao;
import com.rain.dao.EmailDao;

public class EmailTimerTask extends java.util.TimerTask{

	@Override
	public void run() {
		// TODO Auto-generated method stub
		EmailDao emaildao = new EmailDao();
		AdminDao admindao = new AdminDao();
		ArrayList<EmailBean> sendEmaildata = new ArrayList<EmailBean>();
		sendEmaildata = (ArrayList<EmailBean>)emaildao.getSendInfoList();
		AdminBean adminbean = new AdminBean();
		for (EmailBean bean : sendEmaildata){
			adminbean = admindao.get_AidInfo(bean.getAid());
			
			System.out.println(bean.getEid());
			
			String subject = "Overdue Reminder";
			String content = "The book you borrowed is overdue, please check it in the library management system.";
			
			Mail mail=new Mail();
			mail.setTo(adminbean.getEmail());
            mail.setSubject(subject);
            mail.setContent(content);
            if (mail.sendMail()) {
                System.out.println(" yes");
                emaildao.updateEmailRecord(bean.getEid(),adminbean.getEmail(), subject, content);
            }
            else {
            	System.out.println(" no");
			}
		}
		
	}

}
