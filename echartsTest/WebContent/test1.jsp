<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="js/echarts3/echarts.js"></script>
</head>
<body>
	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
	<div id="main" style="width: 600px; height: 400px;"></div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
    	var myChart = echarts.init(document.getElementById('main'));
        //动态图前期加载
        var xdata=[1,2,3,4,5,6];
        var ydata=[2,3,4,5,6,7];
       
     // 显示标题，图例和空的坐标轴
     myChart.setOption({
         title: {
             text: '异步数据加载示例'
         },
         tooltip: {//提示框组件
             trigger: 'axis',
             
         },
         legend: {//图例显示组件,data与series的name对应
             data:['销量'],
             axisLabel:{
                   interval:0
               }
         },
         xAxis : [
             {
                        
                 boundaryGap : false,//X轴距离y轴无缝隙
//                  min:0,
//                  max:60,
                 data: [],
                 splitLine:{
                     show:false 
                  },
                  axisLabel:{
                      interval:0
                  }
             },
            
         ],
         yAxis: {},
         series: [{
             name: '销量',
             type: 'line',//数据显示类型(柱状图bar/折线line)
             data: []
         }]
     });

      setInterval(function () {
             myChart.setOption({
                 xAxis: {
                     data: xdata
                 },
                 series: [{
                     // 根据名字对应到相应的系列
                     name: '销量',
                     data: ydata
                 }]
             });
         }, 1*1000);   
	</script>
</body>
</html>