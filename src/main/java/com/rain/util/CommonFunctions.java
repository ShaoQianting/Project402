package com.rain.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonFunctions {
	
	public int diffDays(String endDate) throws ParseException {
		int days = 0;
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date(System.currentTimeMillis());
		String nowDate = ft.format(now);
		
	
		Date begindate = ft.parse(nowDate);
		Date enddate = ft.parse(endDate);
		long from1 = begindate.getTime();  
	    long to1 = enddate.getTime();  
	    days = (int) ((from1-to1) / (1000 * 60 * 60 * 24));  
		return days;
	}
}
