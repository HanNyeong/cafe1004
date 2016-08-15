<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subAddSubClient</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
	//폼 제출 유효성
	undefinedEvent($('#addClientBtn'),$('#addClientForm'),$('#valChekMsg'));
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-4">
	</div>
	<div class="col-sm-3 addForm">
		<h1>가맹거래처추가</h1>
			<form action="/addClient" id="addClientForm" method=POST>
				<input type="hidden" name="subCode" value="${subLogin.subCode}">
				<div>
					거래처명 : <input type="text" name="subClientName" value="" valChek="거래처 명을 입력 해주세요">
				</div>
				<div>
					거래처담당자명 : <input type="text" name="subClientInCharge" value="" valChek="거래처 담당자 명을 입력 해주세요">
				</div>
				<div>
					거래처연락처 : <input type="text" name="subClientPhone" value="" valChek="거래처 연락처를 입력 해주세요">
				</div>
				<div>
					거래처주소 : <input type="text" name="subClientAddr" value="" valChek="거래처 주소를 입력 해주세요">
				</div>
				<br/>
				<div class="clickBtn">
					<span id="valChekMsg"></span>
					<button type="button" id="addClientBtn" class="btn btn-default">등록</button>
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