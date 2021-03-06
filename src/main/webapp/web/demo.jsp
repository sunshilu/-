<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html style="height: 100%">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="height: 100%; margin: 0">
<div id="container" style="height: 100%"></div>
<script type="text/javascript" src="${pageContext.request.contextPath}/web/js/echarts.min.js"></script>
<script type="text/javascript">
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('container'));

// 指定图表的配置项和数据
var option = {
    title: {
        text: 'ECharts 入门示例'
    },
    tooltip: {},
    legend: {
        data:['销量']
    },
    xAxis: {
        data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
    },
    yAxis: {},
    series: [{
        name: '销量',
        type: 'bar',
        data: [5, 20, 36, 10, 10, 20]
    }]
};

// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
</script>
</body>
</html>