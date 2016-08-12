<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<script src="resources/js/priceIndex.js"></script>
</body>
</html>