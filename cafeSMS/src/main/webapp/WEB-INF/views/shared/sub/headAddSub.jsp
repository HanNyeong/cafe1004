<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>headAddsub</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>

//유효성 검사
  $(document).ready(function(){   
	//폼 제출 유효성
	 var check = undefinedEvent($('#headAddBtn'),$('#addSubForm'),$('#valChekMsg'));
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
			<h1> 가맹 추가 </h1>
				<form action="/headAddSub" method="POST" id="addSubForm">
					<div>본사직원ID : <input type="text" id="headStaffId" name="headStaffId" readonly="readonly" class="inputNoLine" value="head"/></div>
					<div>가맹점 명 :<input type="text" id="subName" name="subName" value="" valChek="가맹점 이름을  입력해주세요"/></div>
					<div>가맹 점주명 :<input type="text" id="subKeeper" name="subKeeper" value="" valChek="점주명을 입력해주세요"/></div>
					<div>비밀번호 :<input type="password" id="Pw" name="subPassword" value="" valChek="비밀번호를  입력해주세요" /></div>
					<div>비밀번호확인 :<input type="password" id="Pw2" name="subPasswordCheck" value="" valChek="비밀번호를 확인 해주세요"/></div>
					<div>연락처 :<input type="text" name="subTelephone" id="subTelephone" size=11 maxlength=11 numberonly="true" value="" valChek="전화번호를  입력해주세요"/></div>
					<div>주소 :<input type="text" name="subAddr" id="subAddr" value="" valChek="주소를  입력해주세요"/></div>
					<br/>
					<div class="clickBtn">
						<span id="valChekMsg"></span>
						<input type="button" id="headAddBtn" name="headAddBtn" class="btn btn-default" value="등록"/>
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