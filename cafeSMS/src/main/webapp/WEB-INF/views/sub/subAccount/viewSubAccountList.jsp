<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
</script>
</head>
<body>
	<c:if test="${subKeeper == null or subKeeper.level != '점주'}">
		<h1>1급 제한 구역입니다.</h1>
		<form action="/subAccountKeeperCheck" method="POST">
			<div>코드 : <input type="text" name="subStaffCode" /></div>
			<div>비밀번호 : <input type="text" name="subStaffPw" /></div>
			<input type="button" id="subAccountBtn" value="확인">
		</form>
	</c:if>
	<c:if test="${subKeeper.level == '점주'}">
		<form action="">
			<c:forEach var="accountList" items="${subAccountList}">
				<div>
					<input type="checkbox" id="accountListCheck">
					#{accountList.subAccountCode}
					#{accountList.subAccountFlow}
					#{accountList.totalAccountGroup}
					#{accountList.subAccountTable}
					#{accountList.subAccountSum}
					#{accountList.subAccountRequestDate}
					#{accountList.subAccountCheck}
					#{accountList.subAccountDetail}
					#{accountList.subjectCode}
					#{accountList.subClientCode}
					#{accountList.subCode}
					#{accountList.subStaffCode}
					#{accountList.subStaffKeeper}	
				</div>
			</c:forEach>
		</form>
	</c:if>
</body>
</html>