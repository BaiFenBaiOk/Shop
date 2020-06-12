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
                    商品管理
                    <small>全部商品</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath }/user/findAllByOrder.action"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li><a href="#">商品管理</a></li>
                    <li class="active">全部商品</li>
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
                                        <button type="button" class="btn btn-default" title="新建" onclick='location.href="${pageContext.request.contextPath }/user/addGoods.action"'><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="submit" class="btn btn-default" title="删除" onclick='confirm("你确认要删除吗？")' form="delGoodByUid"><i class="fa fa-trash-o"></i> 删除</button>
                                      
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
							<form action="${pageContext.request.contextPath }/user/delGoodByUid.action" method="post" id="delGoodByUid">
                            <!--数据列表-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                    <tr>
                                        <th class="" style="padding-right:0px;">
                                            <input name="ids" id="selall" type="checkbox" class="icheckbox_square-blue">
                                        </th>
                                        
                                        <th class="sorting_asc">商品ID</th>
                                        <th class="sorting">名称</th>
                                        <th class="sorting_asc">价格</th>
										<th class="sorting_asc">数量</th>
										<th class="sorting_asc">种类</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
								<c:forEach items="${pageInfo.list}" var="c">
                                    <tr>
                                        <td><input name="ids" id="ids" type="checkbox" value="${c.gId}"></td>
                                        <td>${c.gId}</td>
                                        
                                        <td>${c.gName}</td>
                                        <td>${c.price}</td>
                                        <td>${c.count}</td>
                                      	 <td>${c.goodId}</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="${pageContext.request.contextPath }/user/editGoodById.action?gId=${c.gId}"'>编辑|详情</button>
                                           
                                         
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
                                        <button type="button" class="btn btn-default" title="新建" onclick='location.href="${pageContext.request.contextPath }/user/addGoods.action"'><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="submit" class="btn btn-default" title="删除" onclick='confirm("你确认要删除吗？")' form="delGoodByUid"><i class="fa fa-trash-o"></i> 删除</button>
                                       
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
                                    <a href="${pageContext.request.contextPath }/user/findAllGood.action?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath }/user/findAllGood.action?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                                <c:forEach begin="1" end="${pageInfo.pages }" var="pageNum">
                                	<li><a href="${pageContext.request.contextPath }/user/findAllGood.action?page=${pageNum }&size=${pageInfo.pageSize}">${pageNum }</a></li>
                                </c:forEach>
                                
                              
                                <li><a href="${pageContext.request.contextPath }/user/findAllGood.action?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                                <li>
                                    <a href="${pageContext.request.contextPath }/user/findAllGood.action?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
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
		location.href = "${pageContext.request.contextPath}/user/findAllGood.action?page=1&size="
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