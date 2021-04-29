<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.rain.bean.EmailBean,com.rain.dao.EmailDao,com.rain.dao.TypeDao,com.rain.dao.BookDao" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
	<meta charset="UTF-8">
	<title>图书馆管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ include file="/static/css_common_link.jsp" %>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/jQuery/jquery-3.1.1.min.js"></script>
	<script src="static/js/bootstrap-dropdown.min.js"></script>
			
	<script src="static/ajax-lib/ajaxutils.js"></script>
	<script src="static/js/adminUpdateInfo.js"></script>
	<script src="static/js/adminUpdatePwd.js"></script>
</head>

<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>

<%@ include file="sessionForLogin.jsp" %>
<body class="bootstrap-admin-with-small-navbar">
<%@ include file="header.jsp" %>
    

    <div class="container">
        <!-- left, vertical navbar & content -->
        <div class="row">
            <!-- left, vertical navbar -->
            <div class="col-md-3 bootstrap-admin-col-left">
               <%@ include file="admin_nav.jsp" %>
                
            </div>

            <!-- content -->
            <div class="col-md-9">
                
                
              <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default bootstrap-admin-no-table-panel">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title">Email Information</div>
                            </div>
                           
                        </div>
                    </div>
                </div>
                
                
                <div class="row">
                    <div class="col-lg-12">
                        <table id="data_list" class="table table-hover table-bordered" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th>Email Address</th>
                                <th>Subject</th>
                                <th>Send Time</th>
                                <th>Content</th>
                                <th>Type</th>
                                <th>Send</th>
                                
                            </tr>
                            </thead>
                            
                             <%
                             ArrayList<EmailBean> emaildata = new ArrayList<EmailBean>();
                             emaildata = (ArrayList<EmailBean>)request.getAttribute("data");
                           if(emaildata==null){
                        	   EmailDao emaildao = new EmailDao();
                        	   emaildata = (ArrayList<EmailBean>)emaildao.getAllInfoList();
							}
						   for (EmailBean bean : emaildata){
							  %>                 
                            	<tbody>
	                         	   	<td><%= bean.getEmailaddress() %></td>
	                         	   	<td><%= bean.getSubject() %></td>
	                                <td><%= bean.getSentdate() %></td>
	                                <td><%= bean.getContent() %></td>
	                                <td><%= bean.getType() %></td>
	                                <td><%= bean.getIssend() %></td>  
	                                                                            
                          	  </tbody>
                             <%} %> 
                        </table>
                    </div>
                </div>
        </div>
    </div>
    
    
    
    
</body>
</html>