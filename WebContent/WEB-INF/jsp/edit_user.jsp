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
                    用户管理
                    <small>用户表单</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath }/user/findAllByOrder.action"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li><a href="#">用户管理</a></li>
                    <li class="active">用户表单</li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">

                

                <!--游客信息-->
                <form action="${pageContext.request.contextPath }/user/edit_userByUid.action" method="post" id="edit_userByUid">
                <div class="panel panel-default">
                    <div class="panel-heading">用户信息</div>
                    <!--数据列表-->
                    <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                        <thead>
                            <tr>
                                <th class="">人群</th>
                                <th class="">年龄</th>
                                <th class="">姓名</th>
                                <th class="">性别</th>
                                <th class="">手机号码</th>
                                <th class="">邮箱</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>
            					<input type="hidden" name="uid" value="${user.uid}">
                                <td><c:if test="${user.age>18}">成人</c:if>
                                <c:if test="${user.age<18}">儿童</c:if></td>
                                <td><input type="text" size="10" value="${user.age}" name="age"></td>
                                <td><input type="text" size="10" value="${user.username}" name="username"></td>
                                <td>
                                    <select class="form-control" style="height:28px">
                                    <option value="女" <c:if test="${user.sex eq '女'}">selected="selected"</c:if> >女</option>
									<option value="男" <c:if test="${user.sex eq '男'}">selected="selected"</c:if> >男</option>
                    </select>
                                </td>
                                <td><input type="text" size="20" value="${user.iphone}" name="iphone"></td>
                                <td><input type="text" size="50" value="${user.email}" name="email"></td>
                            </tr>

                        </tbody>
                    </table>
                    <!--数据列表/-->
                </div>
                <!--游客信息/-->

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
                    <button type="submit" class="btn bg-maroon" form="edit_userByUid" value="保存">保存</button>
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