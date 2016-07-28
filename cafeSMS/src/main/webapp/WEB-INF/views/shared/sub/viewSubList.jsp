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
	<table>
	      <tr>
		     	<th>가맹 대표 코드</th>
				<th>본사 직원 ID</th>
				<th>가맹 등록 날짜</th>
				<th>가맹점 명</th>
				<th>가맹 점주 명</th>
				<th>연락처</th>
				<th>주소</th>
				<th></th>	         
	      </tr>
	      <tr>
	         <td>${subList.subCode}</td>
	         <td>${subList.headStaffId}</td>
	         <td>${subList.subRegitDate}</td>
	         <td>${subList.subName}</td>
	         <td>${subList.subKeeper}</td>
	         <td>${subList.subTelephone}</td>
	         <td>${subList.subAddr}</td>
	         <td>
	            <a href="/headModifySub?subCode=${subList.subCode}"><input type="button" value="수정"/></a>
	         </td>
	      </tr>
	</table>
<a href="/">홈으로</a>
</body>
</html>