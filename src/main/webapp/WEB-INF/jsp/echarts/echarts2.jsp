<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/web/jsp/header.jsp"%>
<title>图表1</title>
</head>
<body style=" margin: 0">
<div id="container" style="height: 400px;"></div>
<script type="text/javascript" src="${pageContext.request.contextPath}/web/js/echarts.min.js"></script>
<script type="text/javascript">
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('container'));

ajax("/order/search", {productCode:"庚师傅"}, "json", function(d){
	console.log(d);
	var names=d.data;
	var list=[];
	var count=[];
	for(var i=0;i<names.length;i++){
		list.push(names[i].customerModel.name);
		count.push(names[i].count);
		}
	console.log(list);
	console.log(count);
	// 指定图表的配置项和数据
	var option = {
	    title: {
	        text: 'ECharts 入门示例'
	    },
	    tooltip: {},
	    legend: {
	        data:['数量']
	    },
	    xAxis: {
	        data: list
	    },
	    yAxis: {},
	    series: [{
	        name: '数量',
	        type: 'bar',
	        data: count
	    }]
	};
	option = {
		    title: {
		        text: '销售数量',
		        subtext: '数据来自网络'
		    },
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'shadow'
		        }
		    },
		    legend: {
		        data: ['数量', '2012年']
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis: {
		        type: 'value',
		        boundaryGap: [0, 0.01]
		    },
		    yAxis: {
		        type: 'category',
		        data: list
		    },
		    series: [
		        {
		            name: '数量',
		            type: 'bar',
		            data: count
		        }
		    ]
		};

	// 使用刚指定的配置项和数据显示图表。
	myChart.setOption(option);
})
</script>
</body>
</html>