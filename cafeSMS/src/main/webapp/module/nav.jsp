<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>nav.jsp</title>
</head>
<body>

<div class="container">
<h2>카페 관리 시스템 (Café Store Management System)</h2>
<ul class="nav nav-tabs" role="tablist">
	
	<li class="active"><a href="/">Home</a></li>
	<c:if test="${subLogin ne null}">	 
	<!-- 상품관리 -->
		<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
		상품관리 <span class="caret"></span></a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="/viewHeadItemList">상품목록</a></li>
				<li><a href="#">재고관리</a></li>
				<li><a href="#">반품관리</a></li>
				<li><a href="/subViewSubDumpList">폐기관리</a></li>
			</ul>
		</li>
		
	<!-- 메뉴관리 -->
		<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
		메뉴관리 <span class="caret"></span></a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="/subViewMenuList">메뉴관리</a></li>
				<li><a href="#">레시피 조회</a></li>
			</ul>
		</li>
	
	<!-- 발주관리 -->
		<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
		발주관리 <span class="caret"></span></a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">발주관리</a></li>
				<li><a href="#">장바구니</a></li>
				<li><a href="#">배송관리</a></li>
			</ul>
		</li>
		
	<!-- 가맹관리 -->
		<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
		가맹관리 <span class="caret"></span></a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">가맹관리</a></li>
				<li><a href="#">거래처관리</a></li>
				<li><a href="#">직원관리</a></li>
				<li><a href="#">계약관리</a></li>
			</ul>
		</li>
		
	<!-- (통합)회계관리 -->
		<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
		회계관리 <span class="caret"></span></a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="/subAccountKeeperCheck">회계관리</a></li>
				<li><a href="/viewSubjectList">계정과목 관리</a></li>
			</ul>
		</li>
		
	<!-- 본사측 승인 관리 -->
		<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
		승인관리 <span class="caret"></span></a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">가맹직원승인</a></li>
				<li><a href="#">발주승인</a></li>
				<li><a href="#">반품승인</a></li>
				<li><a href="#">계약승인</a></li>
			</ul>
		</li>
		
	<!-- 기타 -->
		<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
		기타 <span class="caret"></span></a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="/viewEventList">행사관리</a></li>
				<li><a href="/headViewClaimList">고객관리</a></li>
			</ul>
		</li>
		
	<!-- 로그아웃 -->
		<li><a href="/logout">로그아웃</a></li>
	</c:if>
</ul>

</div>

</body>
</html>