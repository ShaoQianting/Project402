<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.rain.bean.AdminBean,com.rain.dao.AdminDao" %>
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

</head>

<body class="bootstrap-admin-with-small-navbar">
<!-- 判断是否已经登录 -->
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
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">图书馆管理系统</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <ul>
                                <li>本系统为javaweb编写的图书馆管理系统，编译工具为eclipse，使用mysql数据库</li>
                                <br>
                                <li>读者可查询图书信息</li>
                                <br>
                                <li>借阅或者归还书籍</li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<%@ include file="static/js_common_link.jsp" %>
</body>
</html>