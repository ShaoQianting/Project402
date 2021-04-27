<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.rain.bean.AdminBean,com.rain.dao.AdminDao" %>

<%@ include file="sessionForLogin.jsp" %>

<%
	AdminBean admin = new AdminBean();
	String aid = (String)session.getAttribute("aid");
	AdminDao admindao = new AdminDao();
	admin = admindao.get_AidInfo2(aid);
	String user_name = admin.getName();
%>

<nav class="navbar navbar-inverse navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small" role="navigation">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="collapse navbar-collapse main-navbar-collapse">
                    <a class="navbar-brand" href="#"><strong>Library Management System</strong></a>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" role="button" class="dropdown-toggle" data-hover="dropdown"> <i class="glyphicon glyphicon-user"></i> Welcome! <%=user_name %><i class="caret"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="#updateinfo" data-toggle="modal">Personal Info</a></li>
                                 <li role="presentation" class="divider"></li>
                                <li><a href="#updatepwd" data-toggle="modal">Change Password</a></li>
                                <li role="presentation" class="divider"></li>
                                <li><a href="/books/login.jsp">Login Out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>

<form class="form-horizontal" method="post" action="/books/AdminServlet">                
<div class="modal fade" id="updatepwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Change your password</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="tip" value="1">
				<input type="hidden" name="url" value="index">
				<div class="form-group">
					<label for="firstname" class="col-sm-3 control-label">Your password</label>
					<div class="col-sm-7">
						<input type="password" class="form-control" name="password" id="oldPwd"  placeholder="Enter your password">
						<label class="control-label" for="oldPwd" style="display: none"></label>				
					</div>
				</div>	

				<div class="form-group">
					<label for="firstname" class="col-sm-3 control-label">New password</label>
					<div class="col-sm-7">
						<input type="password" class="form-control" name="password2" id="newPwd"  placeholder="Enter your new password">
						<label class="control-label" for="newPwd" style="display: none"></label>			
					</div>
				</div>	
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary" >Change</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</form>	

<form class="form-horizontal" method="post" action="/books/AdminServlet">  
	<div class="modal fade" id="updateinfo" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="ModalLabel">Personal Info</h4>
			</div>

			<div class="modal-body">

				<!--正文-->
				<input type="hidden" name="tip" value="2">
				<input type="hidden" name="url" value="index">
				<div class="form-group">
					<label for="firstname" class="col-sm-3 control-label">Name</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" id="name" name="name" placeholder="Entere your name" value='<% out.write(admin.getName());%>'>
						<label class="control-label" for="name" style="display: none"></label>			
					</div>
				</div>	

				<div class="form-group">
					<label for="firstname" class="col-sm-3 control-label">Phone</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" id="phone" name="phone" placeholder="Enter your phone" value='<% out.write(admin.getPhone());%>'>
						<label class="control-label" for="phone" style="display: none"></label>				
					</div>
				</div>	


				<div class="form-group">
					<label for="firstname" class="col-sm-3 control-label">Email</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" id="email" name="email"  placeholder="Enter your email" value='<% out.write(admin.getEmail());%>'>
						<label class="control-label" for="email" style="display: none"></label>				
					</div>
				</div>

			</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary" >Change password</button>
				</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
	</div>

</form>	