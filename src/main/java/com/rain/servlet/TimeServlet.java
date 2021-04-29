package com.rain.servlet;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

import javax.servlet.http.HttpServlet;

import com.rain.util.CheckIsDue;
import com.rain.util.EmailTimerTask;


public class TimeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TimeServlet() { 
        super(); 
    } 
    
    public void init(){
      
    	Timer timer = new Timer(); 
        //timer.schedule(new SendEmailForDue(), 1000, 2000);// 在1秒后执行此任务,每次间隔2秒,如果传递一个Data参数,就可以在某个固定的时间执行这个任务. 
    	Calendar calendar = Calendar.getInstance();
        
        /*** check whether due in 12:00 am ***/
       
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
         
        Date date=calendar.getTime(); 
         
        //System.out.print(date);
    	timer.schedule(new CheckIsDue(), date);
    	
    	timer.schedule(new EmailTimerTask(), 1000);

//    	while (true){ 
//          try { 
//              int ch = System.in.read(); //input c, the timer will stop
//              if (ch - 'c' == 0){ 
//            	  timer.cancel();
//              } 
//          } catch (IOException e) { 
//              e.printStackTrace(); 
//          } 
//    	} 
    	
    }
    
    public void destroy() { 
        super.destroy();  
    } 
}