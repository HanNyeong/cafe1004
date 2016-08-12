<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subAddClientAccount</title>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-4">
	</div>
	<div class="col-sm-3 addForm">
		<h1>거래처지출내역</h1>
			<form action="subAddSubAccountByClient" method=POST>
				<input type="hidden" name="subCode" value="${subLogin.subCode}">
				<input type="hidden" name="totalAccountGroup" value="${clientList.totalAccountGroup}">
				<input type="hidden" name="subClientCode" value="${clientList.subClientCode}">
				<div>
					거래처명 : <input type="text" value="${clientList.subClientName}" readonly/>
				</div>
				<div>
					지출금액 : <input type="number" name="subAccountPrice" min="1">
				</div>
				<div>
					지출내역 : <input type="text" name="subAccountDetail">
				</div>
				<br/>
				<div class="clickBtn">
					<button class="btn btn-default">등록</button>
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