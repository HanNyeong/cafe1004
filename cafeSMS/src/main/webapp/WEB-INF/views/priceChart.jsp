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
		<div class='title'>주간 매출현황</div>
		<div class='chart' id='p1'>
			<canvas id='c1'></canvas>
		</div>
	</div>
	<c:forEach items="${map.priceChart}" var="priceChart">
		<input type="hidden" class="priceChart" name="priceChart" value="${priceChart}" >
	</c:forEach>
<script>
var day1 = new Date();
var day2 = new Date();
var day3 = new Date();
var day4 = new Date();
var day5 = new Date();
var day6 = new Date();
var day7 = new Date();
day2.setDate(day2.getDate()-1);
day3.setDate(day3.getDate()-2);
day4.setDate(day4.getDate()-3);
day5.setDate(day5.getDate()-4);
day6.setDate(day6.getDate()-5);
day7.setDate(day7.getDate()-6);
//priceChart
var c1 = document.getElementById("c1");
var parent = document.getElementById("p1");
c1.width = parent.offsetWidth - 40;
c1.height = parent.offsetHeight - 40;
var val =document.getElementsByName("priceChart");

for(var i=0; i<val.length; i++) {
	console.log(val[i].value);
	}
var data1 = {
  labels : [day7.getDate(),day6.getDate(),day5.getDate(),day4.getDate(),day3.getDate(),day2.getDate(),day1.getDate()],
  datasets : [
    {
      fillColor : "rgba(255,255,255,.1)",
      strokeColor : "rgba(255,255,255,1)",
      pointColor : "#123",
      pointStrokeColor : "rgba(255,255,255,1)",
      data : [val[6].value,val[5].value,val[4].value,val[3].value,val[2].value,val[1].value,val[0].value]
    }
  ]
}

var options1 = {
  scaleFontColor : "rgba(255,255,255,1)",
  scaleLineColor : "rgba(255,255,255,1)",
  scaleGridLineColor : "transparent",
  bezierCurve : false,
  scaleOverride : true,
  scaleSteps : 10,
  scaleStepWidth : 10000,
  scaleStartValue : 0
}

new Chart(c1.getContext("2d")).Line(data1,options1)

</script>
</body>
</html>