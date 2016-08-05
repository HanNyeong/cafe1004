<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link type="text/css" rel="stylesheet" href="resources/css/css1.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>nav.jsp</title>
</head>
<body>

<div class="row">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-8">
		<div id="mainpng">
			<img src="/resources/img/main.png" >
		</div>
		<div class="container">
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
				<li><a href="/subViewMenuList">메뉴관리</a></li>
			
			<!-- 발주관리 -->
				<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				발주관리 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/viewOrdersList?subCode=${subLogin.subCode}">발주관리</a></li>
						<li><a href="/subViewCartList?subCode=${subLogin.subCode}">장바구니</a></li>
						<li><a href="#">배송관리</a></li>
					</ul>
				</li>
				
			<!-- 가맹관리 -->
				<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				가맹관리 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/modifySub?subCode=${subLogin.subCode}">가맹관리</a></li>
						<li><a href="/subViewSubClientList?subCode=${subLogin.subCode}">거래처관리</a></li>
						<li><a href="/viewSubStaffList?subCode=${subLogin.subCode}">직원관리</a></li>
						<li><a href="/subViewContractList?subCode=${subLogin.subCode}">계약관리</a></li>
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
				본사관리 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/headAddSub">가맹관리</a></li>
						<li><a href="#">발주조회</a></li>
						<li><a href="/headViewClaimList">클래임조회</a></li>
						<li><a href="/headViewDeliveryList">배송조회</a></li>
						<li><a href="/headViewReturnsList">반품조회</a></li>
						<li><a href="/headViewContractList">계약조회</a></li>
					</ul>
				</li>
				
			<!-- 기타 -->
				<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				기타 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/viewEventList">행사관리</a></li>
						<li><a href="/subViewClaimList?subCode=${subLogin.subCode}">고객관리</a></li>
					</ul>
				</li>
				
			<!-- 로그아웃 -->
				<li><a href="/logout">로그아웃</a></li>
			</c:if>
			
			
			<!-- 나중에 본사용 네비바 분리하기  -->
			</ul>
		</div>
	</div>
	<div class="col-sm-2">
	</div>
</div>
<br/>
<br/>
</body>
</html>