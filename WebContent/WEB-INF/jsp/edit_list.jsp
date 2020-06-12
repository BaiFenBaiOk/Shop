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
                    订单管理
                    <small>订单表单</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath }/user/findAllByOrder.action"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li><a href="#">订单管理</a></li>
                    <li class="active">订单表单</li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">

                <!--订单信息-->
                <div class="panel panel-default">
                    <div class="panel-heading">订单信息</div>
                    <div class="row data-type">

                        <div class="col-md-2 title">订单编号</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control"  value="${order.id }">
                        </div>

                        <div class="col-md-2 title">下单时间</div>
                        <div class="col-md-4 data">
                            <div class="input-group date">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-right" id="datepicker-a3" value="${order.createTime }">
                            </div>
                        </div>
                        <div class="col-md-2 title">下单数量</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" value="${order.count }">
                        </div>

                        <div class="col-md-2 title">总价</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" value="${order.totol }">

                        </div>

                        
                        <div class="col-md-2 title rowHeight2x">其他信息</div>
                        <div class="col-md-10 data rowHeight2x">
                            <textarea class="form-control" rows="3">
                             <c:if test="${order.state==1}">已付款</c:if>
							<c:if test="${order.state==0}">未付款</c:if>
                            </textarea>
                        </div>

                    </div>
                </div>
                <!--订单信息/-->

                <!--游客信息-->
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

                           <tr> <c:if test="${order!=null}">
            					<%-- <input type="hidden" name="uid" value="${order.user.uid}"> --%>
                                <td><c:if test="${order.user.age > 18}">成人</c:if>
                                <c:if test="${order.user.age < 18}">儿童</c:if></td>
                                <td><input type="text" size="10" value="${order.user.age}" name="age"></td>
                                <td><input type="text" size="10" value="${order.user.username}" name="username"></td>
                                <td>
                                    <select class="form-control" style="height:28px">
                                    <option value="女" ${order.user.sex =='女'?'selected':''}>女</option>
									<option value="男" ${order.user.sex =='男'?'selected':''}>男</option>
                    </select>
                                </td>
                                <td><input type="text" size="20" value="${order.user.iphone}" name="iphone"></td>
                                <td><input type="text" size="50" value="${order.user.email}" name="email"></td>
                            </c:if>
                            </tr>

                        </tbody>
                    </table>
                    <!--数据列表/-->
                </div>
                <!--游客信息/-->

               

                <!--费用信息-->
                <div class="panel panel-default">
                    <div class="panel-heading">费用信息</div>
                    <div class="row data-type">

                        <div class="col-md-2 title">支付方式</div>
                        <div class="col-md-4 data text">
                            在线支付-支付宝
                        </div>

                        <div class="col-md-2 title">金额</div>
                        <div class="col-md-4 data text">
                            ￥1000
                        </div>

                    </div>
                </div>
                <!--费用信息/-->

                <!--发票信息-->
                <div class="panel panel-default">
                    <div class="panel-heading">发票信息</div>
                    <div class="row data-type">

                        <div class="col-md-2 title">发票名称</div>
                        <div class="col-md-4 data text">
                            <div class="form-group form-inline">
                                <div class="radio"><label><input type="radio" name="optionsRadios-a11" value="1"> 不需要发票</label></div>
                                <div class="radio"><label><input type="radio" name="optionsRadios-a11" value="2"> 个人</label></div>
                                <div class="radio"><label><input type="radio" name="optionsRadios-a11" value="3"> 单位名称</label></div>
                            </div>
                        </div>

                        <div class="col-md-2 title">金额</div>
                        <div class="col-md-4 data text">
                            ￥1000
                        </div>

                    </div>
                </div>
                <!--发票信息/-->

                <!--订单处理-->
                <div class="panel panel-default">
                    <div class="panel-heading">订单处理</div>
                    <div class="row data-type">

                        <div class="col-md-2 title">处理类型</div>
                        <div class="col-md-10 data text">
                            自动处理
                        </div>

                        <div class="col-md-2 title">支付方式</div>
                        <div class="col-md-10 data">
                            <div class="form-group form-inline">
                                <div class="radio"><label><input type="radio" name="optionsRadios-a13" value="1"> 未支付</label></div>
                                <div class="radio"><label><input type="radio" name="optionsRadios-a13" value="2"> 微信支付</label></div>
                                <div class="radio"><label><input type="radio" name="optionsRadios-a13" value="3"> 支付宝支付</label></div>
                            </div>
                        </div>

                        <div class="col-md-2 title">发票名称</div>
                        <div class="col-md-10 data text">
                            <div class="form-group form-inline">
                                <div class="radio"><label><input type="radio" name="optionsRadios-a13" value="1"> 不需要发票</label></div>
                                <div class="radio"><label><input type="radio" name="optionsRadios-a13" value="2"> 个人</label></div>
                                <div class="radio"><label><input type="radio" name="optionsRadios-a13" value="3"> 单位名称</label></div>
                            </div>
                        </div>

                        <div class="col-md-2 title">订单状态</div>
                        <div class="col-md-10 data text">
                            已支付
                        </div>

                        <div class="col-md-2 title">状态改变</div>
                        <div class="col-md-10 data line-height36">
                            <div class="form-group form-inline">
                                <div class="checkbox"><label><input type="checkbox" value="1"> 发送短信或邮件(仅本次有效)</label></div>
                            </div>
                        </div>

                        <div class="col-md-2 title rowHeight2x">管理员备注</div>
                        <div class="col-md-10 data rowHeight2x">
                            <textarea class="form-control" rows="3" placeholder="管理员备注"></textarea>
                        </div>

                    </div>
                </div>
                <!--订单处理/-->

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
                    <button type="button" class="btn bg-maroon">保存</button>
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