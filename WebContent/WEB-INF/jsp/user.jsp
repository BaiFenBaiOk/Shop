<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>数据后台管理</title>
   <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/seach.js"></script>
    
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
                    用户管理
                    <small>全部用户</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath }/user/findAllByOrder.action"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li><a href="#">用户管理</a></li>
                    <li class="active">全部用户</li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">

                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">列表</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                       
                                        <button type="submit" class="btn btn-default" title="删除" onclick='confirm("你确认要删除吗？")' form="delUserByUid"><i class="fa fa-trash-o"></i> 删除</button>
                                       
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
                                    <input type="text" id="username" name="username" class="form-control input-sm" placeholder="搜索">
                                    <div id="div01" style="position:relative; left : -54px; width: 600px; height: 200px ; border:  1px solid blue; display: none"></div>
                                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                </div>
                            </div>
                            <!--工具栏/-->
						<form action="${pageContext.request.contextPath }/user/delUserByUid.action" method="post" id="delUserByUid">
                            <!--数据列表-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                    <tr>
                                        <th class="" style="padding-right:0px;">
                                            <input id="selall" name="ids" type="checkbox" class="icheckbox_square-blue">
                                        </th>
                                        <th class="sorting_asc">UID</th>
                                        <th class="sorting">姓名</th>
                                        <th class="sorting">年龄</th>
                                        <th class="sorting">性别</th>
                                        <th class="sorting">手机</th>
                                        <th class="sorting">邮箱</th>
                                        <th class="sorting">激活状态</th>
                                        <th class="sorting">用户类型</th>

                                        <th class="text-center">操作</th>
                                    </tr>
                                </thead>
                                <tbody>

							<c:forEach items="${pageInfo.list}" var="c">
                                    <tr>
                                        <td><input name="ids" type="checkbox" value="${c.uid}"></td>
                                        <td>${c.uid}</td>
                                        <td>${c.username}</td>
                                        <td>${c.age}</td>
                                        <td>${c.sex}</td>
                                        <td>${c.iphone}</td>
                                        <td>${c.email}</td>
										<%-- <td>${c.state}</td> --%>
										<td><c:if test="${c.state==1}">已激活</c:if>
										<c:if test="${c.state==0}">未激活</c:if></td>
										<%-- <td>${c.type}</td> --%>
										<td><c:if test="${c.type==1}">用户</c:if>
										<c:if test="${c.type==0}">管理员</c:if></td>
                                        <td class="text-center">
                                            
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="${pageContext.request.contextPath }/user/edit_user.action?uid=${c.uid}"'>编辑</button>
                                        </td>
                                    </tr>

							</c:forEach>


                                </tbody>
                             
                            </table>
                            </form>
                            <!--数据列表/-->

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                       
                                        <button type="submit" class="btn btn-default" title="删除" onclick='confirm("你确认要删除吗？")' form="delUserByUid"><i class="fa fa-trash-o"></i> 删除</button>
                                       
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
                                    <input type="text" class="form-control input-sm" placeholder="搜索">
                                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                </div>
                            </div>
                            <!--工具栏/-->

                        </div>
                        <!-- 数据表格 /-->


                    </div>
                    <!-- /.box-body -->

                    <!-- .box-footer-->
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
                                    <a href="${pageContext.request.contextPath }/user/homeLoginUser.action?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath }/user/homeLoginUser.action?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                                <c:forEach begin="1" end="${pageInfo.pages }" var="pageNum">
                                	<li><a href="${pageContext.request.contextPath }/user/homeLoginUser.action?page=${pageNum }&size=${pageInfo.pageSize}">${pageNum }</a></li>
                                </c:forEach>
                                
                              
                                <li><a href="${pageContext.request.contextPath }/user/homeLoginUser.action?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                                <li>
                                    <a href="${pageContext.request.contextPath }/user/homeLoginUser.action?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <!-- /.box-footer-->


                </div>

            </section>
            <!-- 正文区域 /-->

        </div>
        <!-- 内容区域 /-->

        <!-- 底部导航 -->
        <jsp:include page="bottom.jsp" flush="true" />
        <!-- 底部导航 /-->

    </div>


   
    <script>
    function changePageSize() {
		//获取下拉框的值
		var pageSize = $("#changePageSize").val();

		//向服务器发送请求，改变没页显示条数
		location.href = "${pageContext.request.contextPath}/user/homeLoginUser.action?page=1&size="
				+ pageSize;
	}
    
        $(document).ready(function() {
            // 选择框
            $(".select2").select2();

            // WYSIHTML5编辑器
            $(".textarea").wysihtml5({
                locale: 'zh-CN'
            });
        });


        // 设置激活菜单
        function setSidebarActive(tagUri) {
            var liObj = $("#" + tagUri);
            if (liObj.length > 0) {
                liObj.parent().parent().addClass("active");
                liObj.addClass("active");
            }
        }


        $(document).ready(function() {

            // 激活导航位置
            setSidebarActive("order-manage");

            // 列表按钮 
            $("#dataList td input[type='checkbox']").iCheck({
                checkboxClass: 'icheckbox_square-blue',
                increaseArea: '20%'
            });
            // 全选操作 
            $("#selall").click(function() {
                var clicks = $(this).is(':checked');
                if (!clicks) {
                    $("#dataList td input[type='checkbox']").iCheck("uncheck");
                } else {
                    $("#dataList td input[type='checkbox']").iCheck("check");
                }
                $(this).data("clicks", !clicks);
            });
        });
    </script>
</body>
</html>