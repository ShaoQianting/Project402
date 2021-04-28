<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.rain.bean.HistoryBean,com.rain.dao.AdminDao,com.rain.dao.TypeDao,com.rain.dao.BookDao,com.rain.bean.AdminBean" %>
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
			
	<script src="static/ajax-lib/ajaxutils.js"></script>
	<script src="static/js/adminUpdateInfo.js"></script>
	<script src="static/js/adminUpdatePwd.js"></script>
       
</head>



<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>


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
							<div class="text-muted bootstrap-admin-box-title">图书借阅信息</div>
						</div>
						
					</div>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-lg-12">
					<table id="data_list" class="table table-hover table-bordered" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>图书号</th>
								<th>图书名称</th>
								<th>读者账号</th>
								<th>读者名称</th>
								<th>借阅日期</th>
								<th>截止还书日期</th>
								<th>操作</th>
							</tr>
						</thead>
						
						
						<!---在此插入信息-->
						<%
						ArrayList<HistoryBean> bookdata = new ArrayList<HistoryBean>();
						bookdata = (ArrayList<HistoryBean>)request.getAttribute("data");
						if(bookdata==null){
							BookDao bookdao = new BookDao();
							bookdata = (ArrayList<HistoryBean>)bookdao.get_HistoryListInfo2(1);
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
								<td><button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#updateModal" 
								id="btn_update" onclick="haibook(<%= bean.getHid() %>)">还书</button>
								</td>                                            
							</tbody>
						<%} %> 
					</table>
				</div>
			</div>
	</div>
</div>

    
     
	<!-- 修改模态框（Modal） -->
	<!-------------------------------------------------------------->  

	<!-- 修改模态框（Modal） -->
	<form class="form-horizontal" method="post" action="/books/updateBookServlet">   <!--保证样式水平不混乱-->   
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				&times;
			</button>
			<h4 class="modal-title" id="updateModalLabel">
				修改图书分类
			</h4>
		</div>
		<div class="modal-body">
		
	<!---------------------表单-------------------->

	<div class="form-group">
	<label for="firstname" class="col-sm-3 control-label">图书名称</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="updateBookName" name="name"  placeholder="请输入图书名称">
		<label class="control-label" for="updateBookName" style="display: none;"></label>
		</div>
	</div>

	</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭
			</button>
			<button type="submit" class="btn btn-primary" >
				修改
			</button>
		</div>
	</div><!-- /.modal-content -->
	</div><!-- /.modal -->
	</div>

	</form>
	<!-------------------------------------------------------------->

     <!--------------------------------------添加的模糊框------------------------>  
	<form class="form-horizontal" method="post" action="/books/AddBookServlet">   <!--保证样式水平不混乱-->   
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					添加新图书分类
				</h4>
			</div>
			<div class="modal-body">
			
	<!---------------------表单-------------------->

		<div class="form-group">
		<label for="firstname" class="col-sm-3 control-label">分类名称</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="addBookName" required="required" name="name"  placeholder="请输入图书名称">
				<label class="control-label" for="addBookName" style="display: none;"></label>	
			</div>
	</div>

	<!---------------------表单-------------------->
	</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="submit" class="btn btn-primary" >
					添加
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
	</div>

	</form>	
 	<!--------------------------------------添加的模糊框------------------------>  
    
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
    
	
    <script type="text/javascript">
    function haibook(hid) {
    	con=confirm("是否还书?"); 
    	if(con==true){
    		location.href = "/books/borrowServlet?tip=2&show=2&hid="+hid;
    	}
    }
    </script>
</body>
</html>