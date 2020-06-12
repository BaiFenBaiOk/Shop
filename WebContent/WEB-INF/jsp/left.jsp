<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>数据后台管理</title>
    
</head>
<body>
	<aside class="main-sidebar">

            <section class="sidebar">

                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="../img/user2-160x160.jpg" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p>${username.username }</p>
                        <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                    </div>
                </div>
               
                <ul class="sidebar-menu">
                    <li class="header">菜单</li>

                    <li id="admin-index"><a href="${pageContext.request.contextPath }/user/findAllByOrder.action"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

                    <!-- 菜单 -->



                    <li class="treeview">
                        <a href="#">
                    <i class="fa fa-folder"></i> <span>信息管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                        <ul class="treeview-menu">

                            <li id="admin-login">
                                <a href="${pageContext.request.contextPath }/user/homeLoginUser.action?page=1&size=4">
                            <i class="fa fa-circle-o"></i> 用户管理
                        </a>
                            </li>

                            <li id="admin-register">
                                <a href="${pageContext.request.contextPath }/user/findAllGoodType.action?page=1&size=4">
                            <i class="fa fa-circle-o"></i> 商品类型管理
                        </a>
                            </li>

                            <li id="admin-404">
                                <a href="${pageContext.request.contextPath }/user/findAllGood.action?page=1&size=4">
                            <i class="fa fa-circle-o"></i> 商品管理
                        </a>
                            </li>

                        </ul>
                    </li>



                    <li class="treeview">
                        <a href="#">
                    <i class="fa fa-cube"></i> <span>订单管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                        <ul class="treeview-menu">

                            <li id="charts-chartjs">
                                <a href="${pageContext.request.contextPath }/user/list.action?page=1&size=4">
                            <i class="fa fa-circle-o"></i> 全部订单
                        </a>
                            </li>

                        </ul>
                    </li>



  
                </ul>
            </section>
        </aside>
</body>
</html>