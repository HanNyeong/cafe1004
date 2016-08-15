<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
	//유효성 검사
				undefinedEvent($('#loginBtn'),$('#loginForm'),$('#loginValChekMsg'));			
				undefinedEvent2($('#claimBtn'),$('#claimMainForm'),$('#claimValChekMsg'));		
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-xs-2">
	</div>
	<div class="col-xs-3">
		<c:if test="${subLogin eq null}">
			<div class="container">
				<form role="form" action="/customerViewClaimList" method="get" id="claimMainForm">
					<h2>고객  센터</h2>
					<div class="form-group">
						<label for="customerName">이름 : </label>
						<input type="text" class="form-control" id="customerName" name ="customerName" placeholder="이름을 입력해주세요." value="서지연" valChek2="이름을 입력해주세요">
					</div>
					<div class="form-group">
						<label for="customerPhone">전화번호:</label>
						<input type="text" class="form-control" id="customerPhone" name = "customerPhone" placeholder="핸드폰 번호를 입력해주세요." value="01092014268" valChek2="전화번호를 입력해주세요">
					</div>
					<div class="right">
						<span id="claimValChekMsg"></span>
						<a href="/customerAddClaim">고객불만등록</a> <input type="button" class="btn btn-default" id="claimBtn" value="검색"/>
					</div>
				</form>
			</div>
		</c:if>
	</div>
	<div class="col-xs-2">
	</div>
	<div class="col-xs-3">
		<c:if test="${subLogin eq null}">
			<div class="container">
				<form role="form" action="/subLogin" method="POST" id="loginForm">
				<h2>로그인</h2>
					<div class="form-group">
						<label for="subCode">아이디 : </label>
						<input type="text" class="form-control" id="subCode" name ="subCode" placeholder="Enter ID" value="sub_code1" valChek="아이디를 입력해주세요">
					</div>
					<div class="form-group">
						<label for="staffPw">비밀번호:</label>
						<input type="password" class="form-control" id="subPassword" name = "subPassword" placeholder="Enter password" value="1234" valChek="비밀번호를 입력해주세요">
					</div>
					<div class="right">
						<span id="loginValChekMsg"></span>
						<input type="button" class="btn btn-default" id="loginBtn" value="로그인"/>
					</div>
				</form>
			</div>
		</c:if>
	</div>
	<div class="col-xs-2">
	</div>
</div>
<br/>
<div class="row">
	<div class="col-sm-2">
	</div>
	<c:if test="${subLogin eq null}">
		<div class="col-sm-8">
			<jsp:include page="menuChart.jsp"/>	
		</div>
	</c:if>
	<c:if test="${subLogin ne null}">
		<div class="col-sm-4">
			<jsp:include page="menuChart.jsp"/>	
		</div>
		<div class="col-sm-4">
			<jsp:include page="priceChart.jsp"/>	
		</div>
	</c:if>
	<div class="col-sm-2">
	</div>
</div>

<!-- 행사관리  -->
<div class="row" id="row">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-8">	
		<div class="container">
			<br>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>
	
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="/resources/img/latte.PNG" alt="latte" width="460" height="345">
			</div>
			
			<div class="item">
				<img src="/resources/img/bingsu.PNG" alt="bingsu" width="460" height="345">
			</div>
			
			<div class="item">
				<img src="/resources/img/tea.PNG" alt="tea" width="460" height="345">
			</div>
			
			<div class="item">
				<img src="/resources/img/spring.PNG" alt="spring" width="460" height="345">
			</div>
		</div>
	
		<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</div>
	<div class="col-sm-2">
	</div>
</div>

<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>
