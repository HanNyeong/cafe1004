<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addSubStaff</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script>
//유효성 검사
$(document).ready(function(){   
	
   // 폼 제출
   $('#subStaffAddBtn').click(function(){
    	 var check = undefinedEvent($('#subStaffAddBtn'),$('#addSubStaffForm'),$('#valChekMsg'));
   });
});

</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<c:choose>
<c:when test="${subStaff == null }">
	<div class="row">
		<div class="col-sm-4">
		</div>
		<div class="col-sm-3 addForm">
			<h1> 가맹 직원 등록 </h1>
			<form action="/subAddSubStaff" method="POST" id="addSubStaffForm">
				<div>
					<p>이름 : <input type="text" id="subStaffName" name="subStaffName" value="" valChek="이름을 입력해주세요"/></p>
					<p>비밀번호 : <input type="password" id="Pw" name="subStaffPw" value="" valChek="비밀번호를 입력해주세요"/></p>
					<p>비밀번호 확인: <input type="password" id="Pw2" name="subStaffPw2" value="" valChek="비밀번호를  확인해주세요"/></p>
					<p>직급 :	         
						<select id="subStaffLevel" name="subStaffLevel" valChek="직급을 선택해주세요">
							<option value="">::: 직급 :::</option>
							<option value="1">점주</option>
							<option value="2">매니저</option>               
						</select>
					<p>입사일 : <input type="date" name="subStaffJoin" id="subStaffJoin" value="" valChek="입사일을 지정해주세요."/></p>
					<p>급여 : <input type="text" name="subStaffSalary" id="subStaffSalary" value="" valChek="급여를 입력해주세요."/></p>
				</div>
				<br/>
				<div class="clickBtn">
					<span id="valChekMsg"></span>
					<input type="button" id="subStaffAddBtn" class="btn btn-default" name="subStaffAddBtn" value="등록"/>
					<a href="/"><input type="button" class="btn btn-default" value="취소"/></a>
				</div>
				<br/>
			</form>
		</div>
		<div class="col-sm-5">
		</div>
	</div>
</c:when>
<c:otherwise>
	<div class="row">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-8 plusForm">
				<h1 id="redId"><small>아이디는 </small>${subStaff.subStaffCode}<small> 입니다.</small></h1>
					홈으로 가기 → <a href="/">Home</a>
			</div>
			<div class="col-sm-2">
			</div>
		</div>
</c:otherwise>
</c:choose>

<jsp:include page="/WEB-INF/module/footer.jsp"/>
   
</body>