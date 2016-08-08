<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ViewSubList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/subListPop.js"></script>
</head>
<body>
	<div>

		     	<div>가맹대표코드 : ${subList.subCode}</div>
				<div>본사직원ID : ${subList.headStaffId}</div>
				<div>가맹등록날짜 : ${subList.subRegitDate}</div>
				<div>가맹점 명 : ${subList.subName}</div>
				<div>가맹점주명 :${subList.subKeeper} </div>
				<div>연락처 : ${subList.subTelephone}</div>
				<div>주소 : ${subList.subAddr}</div>

	            
	</div>
<a href="/">홈으로</a>
</body>
</html>