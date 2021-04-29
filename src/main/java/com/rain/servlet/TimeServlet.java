package com.rain.servlet;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

import javax.servlet.http.HttpServlet;

import com.rain.util.CheckIsDue;
import com.rain.util.EmailUtil;


public class TimeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TimeServlet() { 
        super(); 
    } 
    
    public void init(){
      
    	Timer timer = new Timer(); 
        //timer.schedule(new SendEmailForDue(), 1000, 2000);// 在1秒后执行此任务,每次间隔2秒,如果传递一个Data参数,就可以在某个固定的时间执行这个任务. 
    	Calendar calendar = Calendar.getInstance();
        
        /*** 定制每日2:00执行方法 ***/
       
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
         
        Date date=calendar.getTime(); //第一次执行定时任务的时间
         
        //System.out.print(date);
    	timer.schedule(new CheckIsDue(), date);
    	
    	timer.schedule(new EmailUtil(), 1000,10*1000);

    	while (true){ 
          try { 
              int ch = System.in.read(); //输入字符“c”，回车即停止执行 
              if (ch - 'c' == 0){ 
            	  timer.cancel();// 使用这个方法退出任务 
              } 
          } catch (IOException e) { 
              e.printStackTrace(); 
          } 
    	} 
    	//timer.cancel();
//    	Timer timer2 = new Timer(); 
//    	timer2.schedule(new SendEmailForDue(), 1000, 2000);
//        // 这个是用来停止此任务的,否则就一直循环执行此任务了 
//        while (true){ 
//            try { 
//                int ch = System.in.read(); //输入字符“c”，回车即停止执行 
//                if (ch - 'c' == 0){ 
//                    timer2.cancel();// 使用这个方法退出任务 
//                } 
//            } catch (IOException e) { 
//                e.printStackTrace(); 
//            } 
//        } 
    }
    
    public void destroy() { 
        super.destroy();  
    } 
}