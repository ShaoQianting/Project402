<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.rain.dao.AdminDao,com.rain.bean.AdminBean,com.rain.bean.OverdueBean,com.rain.dao.OverdueDao" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
	<meta charset="UTF-8">
	<title>Library Management System</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ include file="/static/css_common_link.jsp" %>
	
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/jQuery/jquery-3.1.1.min.js"></script>
	<script src="static/js/bootstrap-dropdown.min.js"></script>
	<script src="static/ajax-lib/ajaxutils.js"></script>
	<script src="static/js/adminUpdateInfo.js"></script>
	<script src="static/js/adminUpdatePwd.js"></script>
    <script src="static/js/jquery.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</head>



<body class="bootstrap-admin-with-small-navbar">
<%@ include file="header.jsp" %>
  
    <div class="container">
        <!-- left, vertical navbar & content -->
        <div class="row">
            <!-- left, vertical navbar -->
            <div class="col-md-3 bootstrap-admin-col-left">
               <%@ include file="admin_nav.jsp" %>
            </div>
            <div class="col-md-9">       
              <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default bootstrap-admin-no-table-panel">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title">Search</div>
                            </div>
                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                <form class="form-horizontal" action="/books/OverdueServlet" method="post">
                                <input type="hidden" name="mod" value="search">
                        			<div class="col-lg-8 form-group">
                                        <label class="col-lg-4 control-label" for="query_bname">Key Words</label>
                                        <div class="col-lg-8">
                                            <input class="form-control" name="keywords" type="text" value="" placeholder="Book Name/ Reader Name/ Reader Account">
                                            <label class="control-label" for="query_bname" style="display: none;"></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 form-group">
                                        <button type="submit" class="btn btn-primary" id="btn_query" onclick="">Search</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-lg-12">
                        <table id="data_list" class="table table-hover table-bordered" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th>Book Number</th>
                                <th>Book Name</th>
                                <th>Reader Account</th>
                                <th>Reader Name</th>
                                <th>Begin Date</th>
                                <th>End Date</th>
                                <th>Overdue Days</th>
                                <th>Overdue Amount</th>
                                <th>Settlement</th>
                                <th>Operation</th>
                            </tr>
                            </thead>
                       
                             <%
                             ArrayList<OverdueBean> overduedata = new ArrayList<OverdueBean>();
                             overduedata = (ArrayList<OverdueBean>)request.getAttribute("data");
	                         if(overduedata==null){
	                       	    OverdueDao overduedao = new OverdueDao();
	                       	    overduedata = (ArrayList<OverdueBean>)overduedao.get_ListInfo();
	                         }
	
							 for (OverdueBean bean : overduedata){
							  %>                 
								<tbody>
	                         	   	<td><%= bean.getCard() %></td>
	                         	   	<td><%= bean.getBookname() %></td>
	                                <td><%= bean.getAdminname() %></td>
	                                <td><%= bean.getUsername() %></td>
	                                <td><%= bean.getBegintime() %></td>  
	                                <td><%= bean.getEndtime() %></td>  
	                                <td><%= bean.getDays() %></td>  
	                                <td><%= bean.getAmount() %></td>  
	                                <% String settement = "No";
	                                if(bean.getIssettlement()==1){ settement = "Yes";} %>
	                                <td><%= settement %></td>  
	                                
	                                <td>
	                                <% 
	                                if(bean.getIssettlement()==0){ 
	                                %>	
	                                <button type="button" class="btn btn-info btn-xs" onclick="pay(<%= bean.getOid() %>,<%= bean.getHid() %>)">Pay</button>
	    							<button type="button" class="btn btn-danger btn-xs" onclick="deleteRecord(<%= bean.getOid() %>)">Delete</button>	
	                                <%}%>
								
									</td>                                            
                          	  </tbody>
                       	<%} %> 
                        </table>
                    </div>
                </div>
        </div>
    </div>
    <script type="text/javascript">
    function showInfo2(bid) {
        document.getElementById("updateBookId").value = bid;
    }
    function deleteRecord(oid) {
    	con=confirm("Are you sure you want to delete?"); 
    	if(con==true){
    		location.href = "/books/OverdueServlet?from=admin&mod=del&oid="+oid;
    	}
    }
    function pay(oid,hid) {
    	con=confirm("Has the reader already paid?"); 
    	if(con==true){
    		location.href = "/books/OverdueServlet?from=admin&mod=pay&oid="+oid+"&hid="+hid;
    	}
    }
    
    </script>
   
</body>
</html>