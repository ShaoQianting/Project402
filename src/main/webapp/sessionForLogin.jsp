<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<% 	
	//System.out.println("session aid:"+session.getAttribute("aid"));
	if(session.getAttribute("aid")==null || session.getAttribute("aid").toString().equals(""))
	{
		response.sendRedirect(request.getContextPath()+"/login.jsp");
		return;
	}
%>