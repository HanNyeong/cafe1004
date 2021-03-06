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
  <script src="resources/function/undefinedCheck.js"></script>
<script src="resources/function/upDownCheck.js"></script>
<title>nav.jsp</title>
</head>
<body>

<div class="row">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-8">
		<div id="mainpng">
			<a href="/index"><img src="/resources/img/main.png" ></a>
		</div>
		<div class="container">
			<ul class="nav nav-tabs" role="tablist">
			
			<li class="active"><a href="/?subCode=${subLogin.subCode}">Home</a></li> 
			<c:if test="${subLogin ne null}">	 
			<!-- 상품관리 -->
				<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				상품관리 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/viewHeadItemList">상품목록</a></li>
						<li><a href="/subViewSubStockList?subCode=${subLogin.subCode}">재고관리</a></li>
						<li><a href="/subViewReturnsList?subCode=${subLogin.subCode}">반품관리</a></li>
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
						<li><a href="/subViewDeliveryList?subCode=${subLogin.subCode}">배송관리</a></li>
					</ul>
				</li>
				
			<!-- 가맹관리 -->
				<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				가맹관리 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/viewSubList?subCode=${subLogin.subCode}">가맹관리</a></li>
						<li><a href="/subViewSubClientList?subCode=${subLogin.subCode}">거래처관리</a></li>
						<li><a href="/viewSubStaffList?subCode=${subLogin.subCode}">직원관리</a></li>
						<li><a href="/subViewContractList?subCode=${subLogin.subCode}">계약관리</a></li>
						<li><a href="/subViewClaimList?subCode=${subLogin.subCode}">고객클래임관리</a></li>
					</ul>
				</li>
				
			<!-- (통합)회계관리 -->
				<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				회계관리 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/subAccountKeeperCheck">회계관리</a></li>
						<li><a href="/subViewSubSellList?subCode=${subLogin.subCode}">판매 관리</a></li>
						<li><a href="/viewSubjectList">계정과목 관리</a></li>
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
			<!-- 구분을 위한 공백  -->	
				<li><a href="/"></a></li>
				<li><a href="/"></a></li>
				
				<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				본사관리(본사만)<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/headAddSub">가맹추가</a></li>
						<li><a href="/headViewOrdersList">발주조회</a></li>
						<li><a href="/headViewClaimList">클래임조회</a></li>
						<li><a href="/headViewDeliveryList">배송조회</a></li>
						<li><a href="/headViewReturnsList">반품조회</a></li>
						<li><a href="/headViewContractList">계약조회</a></li>
					</ul>
				</li>
			</c:if>
			<!-- 본사측 승인 관리 -->
			<c:if test="${subLogin eq null}">
				<li><a href="/headAddSub">가맹추가</a></li>
				<li><a href="/headViewOrdersList">발주조회</a></li>
				<li><a href="/headViewClaimList">클래임조회</a></li>
				<li><a href="/headViewDeliveryList">배송조회</a></li>
				<li><a href="/headViewReturnsList">반품조회</a></li>
				<li><a href="/headViewContractList">계약조회</a></li>
				<li><a href="/">← 본사관리(본사만)</a></li>
			</c:if>
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