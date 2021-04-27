<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.rain.bean.AdminBean,com.rain.bean.HistoryBean,com.rain.dao.AdminDao" %>
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
            <div class="col-md-2 bootstrap-admin-col-left">
                <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
                    <li>
                        <a href="/books/admin_book.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 图书管理</a>
                    </li>
                    <li>
                        <a href="/books/admin_user.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 读者管理</a>
                    </li>
                    <li>
                        <a href="/books/admin_booktype.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 图书分类管理</a>
                    </li>
                    <li>
                        <a href="/books/admin_borrow.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 图书借阅信息</a>
                    </li>
                    <li>
                        <a href="/books/admin_history.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 图书归还信息</a>
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


                                    <li>管理员可查询修改管理图书信息</li>
                                    <br>
                                    <li>查询修改管理读者信息</li>
                                    <br>
                                    <li>查询借阅归还信息</li>
                                </ul>
                            </div>
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