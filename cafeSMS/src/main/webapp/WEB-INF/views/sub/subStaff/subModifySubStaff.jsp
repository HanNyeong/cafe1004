<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subModifySubStaff</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
	//폼 제출 유효성
	 var check = undefinedEvent($('#headModifySubStaffBtn'),$('#headModifySubStaffForm'),$('#valChekMsg'));
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-4">
	</div>
	<div class="col-sm-3 addForm">
		<h2> 가맹 직원 정보 수정 </h2>
		<form action="/subModifySubStaff" method="POST" id="headModifySubStaffForm">
		   <input type="hidden" name="subStaffCode" value="${reSubStaff.subStaffCode}" />
		   <input type="hidden" name="headStaffId" value="${headStaff.headStaffId}" />
		   <input type="hidden" name="subCode" value="${subLogin.subCode}" />
		<div>
		   	<p>가맹 직원 ID : ${reSubStaff.subStaffCode}</p>
		 	<p>이름 : <input type="text" id="subStaffName" name="subStaffName" value="${reSubStaff.subStaffName}" valChek="이름을 입력해주세요"/></p>
			<p>가맹대표코드 : ${reSub.subCode}</p>
			<p>직급 : <input type="text" name="subStaffLevel" id="subStaffLevel" value="${reSubStaff.subStaffLevel}"  valChek="직급을 입력해주세요"/></p>
			<p>입사일 : ${reSubStaff.subStaffJoin}</p>
			<p>퇴사일 : ${reSubStaff.subStaffResign}</p>
			<p>승인 본사 직원 ID : ${headStaff.headStaffId}</p>
			<p>승인 날짜 : ${reSubStaff.subStaffPermitDate}</p>
			<p>등록일자 : ${reSubStaff.subStaffRegitDate}</p>
			<p>급여 :<input type="text" name="subStaffSalary" id="subStaffSalary" value="${reSubStaff.subStaffSalary}"  valChek="급여를 입력해주세요"/></p>
		</div>
		<br/>
			<div class="clickBtn">
				<span id="valChekMsg"></span>
				<input type="button" class="btn btn-default" id="headModifySubStaffBtn" name="headModifySubStaffBtn" value="수정"/>     
			</div>
		<br/>
		</form> 
	</div>
	<div class="col-sm-5">
	</div>
</div>
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>