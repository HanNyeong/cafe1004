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
			$('#loginBtn').click(function(){
				console.log('로그인버튼 클릭');
				if( $('#subCode').val() == ""){
					$('#subCodeHelper').css('color', 'red');
					$('#subCodeHelper').text('가맹 코드를 입력해주세요');
				}else if( $('#subPassword').val() == ""){
					$('#subCodeHelper').text('');
					$('#subPasswordHelper').css('color', 'red');
					$('#subPasswordHelper').text('비밀번호를 입력해주세요');
				}else{
					$('#loginForm').submit();
				}			
			});
			$('#claimBtn').click(function() {
				console.log('고객 컴플레인 클릭');
				//이름,핸드폰번호 검사
				if( $('#customerName').val() == ""){
					$('#customerNameHelper').css('color', 'red');
					$('#customerNameHelper').text('이름을 입력해주세요');
				}else if( $('#customerPhone').val() == ""){
					$('#customerNameHelper').text('');
					$('#customerPhoneHelper').css('color', 'red');
					$('#customerPhoneHelper').text('전화번호를 입력해주세요');
				}  else {
					$('#claimMainForm').submit();
				}			
			});
			
			
			
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-4">
		<c:if test="${subLogin eq null}">
			<div class="container">
				<form role="form" action="/customerViewClaimList" method="get" id="claimMainForm">
					<h2>고객  센터</h2>
					<div class="form-group">
						<label for="customerName">이름 : </label>
						<input type="text" class="form-control" id="customerName" name ="customerName" placeholder="이름을 입력해주세요." value="서지연">
						<span id="customerNameHelper"></span>
					</div>
					<div class="form-group">
						<label for="customerPhone">전화번호:</label>
						<input type="text" class="form-control" id="customerPhone" name = "customerPhone" placeholder="핸드폰 번호를 입력해주세요." value="01092014268">
						<span id="customerPhoneHelper"></span>
					</div>
					<div class="right">
						<a href="/customerAddClaim">고객불만등록</a> <input type="button" class="btn btn-default" id="claimBtn" value="검색"/>
					</div>
				</form>
			</div>
		</c:if>
	</div>
	
	<div class="col-sm-4">
		<c:if test="${subLogin eq null}">
			<div class="container">
				<form role="form" action="/subLogin" method="POST" id="loginForm">
				<h2>로그인</h2>
					<div class="form-group">
						<label for="subCode">아이디 : </label>
						<input type="text" class="form-control" id="subCode" name ="subCode" placeholder="Enter ID" value="sub_code1">
						<span id="subCodeHelper"></span>
					</div>
					<div class="form-group">
						<label for="staffPw">비밀번호:</label>
						<input type="password" class="form-control" id="subPassword" name = "subPassword" placeholder="Enter password" value="1234">
						<span id="subPasswordHelper"></span>
					</div>
					<div class="right">
						<input type="button" class="btn btn-default" id="loginBtn" value="로그인"/>
					</div>
				</form>
			</div>
		</c:if>
	</div>
	<div class="col-sm-2">
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
		<div class="col-sm-3">
			<jsp:include page="menuChart.jsp"/>	
		</div>
		<div class="col-sm-5">
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
				<img src="/resources/img/spring.PNG" alt="spring" width="460" height="345">
			</div>
			
			<div class="item">
				<img src="/resources/img/bingsu.PNG" alt="bingsu" width="460" height="345">
			</div>
			
			<div class="item">
				<img src="/resources/img/tea.PNG" alt="tea" width="460" height="345">
			</div>
			
			<div class="item">
				<img src="/resources/img/latte.PNG" alt="latte" width="460" height="345">
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
