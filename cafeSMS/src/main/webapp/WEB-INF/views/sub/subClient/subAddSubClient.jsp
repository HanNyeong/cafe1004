<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subAddSubClient</title>
</head>
<body>
	<h1>가맹거래처추가</h1>
	<form action="/addClient" method=POST>
		기입사항
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
		<button>등록</button>
	</form>
</body>
</html>