<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.rain.bean.AdminBean,com.rain.bean.HistoryBean,com.rain.dao.BookDao,com.rain.dao.AdminDao" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
	<meta charset="UTF-8">
	<title>图书馆管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="static/css/bootstrap.min.css">
	<link rel="stylesheet" href="static/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
	<link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/jQuery/jquery-3.1.1.min.js"></script>
	<script src="static/js/bootstrap-dropdown.min.js"></script>
	<script src="static/js/reader.js"></script>

	<script src="ajax-lib/ajaxutils.js"></script>
	<script src="static/js/readerUpdateInfo.js"></script>
	<script src="static/js/readerUpdatePwd.js"></script>

</head>



<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>


<body class="bootstrap-admin-with-small-navbar">
<%@ include file="header.jsp" %>


<div class="container">
    <!-- left, vertical navbar & content -->
    <div class="row">
        <!-- left, vertical navbar -->
        <div class="col-md-2 bootstrap-admin-col-left">
            <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
               <li>
                    <a href="/books/select.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 图书查询</a>
                </li>
	            <li>
	                 <a href="/books/borrow.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 借阅信息</a>
	                </li>
	                <li>
	                    <a href="/books/history.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 借阅历史</a>
	                </li>
            </ul>
        </div>

        <!-- content -->
        <div class="col-md-10">
           <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default bootstrap-admin-no-table-panel">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title">Borrowing Records</div>
                            </div>
                           
                        </div>
                    </div>
                </div>
    <div class="row">
                <div class="col-lg-12">
                  
                </div>
            </div>
                <div class="row">
                    <div class="col-lg-12">
                        <table id="data_list" class="table table-hover table-bordered" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th>No.</th>
	                            <th>Book Name</th>
	                            <th>Reader Account</th>
	                            <th>Reader Name</th>
	                            <th>Borrowing Date</th>
	                            <th>Return Date</th>
	                            
                            </tr>
                            </thead>
                            	<%
	                            ArrayList<HistoryBean> bookdata = new ArrayList<HistoryBean>();
	                            bookdata = (ArrayList<HistoryBean>)request.getAttribute("data");
	                            if(bookdata==null){
	                        	   BookDao bookdao = new BookDao();
	                        	   bookdata = (ArrayList<HistoryBean>)bookdao.get_HistoryListInfo(0,aid);
	                            }
							    for (HistoryBean bean : bookdata){
							    %>                 
	                            <tbody>
	                         	   	<td><%= bean.getCard() %></td>
	                         	   	<td><%= bean.getBookname() %></td>
	                                <td><%= bean.getAdminname() %></td>
	                                <td><%= bean.getUsername() %></td>
	                                <td><%= bean.getBegintime() %></td>
	                                <td><%= bean.getEndtime() %></td>                                        
	                          	</tbody>
	                            <%} %> 
                        </table>
                        
                    </div>
                </div>
          
        </div>
    </div>
</div>

    <div class="modal fade" id="modal_info" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="infoModalLabel">提示</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12" id="div_info"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btn_info_close" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>



</body>
</html>