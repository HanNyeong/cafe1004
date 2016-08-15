<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subModifySubClient</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
	//폼 제출 유효성
	 undefinedEvent($('#modifyClientBtn'),$('#modifyClientForm'),$('#valChekMsg'));
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-4">
	</div>
	<div class="col-sm-3 addForm">
		<h1>가맹거래처수정</h1>
			<form action="/modifyClient" id="modifyClientForm" method=POST>
				<input type="hidden" name="subCode" value="${subLogin.subCode}">
				<div>
					거래처코드 : <input type="text" class="inputNoLine" name="subClientCode" readonly="readonly" value="${reClient.subClientCode}">
				</div>
				<div>
					거래처명 : <input type="text" class="inputNoLine" name="subClientName" readonly="readonly" value="${reClient.subClientName}">
				</div>
				<div>
					거래처담당자명 : <input type="text" name="subClientInCharge" value="${reClient.subClientInCharge}" valChek="거래처 담당자 명을 입력 해주세요">
				</div>
				<div>
					거래처연락처 : <input type="text" name="subClientPhone" value="${reClient.subClientPhone}" valChek="거래처 역락처를 입력 해주세요">
				</div>
				<div>
					거래처주소 : <input type="text" name="subClientAddr" value="${reClient.subClientPhone}" valChek="거래처 주소를 입력 해주세요">
				</div>
				<br/>
				<div class="clickBtn">
					<span id="valChekMsg"></span>
					<button type="button" id="modifyClientBtn" class="btn btn-default">수정</button>
				</div>
				<br/>
			</form>
	</div>
	<div class="col-sm-5">
	</div>
</div>
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>