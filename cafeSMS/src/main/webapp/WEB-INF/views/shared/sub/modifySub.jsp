<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>headModifysub</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
   $(document).ready(function(){
      $('#subModifyBtn').click(function(){
         $('#modifySubForm').submit();
      });
   });
   // input 타입 숫자만 입력 가능
   $(function(){
      $(document).on("keyup", "input:text[numberOnly]",
      function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
   });
</script>
</head>
<body>
<h1> 가맹 수정 </h1>
   <form action="/headModifySub" method="POST" id="modifySubForm">
      <input type="hidden" name="subCode" value="${reSub.subCode}" />
      <table>
         <tr>
            <td>가맹코드</td>
            <td>${reSub.subCode}</td>
         </tr>
         <tr>
            <td>본사 직원 ID</td>
            <td>${headStaffLogin.headStaffId}</td>
         </tr>
         <tr>
            <td>가맹 등록 날짜</td>
            <td>${reSub.subRegitDate}</td>
         </tr>
         <tr>
            <td>가맹점 명</td>
            <td><input type="text" id="subName" name="subName" value="${reSub.subName}" /></td>
         </tr>
         <tr>
            <td>가맹 점주명</td>
            <td><input type="text" id="subKeeper" name="subKeeper" value="${reSub.subKeeper}"/></td>
         </tr>
         <tr>
            <td>연락처</td>
            <td>
               <input type="text" name="subTelephone" id="subTelephone" value="${reSub.subTelephone}" numberonly="true"/>
            </td>
         </tr>
         <tr>
            <td>주소</td>
            <td>
               <input type="text" name="subAddr" id="subAddr" value="${reSub.subAddr}"/>
            </td>
         </tr> 
      </table>
      <div>
         <input type="button" id="subModifyBtn" name="subModifyBtn" value="수정"/>
         <a href="/"><input type="button" value="취소"/></a>
      </div>
   </form>
   
</body>
</html>