<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404</title>
<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    
    <link rel="stylesheet" href="./plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="./plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="./plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="./plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="./plugins/morris/morris.css">
    <link rel="stylesheet" href="./plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="./plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="./plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="./plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="./plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="./plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="./plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="./plugins/select2/select2.css">
    <link rel="stylesheet" href="./plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="./plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="./plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="./plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="./plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="./plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="./plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>
<body class="hold-transition skin-purple sidebar-mini">


            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    <a href="${pageContext.request.contextPath}/login.jsp">登陆失败，请重新登陆</a>
                </h1>

               

            </section>

            <!-- Main content -->
            <section class="content">
                <div class="error-page">
                    <h2 class="headline text-yellow"> 404</h2>

                    <div class="error-content">
                        <h3><i class="fa fa-warning text-yellow"></i> Oops! 页面没有找到.</h3>

                        <p>
                            没有找到你请求的页面, 你可以 <a href="all-admin-index.html">返回到后台首页</a> 或者通过搜索查询
                        </p>

                        <form class="search-form">
                            <div class="input-group">
                                <input type="text" name="search" class="form-control" placeholder="搜索">

                                <div class="input-group-btn">
                                    <button type="submit" name="submit" class="btn btn-warning btn-flat"><i class="fa fa-search"></i>
                </button>
                                </div>
                            </div>
                            <!-- /.input-group -->
                        </form>
                    </div>
                    <!-- /.error-content -->
                </div>
                <!-- /.error-page -->
            </section>
            <!-- /.content -->
       
</body>
</html>