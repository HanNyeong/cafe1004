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
var week = 7;
var day = Array();
for(var i= 0; i<week; i++){
	day[i] = new Date();
	day[i].setDate(day[i].getDate()-i);
}
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
  labels : [day[6].getDate(),day[5].getDate(),day[4].getDate(),day[3].getDate(),day[2].getDate(),day[1].getDate(),day[0].getDate()],
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