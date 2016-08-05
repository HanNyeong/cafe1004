<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="resources/css/css1.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#loginBtn').click(function() {
			console.log('로그인버튼 클릭');
			//아이디, 비밀번호 입력여부 검사
			if ($('#subCode').val() == "") {
				//console.log('아이디 미입력');
				alert('아이디를 입력하세요.');
			} else if ($('#subPassword').val() == "") {
				//console.log('비밀번호 미입력');
				alert('비밀번호를 입력하세요.');
			}  else {
				$('#loginForm').submit();
			}
			
		});
		$('#claimBtn').click(function() {
			console.log('고객 컴플레인 클릭');
			//이름,핸드폰번호 검사
			if ($('#customerName').val() == "") {
				alert('이름 입력하세요.');
			} else if ($('#customerPhone').val() == "") {
				alert('전화번호를 입력하세요.');
			}  else {
				$('#claimForm').submit();
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
				<form role="form" action="/customerViewClaimList" method="get" id="claimForm">
					<h2>고객  센터</h2>
					<div class="form-group">
						<label for="customerName">이름 : </label>
						<input type="text" class="form-control" id="customerName" name ="customerName" placeholder="이름을 입력해주세요.">
					</div>
					<div class="form-group">
						<label for="customerPhone">전화번호:</label>
						<input type="text" class="form-control" id="customerPhone" name = "customerPhone" placeholder="핸드폰 번호를 입력해주세요.">
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
				<form role="form" action="/subLogin" method="post" id="loginForm">
				<h2>로그인</h2>
					<div class="form-group">
						<label for="subCode">아이디 : </label>
						<input type="text" class="form-control" id="subCode" name ="subCode" placeholder="Enter ID">
					</div>
					<div class="form-group">
						<label for="staffPw">비밀번호:</label>
						<input type="password" class="form-control" id="subPassword" name = "subPassword" placeholder="Enter password">
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
		<div class="col-sm-8" id="plus">
			<h3>☞ 이 달의 행사 ☜</h3>
			<a href="/viewEventList"><img src="/resources/img/1plus1.png"/></a>
		</div>
	<div class="col-sm-2">
	</div>
</div>
<div class="row">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-8">
		<P>  The time on the server is ${serverTime}. </P>
		
		<a href="/subViewContractList?subCode=${subLogin.subCode}">[계약/가맹계약조회]</a>
		<a href="/headViewContractList">[계약/본사계약조회]</a>
		<a href="/subViewClaimList?subCode=${subLogin.subCode}">[클래임/가맹클래임조회]</a>
		<a href="/headViewClaimList">[클래임/본사클래임조회]</a>
		<a href="/subViewDeliveryList?subCode=${subLogin.subCode}">[배송/가맹측 배송조회]</a>
		<a href="/headViewDeliveryList">[배송/본사측 배송조회]</a>
		<a href="/headViewReturnsList">[반품/본사측 반품상품조회]</a>
		<a href="/subViewReturnsList?subCode=${subLogin.subCode}">[반품/가맹측 반품상품조회]</a>
		<a href="/subViewSubClientList?subCode=${subLogin.subCode}">@가맹거래처조회@</a>
		<a href="/viewEventList">[행사조회]</a>
		<a href="/headAddSub">^^가맹 등록^^</a>
		<a href="/modifySub?subCode=${subLogin.subCode}">^^가맹수정^^</a>
		<a href="/viewSubStaffList?subCode=${subLogin.subCode}">^^가맹 직원 조회^^</a>
		<a href="/subViewMenuList">^^메뉴관리^^</a>
		<a href="/viewHeadItemList">^^본사 상품리스트^^</a>
		<a href="/subViewCartList?subCode=${subLogin.subCode}">^^장바구니^^</a>
		<a href="/viewSubjectList">@계정과목@</a>
		<a href="/viewOrdersList?subCode=${subLogin.subCode}">@발주내역조회@</a>
		<a href="/subViewSubDumpList">^^상품폐기^^</a>
		<a href="/subAccountKeeperCheck">^^가맹통합회계^^</a>
	</div>
	<div class="col-sm-2">
	</div>
</div>
</body>
</html>
