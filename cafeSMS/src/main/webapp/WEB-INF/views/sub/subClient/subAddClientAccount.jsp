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
		<h1>가맹거래처추가</h1>
			<form action="/subAddSubAccount" method=POST>
				<input type="hidden" name="subCode" value="${subLogin.subCode}">
				<div>
					거래처명 : <input type="text" name="subClientName">
				</div>
				<div>
					거래처담당자명 : <input type="text" name="subClientInCharge">
				</div>
				<div>
					거래처연락처 : <input type="text" name="subClientPhone">
				</div>
				<div>
					거래처주소 : <input type="text" name="subClientAddr">
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