<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<li><em>Humans</em> <span>780</span></li>
			<li><em>Dogs</em> <span>300</span></li>
			<li><em>Cats</em> <span>100</span></li>
			<li><em>Slugs</em> <span>500</span></li>
			<li><em>Aliens</em> <span>1145</span></li>
		</ul>
	</section>
</main>

<script src="resources/js/menuIndex.js"></script>
</body>
</html>