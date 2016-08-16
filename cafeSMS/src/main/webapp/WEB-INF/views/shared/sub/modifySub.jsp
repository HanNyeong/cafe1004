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
		//폼 제출 유효성
		 var check = undefinedEvent($('#subModifyBtn'),$('#modifySubForm'),$('#valChekMsg'));
	});

   // input 타입 숫자만 입력 가능
   $(function(){
      $(document).on("keyup", "input:text[numberOnly]",
      function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
   });
</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
		<div class="col-sm-4">
		</div>
		<div class="col-sm-3 addForm">
			<h1> 가맹 수정 </h1>
				<form action="/modifySub" method="POST" id="modifySubForm">
					<input type="hidden" name="subCode" value="${reSub.subCode}" />
					<div>
						<p>가맹코드 : ${reSub.subCode}</p>
						<p>가맹등록날짜 : ${reSub.subRegitDate}</p>
						<p>가맹점 명 : <input type="text" id="subName" name="subName" value="${reSub.subName}" valChek="가맹점 이름을  입력해주세요"/></p>
						<p>가맹 점주명 : <input type="text" id="subKeeper" name="subKeeper" value="${reSub.subKeeper}" valChek="가맹점주 명을  입력해주세요"/></p>
						<p>연락처 : <input type="text" id="subTelephone" name="subTelephone" value="${reSub.subTelephone}" numberonly="true" valChek="연락처를  입력해주세요"/></p>
						<p>주소 : <input type="text" id="subAddr" name="subAddr" value="${reSub.subAddr}" valChek="주소를 입력해주세요"/></p>
					</div>	
					<br/>
					<div class="clickBtn">
						<span id="valChekMsg"></span>
				         <input type="button" id="subModifyBtn" class="btn btn-default" name="subModifyBtn" value="수정"/>
				         <a href="/"><input type="button" class="btn btn-default" value="취소"/></a>
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