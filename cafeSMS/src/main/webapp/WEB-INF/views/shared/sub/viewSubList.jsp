<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>viewSubList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/subListPop.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-4">
	</div>
		<div class="col-sm-3 addForm">			
			<h2>나의 가맹 정보</h2>
		     	<div>가맹대표코드 : ${viewSubList.subCode}</div>
				<div>본사직원ID : ${viewSubList.headStaffId}</div>
				<div>가맹등록날짜 : ${viewSubList.subRegitDate}</div>
				<div>가맹점 명 : ${viewSubList.subName}</div>
				<div>가맹점주명 :${viewSubList.subKeeper} </div>
				<div>연락처 : ${viewSubList.subTelephone}</div>
				<div>주소 : ${viewSubList.subAddr}</div>
				<br/>
			<div class="clickBtn">
				<a href="/modifySub?subCode=${subLogin.subCode}"><button class="btn btn-default">수정</button></a>
			</div>
			<br/>
		</div>
	<div class="col-sm-5">
	</div>
</div>

<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>