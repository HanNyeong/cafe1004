<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/normal.css">
<script src='http://cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js'></script>
<script src="resources/js/prefixfree.min.js"></script>
<title>priceChart</title>
</head>
<body>
	<div class='wrapper'>
		<div class='title'>실시간 매출현황</div>
		<div class='chart' id='p1'>
			<canvas id='c1'></canvas>
		</div>
	</div>
<script>


//priceChart
var c1 = document.getElementById("c1");
var parent = document.getElementById("p1");
c1.width = parent.offsetWidth - 40;
c1.height = parent.offsetHeight - 40;



var data1 = {
  labels : ["M","T","W","T","F","S","S"],
  datasets : [
    {
      fillColor : "rgba(255,255,255,.1)",
      strokeColor : "rgba(255,255,255,1)",
      pointColor : "#123",
      pointStrokeColor : "rgba(255,255,255,1)",
      data : [100,200,235,390,290,250,250]
    }
  ]
}

var options1 = {
  scaleFontColor : "rgba(255,255,255,1)",
  scaleLineColor : "rgba(255,255,255,1)",
  scaleGridLineColor : "transparent",
  bezierCurve : false,
  scaleOverride : true,
  scaleSteps : 5,
  scaleStepWidth : 100,
  scaleStartValue : 0
}

new Chart(c1.getContext("2d")).Line(data1,options1)

</script>
</body>
</html>