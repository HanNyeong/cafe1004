<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subAddClientAccount</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){   
		//폼 제출 유효성
		 undefinedEvent($('#subAccountByClientBtn'),$('#SubAccountByClientForm'),$('#valChekMsg'));
	});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-4">
	</div>
	<div class="col-sm-3 addForm">
		<h1>거래처지출내역</h1>
			<form action="subAddSubAccountByClient" id="SubAccountByClientForm" method=POST>
				<input type="hidden" name="subCode" value="${subLogin.subCode}">
				<input type="hidden" name="totalAccountGroup" value="${clientList.totalAccountGroup}">
				<input type="hidden" name="subClientCode" value="${clientList.subClientCode}">
				<div>
					거래처명 : <input type="text" value="${clientList.subClientName}" readonly="readonly" valChek="거래처명을 입력 해주세요"/>
				</div>
				<div>
					지출금액 : <input type="number" name="subAccountPrice" min="1" valChek="지출 금액을 입력 해주세요">
				</div>
				<div>
					지출내역 : <input type="text" name="subAccountDetail" value="" valChek="지출 내역을 입력 해주세요">
				</div>
				<br/>
				<div class="clickBtn">
					<span id="valChekMsg"></span>
					<button type="button" id="subAccountByClientBtn" class="btn btn-default">등록</button>
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