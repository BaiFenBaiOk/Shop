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
                    <small>商品表单</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath }/user/findAllByOrder.action"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li><a href="#">商品管理</a></li>
                    <li class="active">商品表单</li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">
		<form action="${pageContext.request.contextPath }/user/edit_goodByUid.action" method="post" id="edit_goodByUid">
                <!--订单信息-->
                <div class="panel panel-default">
                    <div class="panel-heading">商品信息</div>
                    <div class="row data-type">
						<input type="hidden" name="gId" value="${good.gId}">
                        <div class="col-md-2 title">商品名字</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="gName" value="${good.gName }">
                        </div>

                        <div class="col-md-2 title">商品价格</div>
                        <div class="col-md-4 data">
                             <input type="text" class="form-control" name="price" value="${good.price }">
                        </div>
                        <div class="col-md-2 title">商品数量</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="count" value="${good.count }">
                        </div>

                        <div class="col-md-2 title">商品种类</div>
                       
                        <div class="col-md-4 data">
                            <select name="goodId" class="form-control select2" style="width: 100%;">
                            
                            	<c:forEach items="${list}" var="c">
                            		<option value="${c.goodId }" ${c.goodId ==goodType.goodId?'selected':''}>${c.goodName }</option>
                            	</c:forEach>
		                       
                   			</select>
                        </div>

                        
                        <div class="col-md-2 title rowHeight2x">商品描述</div>
                         <div class="col-md-4 data">
                        
                            <input type="text" class="form-control" name="desc" value="${good.desc }">

                        </div>
                         <div class="col-md-2 title rowHeight2x">商品照片</div>
                        <div class="col-md-4">
                            <c:if test="${good.photo !=null}">
							<img src="/pic/${good.photo}" width=90 height=90/>
							</c:if>
							
                        </div>
						
                    </div>
                </div>
                <!--订单信息/-->
			</form>
                

                <!--操作日志-->
                <div class="panel panel-default">
                    <div class="panel-heading">操作日志</div>
                    <!--数据列表-->
                    <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                        <thead>
                            <tr>
                                <th class="">管理员</th>
                                <th class="">内容</th>
                                <th class="">IP</th>
                                <th class="">时间</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>

                            <tr>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>

                            <tr>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>

                        </tbody>
                    </table>
                    <!--数据列表/-->
                </div>
                <!--操作日志/-->

                <!--工具栏-->
                <div class="box-tools text-center">
                    <button type="submit" class="btn bg-maroon" form="edit_goodByUid" value="保存">保存</button>
                    <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
                </div>
                <!--工具栏/-->

            </section>
            <!-- 正文区域 /-->

        </div>
        <!-- 内容区域 /-->

        <!-- 底部导航 -->
        <jsp:include page="bottom.jsp" flush="true" />
        <!-- 底部导航 /-->

    </div>


    <script>
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
            $('#datepicker-a3').datepicker({
                autoclose: true,
                language: 'zh-CN'
            });
        });


        $(document).ready(function() {
            $('#datepicker-a6').datepicker({
                autoclose: true,
                language: 'zh-CN'
            });
        });


        $(document).ready(function() {
            // 激活导航位置
            setSidebarActive("order-manage");
        });
    </script>
</body>
</html>