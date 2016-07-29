<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subModifySubStaff</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
window.opener.location.reload();
	window.close();
$(document).ready(function(){
    $('#headModifySubStaffBtn').click(function(){
    	
       $('#headModifySubStaffForm').submit();
    });
 });
</script>
</head>
<body>
<h1> 가맹 직원 정보 수정 </h1>
<form action="/subModifySubStaff" method="POST" id="headModifySubStaffForm">
   <input type="hidden" name="subStaffId" value="${reSubStaff.subStaffCode}" />
   <input type="hidden" name="headStaffId" value="${headStaff.headStaffId}" />
   <input type="hidden" name="subCode" value="${reSub.subCode}" />
<div>
   	<p>가맹 직원 ID : ${reSubStaff.subStaffCode}</p>
 	<p>이름 : <input type="text" id="subStaffName" name="subStaffName" value="${reSubStaff.subStaffName}"/></p>
	<p>가맹대표코드 : ${reSub.subCode}</p>
	<p>직급 : <input type="text" name="subStaffLevel" id="subStaffLevel" value="${reSubStaff.subStaffLevel}"/></p>
	<p>입사일 : ${reSubStaff.subStaffJoin}</p>
	<p>퇴사일 :<input type="text" name="subStaffResign" id="subStaffResign" value="${reSubStaff.subStaffResign}"/></p>
	<p>승인 본사 직원 ID : ${headStaff.headStaffId}</p>
	<p>승인 날짜 : ${reSubStaff.subStaffPermitDate}</p>
	<p>등록일자 : ${reSubStaff.subStaffRegitDate}</p>
	<p>급여 :<input type="text" name="subStaffSalary" id="subStaffSalary" value="${reSubStaff.subStaffSalary}"/></p>
</div>

   <div>
      <input type="button" id="headModifySubStaffBtn" name="headModifySubStaffBtn" value="수정"/>
      
   </div>
</form> 
</body>