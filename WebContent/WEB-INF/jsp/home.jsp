<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>数据后台管理</title>
   
</head>

<body class="hold-transition skin-purple sidebar-mini">

    <div class="wrapper">

        <!-- 页面头部 -->
        <jsp:include page="top.jsp" flush="true" />
        <!-- 页面头部 /-->

        <!-- 导航侧栏 -->
        <jsp:include page="left.jsp" flush="true" />
        <!-- 导航侧栏 /-->

        <!-- 内容区域 -->
        <div class="content-wrapper">

            <!-- 内容头部 -->
            <section class="content-header">
                <h1>
                    控制面板
                    <small>首页</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath }/user/findAllByOrder.action"><i class="fa fa-dashboard"></i> 首页</a></li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">


                <!-- 统计数值 -->
                <div class="row">
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <h3>150</h3>

                                <p>新订单</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                            <a href="all-order-manage-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-green">
                            <div class="inner">
                                <h3>53<sup style="font-size: 20px">%</sup></h3>

                                <p>转化率</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="all-ad-statistics-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-yellow">
                            <div class="inner">
                                <h3>44</h3>

                                <p>新注册用户</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                            <a href="all-member-manage-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-red">
                            <div class="inner">
                                <h3>65</h3>

                                <p>日PV</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                            <a href="all-ad-statistics-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>
                <!-- /.row -->


                <!-- 待处理订单 -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-cube"></i>
                        <h3 class="box-title">待处理订单</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--数据列表-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                    <tr>
                                        <th class="">订单号</th>
                                        <th class="">产品名称</th>
                                        <th class="">会员名</th>
                                        <th class="">价格</th>
                                        <th class="">状态</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
								<c:forEach items="${pageInfo.list}" var="c">
                                    <tr>
                                        <td>${c.id }</td>
                                        <td>${c.goodType.goodName }</td>
                                        <td>${c.user.username }</td>
                                        <td>${c.totol }</td>
                                        <td><c:if test="${c.state==1}">已发货</c:if>
										<c:if test="${c.state==0}">未发货</c:if></td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="${pageContext.request.contextPath }/user/sendOrderById.action?id=${c.id}"'>发货</button>
                                        </td>
                                    </tr>
                                    </c:forEach>

                                   

                                </tbody>
                            </table>
                            <!--数据列表/-->

                        </div>
                        <!-- 数据表格 /-->

                    </div>
                    <!-- /.box-body -->
                    
                    <div class="box-footer">
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                总共${pageInfo.pages}页，共${pageInfo.total}条数据。 每页
                                <select class="form-control" id="changePageSize" onchange="changePageSize()">
                           <option>1</option>
                            <option>3</option>
                            <option>5</option>
                            <option>50</option>
                            <option>80</option>
                        </select> 条
                            </div>
                        </div>

                        <div class="box-tools pull-right">
                            <ul class="pagination">
                            
                            
                            <li>
                                    <a href="${pageContext.request.contextPath }/user/findAllByOrder.action?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath }/user/findAllByOrder.action?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                                <c:forEach begin="1" end="${pageInfo.pages }" var="pageNum">
                                	<li><a href="${pageContext.request.contextPath }/user/findAllByOrder.action?page=${pageNum }&size=${pageInfo.pageSize}">${pageNum }</a></li>
                                </c:forEach>
                                
                              
                                <li><a href="${pageContext.request.contextPath }/user/findAllByOrder.action?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                                <li>
                                    <a href="${pageContext.request.contextPath }/user/findAllByOrder.action?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
                                </li>
                                
                            </ul>
                        </div>

                    </div>

                </div>
                <!-- 待处理订单 /-->

              
                <!-- 待处理游记 /-->

            </section>
            <!-- 正文区域 /-->

        </div>
        <!-- 内容区域 /-->

         <jsp:include page="bottom.jsp" flush="true" />

    </div>


    
    <script>
    
    function changePageSize() {
		//获取下拉框的值
		var pageSize = $("#changePageSize").val();

		//向服务器发送请求，改变没页显示条数
		location.href = "${pageContext.request.contextPath}/user/findAllByOrder.action?page=1&size="
				+ pageSize;
	}
       
    </script>
</body>
</html>