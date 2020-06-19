<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap-3.3.7-dist/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>可视化</title>
</head>
<body>
	<div class="row">
	  <div class="col-md-6" id="main" style="width: 600px;height:400px;"></div>
	  <div class="col-md-6" id="main2" style="width: 600px;height:400px;"></div>
	</div>
	<div class="row">
	  <div class="col-md-12" id="main3" style="width: 1400px;height:400px;"></div>
	  
	</div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
  <!-- <div id="main" style="width: 600px;height:400px;"></div> -->
  <script type="text/javascript">
      // 基于准备好的dom，初始化echarts实例
      var myChart = echarts.init(document.getElementById('main'));

      var arr = new Array();
      var index = 0;
      <c:forEach items="${t}" var="t">
          arr[index++] = ${t.count};
      </c:forEach>

      // 指定图表的配置项和数据
      var option = {
          title: {
              text: '购买种类'
          },
          tooltip: {
              show: true
          },
          legend: {
              data:['数据值']
          },
          xAxis : [
              {
                  type : 'category',
                  data : [
                      <c:forEach items="${t}" var="t2">
                      ["${t2.type}"],
                      </c:forEach>
                  ]
              }
          ],
          yAxis : [
              {
                  type : 'value'
              }
          ],
          series : [
              {
                  name:'数据值',
                  type:'bar',
                  data: arr
              }
          ]
      };

      // 使用刚指定的配置项和数据显示图表。
      myChart.setOption(option);
  </script>
  
  <script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main2'));

    // 指定图表的配置项和数据
    option = {
        title : {
            text: '购买商品统计',
            subtext: '饼状图',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: [
                <c:forEach items="${t}" var="t">
                    ["${t.type}"],
                </c:forEach>
            ]
        },
        series : [
            {
                name: '购买商品',
                type: 'pie',
                radius : '70%',
                center: ['50%', '50%'],
                data:[
                    <c:forEach items="${t}" var="t2">
                    {value:"${t2.count}", name:"${t2.type}"},
                    </c:forEach>
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main3'));

    var sale = new Array;
    var index = 0;
    <c:forEach items="${t}" var="t">
        sale[index++] = ${t.count};
    </c:forEach>

    option = {
        tooltip: {
            trigger: 'axis',
            position: function (pt) {
                return [pt[0], '10%'];
            }
        },
        title: {
            left: 'center',
            text: '购买种类图',
        },
        toolbox: {
            feature: {
                dataZoom: {
                    yAxisIndex: 'none'
                },
                restore: {},
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: [
                <c:forEach items="${t}" var="t2">
                    ["${t2.type}"],
                </c:forEach>
            ]
        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, '100%']
        },
        dataZoom: [{
            type: 'inside',
            start: 0,
            end: 10
        }, {
            start: 0,
            end: 10,
            handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
            handleSize: '80%',
            handleStyle: {
                color: '#fff',
                shadowBlur: 3,
                shadowColor: 'rgba(0, 0, 0, 0.6)',
                shadowOffsetX: 2,
                shadowOffsetY: 2
            }
        }],
        series: [
            {
                name:'购买种类',
                type:'line',
                smooth:true,
                symbol: 'none',
                sampling: 'average',
                itemStyle: {
                    normal: {
                        color: 'rgb(255, 70, 131)'
                    }
                },
                areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: 'rgb(255, 158, 68)'
                        }, {
                            offset: 1,
                            color: 'rgb(255, 70, 131)'
                        }])
                    }
                },
                data: sale
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>