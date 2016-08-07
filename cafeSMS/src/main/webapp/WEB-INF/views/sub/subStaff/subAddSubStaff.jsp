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
      if ($('#subStaffName').val() == ""){
         alert("직원 이름을 입력해주세요.");
      }else if ($('#subStaffPw').val() == ""){
         alert("비밀번호를 입력해주세요.");
      }else if ($('#subStaffPw2').val() == ""){
          alert("비밀번호 확인을 해주세요.");
      }else if ($('#subStaffPw').val() != $('#subStaffPw2').val()){
          alert("비밀번호가 일치하지 않습니다.");
      }else if ($('#subStaffLevel').val() == ""){
         alert("직급을 선택해주세요.");
      }else if ($('#subStaffJoin').val() == ""){
         alert("입사일를 입력해주세요.");
      }else if ($('#subStaffSalary').val() == ""){
          alert("급여를 입력해주세요.");
      }else {
         $('#addSubStaffForm').submit();
         
      }
   });
});

</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<c:choose>
<c:when test="${subStaff == null }">
	<div class="row">
		<div class="col-sm-5">
		</div>
		<div class="col-sm-2 addForm">
			<h1> 가맹 직원 등록 </h1>
			<form action="/subAddSubStaff" method="POST" id="addSubStaffForm">
				<div>
					<p>이름 : <input type="text" id="subStaffName" name="subStaffName" /></p>
					<p>비밀번호 : <input type="password" id="subStaffPw" name="subStaffPw"/></p>
					<p>비밀번호 확인: <input type="password" id="subStaffPw2" name="subStaffPw2"/></p>
					<p>직급 :	         
						<select id="subStaffLevel" name="subStaffLevel">
							<option value="">::: 직급 :::</option>
							<option value="1">점주</option>
							<option value="2">매니저</option>               
						</select>
					<p>입사일 : <input type="date" name="subStaffJoin" id="subStaffJoin" /></p>
					<p>급여 : <input type="text" name="subStaffSalary" id="subStaffSalary" /></p>
				</div>
				<br/>
				<div class="clickBtn">
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