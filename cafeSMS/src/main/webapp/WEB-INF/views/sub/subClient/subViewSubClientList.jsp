<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subClientView</title>
</head>
<body>
	<h1>가맹거래처목록</h1>
	<c:forEach var="clientList" items="${clientList}">
		<div>
			거래처코드 : ${clientList.subClientCode}
		</div>
		<div>
			거래처명 : <a href="">${clientList.subClientName}</a>
		</div>
		<div>
			거래처등록일 : ${clientList.subClientRegitDate}
		</div>
		<div>
			거래처담당자명 : ${clientList.subClientInCharge}
		</div>
		<!-- 존폐의 유무를 생각해보자 -->
		<div>
			거래처계약상태 : ${clientList.subClientContract}
		</div>
		<div>
			거래처연락처 : ${clientList.subClientPhone}
		</div>
		<div>
			거래처주소 : ${clientList.subClientAddr}
		</div>
			<button><a href="/subModifySubClient?subClientCode=${clientList.subClientCode}">정보수정</a></button>
		<hr><hr>
	</c:forEach>
	
	<button><a href="/subAddSubClient">거래처추가</a></button>
</body>
</html>