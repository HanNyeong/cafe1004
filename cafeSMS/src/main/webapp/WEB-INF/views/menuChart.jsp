<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/normalize.css">
<script src="resources/js/prefixfree.min.js"></script>
<script	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<title>menuChart</title>
</head>
<body>
<main>
	<h1>인기 메뉴<small>(판매량 기준)</small></h1>
	<section>
		<div class="pieID pie"></div>
		<ul class="pieID legend">
		<c:forEach var="chart" items="${map.menuChart}">
			<li><em>${chart.menuName}</em><span>${chart.counts}</span></li>
<%-- 			<li><em>${chart.menuName}</em><span>${chart.counts}</span></li> --%>
		</c:forEach>
		</ul>
	</section>
</main>

<script src="resources/js/menuIndex.js"></script>
</body>
</html>