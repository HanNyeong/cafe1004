<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subAddSubDump</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $('#addSubDumpBtn').click(function(){
    	
       $('#addSubDumpForm').submit();
    });
 });
</script>
</head>
<body>
<h1> 장바구니 수정 </h1>
<form action="/subAddSubDump" method="POST" id="addSubDumpForm">
 	<div>
	   	<p>폐기 사유 :<input type="text" id="subDumpReason" name="subDumpReason" value=""/></p>
		<p>본사 상품 코드 :<input type="text" id="headItemCode" name="headItemCode" readonly="readonly" value="${reSubDump.headItemCode}"/></p>
		<p>개별 상품 코드:<input type="text" id="specificItemCode" name="specificItemCode" readonly="readonly" value="${reSubDump.specificItemCode}"/></p>
		<p>가맹 폐기 담당 직원 :<input type="text" id="subStaffCode" name="subStaffCode" value=""/></p>
		<p>가맹대표코드 :<input type="text" id="subCode" name="subCode" readonly="readonly" value="${reSubDump.subCode}"/></p>
	</div>

   <div>
      <input type="button" id="addSubDumpBtn" name="addSubDumpBtn" value="등록"/>      
   </div>
</form> 
</body>
</html>