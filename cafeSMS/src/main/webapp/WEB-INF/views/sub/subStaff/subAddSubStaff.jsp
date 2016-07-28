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
<c:choose>
	<c:when test="${subStaff == null }">
	<h1> 가맹 직원 등록 </h1>
	<form action="/subAddSubStaff" method="POST" id="addSubStaffForm">
	   <table>
	      <tr>
	         <td>이름 :</td>
	         <td><input type="text" id="subStaffName" name="subStaffName" /></td>
	      </tr>  
	      <tr>
	         <td>비밀번호 :</td>
	         <td><input type="password" id="subStaffPw" name="subStaffPw"/></td>
	      </tr>
	       <tr>
	         <td>비밀번호 확인:</td>
	         <td><input type="password" id="subStaffPw2" name="subStaffPw2"/></td>
	      </tr>
	      <tr>
	         <td>직급 :</td>
	         <td>
	            <select id="subStaffLevel" name="subStaffLevel">
	               <option value="">::: 직급 :::</option>
	               <option value="1">점주</option>
	               <option value="2">매니저</option>               
	            </select>
	         </td>
	      </tr>
	      <tr>
	         <td>입사일 :</td>
	         <td>
	            <input type="date" name="subStaffJoin" id="subStaffJoin" />
	         </td>
	      </tr>
	      <tr>
	         <td>급여 :</td>
	         <td>
	            <input type="text" name="subStaffSalary" id="subStaffSalary" />
	         </td>
	      </tr> 
	   </table>
	   <div>
	      <input type="button" id="subStaffAddBtn" name="subStaffAddBtn" value="등록"/>
	      <a href="/"><input type="button" value="취소"/></a>
	   </div>
	</form>
	</c:when>
	<c:otherwise>
		아이디는 ${subStaff.subStaffId} 입니다.
		<a href="/">Home</a>
	</c:otherwise>
</c:choose>
   
</body>