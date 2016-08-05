<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subAddSubStaffSalary</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){            
	   // 폼 제출
	   $('#subStaffSalaryBtn').click(function(){
	      if ($('#subStaffCode').val() == ""){
	      }else if ($('#subAccountSum').val() == ""){
	      }else if ($('#subAccountDetail').val() == ""){
	      }else {
	         $('#subStaffSalaryForm').submit();
	      }
	   });
	});
</script>
</head>
<body>
	<h1></h1>
	<form action="/subStaffSalary" method="POST" id="subStaffSalaryForm">
	<!-- 수정이 필요함 -->
	<input type=text name="subCode" value="${subLogin.subCode}" readonly="readonly">
	<input type="text" name="subAccountFlow" value="${subAccount.subAccountFlow}" readonly="readonly">
	<input type="text" name="totalAccountGroup" value="${subAccount.totalAccountGroup}" readonly="readonly">
	<input type="text" name="subAccountTable" value="${subAccount.subAccountTable}" readonly="readonly">
	<input type="text" name="subjectCode" value="${subAccount.subjectCode}" readonly="readonly">
		<div>
			직원 코드 : <input type="text" id="subStaffCode" name="subStaffCode" value="${subAccount.subStaffCode}">			
		</div>
		<div>
			직원 급여 : <input type="text" id="subAccountSum" name="subAccountSum" value="${subAccount.subStaffSalary}">			
		</div>
		<div>
			상세 내용 : <input type="text" id="subAccountDetail" name="subAccountDetail" value="직원 급여">			
		</div>
		<input type="button" id="subStaffSalaryBtn" value="급여 지급">
	</form>
</body>
</html>