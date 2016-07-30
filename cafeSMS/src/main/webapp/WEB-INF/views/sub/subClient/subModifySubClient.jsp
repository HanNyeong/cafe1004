<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>가맹거래처수정</h1>
	<form action="/modifyClient" method=POST>
		기입사항
		<div>
			거래처코드 : <input type="text" name="subClientCode" value="${reClient.subClientCode}">
		</div>
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
		<button>수정</button>
	</form>
</body>
</html>