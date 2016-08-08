<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-4">
	</div>
	<div class="col-sm-3 addForm">
		<h1>가맹거래처수정</h1>
			<form action="/modifyClient" method=POST>
				<div>
					거래처코드 : <input type="text" class="inputNoLine" name="subClientCode" readonly="readonly" value="${reClient.subClientCode}">
				</div>
				<div>
					거래처명 : <input type="text" class="inputNoLine" name="subClientName" readonly="readonly" value="${reClient.subClientName}">
				</div>
				<div>
					거래처담당자명 : <input type="text" name="subClientInCharge" value="${reClient.subClientInCharge}">
				</div>
				<div>
					거래처연락처 : <input type="text" name="subClientPhone" value="${reClient.subClientPhone}">
				</div>
				<div>
					거래처주소 : <input type="text" name="subClientAddr" value="${reClient.subClientPhone}">
				</div>
				<br/>
				<div class="clickBtn">
					<button class="btn btn-default">수정</button>
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