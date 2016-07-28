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
   <input type="hidden" name="subStaffId" value="${reSubStaff.subStaffId}" />
   <input type="hidden" name="headStaffId" value="${headStaff.headStaffId}" />
   <input type="hidden" name="subCode" value="${reSub.subCode}" />
<table>
   <tr>
      <td>가맹 직원 ID :</td>
      <td>${reSubStaff.subStaffId}</td>
   </tr>
   <tr>
      <td>이름 :</td>
      <td><input type="text" id="subStaffName" name="subStaffName" value="${reSubStaff.subStaffName}"/></td>
   </tr>  
   <tr>
      <td>가맹대표코드 :</td>
      <td>${reSub.subCode}</td>
   </tr>
   <tr>
      <td>직급 :</td>
      <td><input type="text" name="subStaffLevel" id="subStaffLevel" value="${reSubStaff.subStaffLevel}"/></td>
   </tr>
   <tr>
      <td>입사일 :</td>   
      <td>${reSubStaff.subStaffJoin}</td>
   </tr>
   <tr>
      <td>퇴사일 :</td>
      <td><input type="text" name="subStaffResign" id="subStaffResign" value="${reSubStaff.subStaffResign}"/></td>
   </tr> 
   <tr>
      <td>승인 본사 직원 ID :</td>
      <td>${headStaff.headStaffId}</td>
   </tr> 
   <tr>
      <td>승인 날짜 :</td>
      <td>${reSubStaff.subStaffPermitDate}</td>
   </tr> 
   <tr>
      <td>등록일자 :</td>
      <td>${reSubStaff.subStaffRegitDate}</td>
   </tr> 
   <tr>
      <td>급여 :</td>
      <td><input type="text" name="subStaffSalary" id="subStaffSalary" value="${reSubStaff.subStaffSalary}"/></td>
   </tr> 
</table>
   <div>
      <input type="button" id="headModifySubStaffBtn" name="headModifySubStaffBtn" value="수정"/>
      <a href="/"><input type="button" value="취소"/></a>
   </div>
</form>
   
</body>