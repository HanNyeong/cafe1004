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
      //가맹점 명 유효성
      $('#subName').blur(function(){
         if( $('#subName').val().length ==''){
            if( $('#subNameHelper').hide() ){
               $('#subNameHelper').show();
            }            
            $('#subNameHelper').css('color','red');
            $('#subNameHelper').text('가맹점 이름을 입력해주세요.');
         }else{
            $('#subNameHelper').hide();
         }
      });
      //가맹 점주 명 유효성
      $('#subKeeper').blur(function(){
         if( $('#subKeeper').val().length ==''){
            if( $('#subKeeperHelper').hide() ){
               $('#subKeeperHelper').show();
            }            
            $('#subKeeperHelper').css('color','red');
            $('#subKeeperHelper').text('가맹 점주의 이름을 입력해주세요.');
         }else{
            $('#subKeeperHelper').hide();
         }
      });
      //연락처 유효성
      $('#subTelephone').blur(function(){
         if( $('#subTelephone').val().length ==''){
            if( $('#subTelephoneHelper').hide() ){
               $('#subTelephoneHelper').show();
            }            
            $('#subTelephoneHelper').css('color','red');
            $('#subTelephoneHelper').text('연락처를 입력해주세요.');
         }else{
            $('#subTelephoneHelper').hide();
         }
      });
      //주소 유효성
      $('#subAddr').blur(function(){
         if( $('#subAddr').val().length ==''){
            if( $('#subAddrHelper').hide() ){
               $('#subAddrHelper').show();
            }            
            $('#subAddrHelper').css('color','red');
            $('#subAddrHelper').text('가맹 주소를 입력해주세요.');
         }else{
            $('#subAddrHelper').hide();
         }
      });
  
   // 폼 제출
   $('#headAddBtn').click(function(){     
      if ($('#subName').val() == ""){
         }else if ($('#subKeeper').val() == ""){
         }else if ($('#subTelephone').val() == ""){
         }else if ($('#subAddr').val() == ""){
         }else {
        	 
               $('#addSubForm').submit();
               
        }
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
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-4">
	</div>
		<div class="col-sm-3 addForm">
			<h1> 가맹 추가 </h1>
				<form action="/headAddSub" method="POST" id="addSubForm">
					<div>본사직원ID : <input type="text" id="headStaffId" name="headStaffId" readonly="readonly" class="inputNoLine" value="head"/></div>
					<div>가맹점 명 :<input type="text" id="subName" name="subName" /><span id="subNameHelper"></span></div>
					<div>가맹 점주명 :<input type="text" id="subKeeper" name="subKeeper" /><span id="subKeeperHelper"></span></div>
					<div>비밀번호 :<input type="password" id="subPassword" name="subPassword" /></div>
					<div>비밀번호확인 :<input type="password" id="subPasswordCheck" name="subPasswordCheck" /></div>
					<div>연락처 :<input type="text" name="subTelephone" id="subTelephone" size=11 maxlength=11 numberonly="true"/><span id="subTelephoneHelper"></span></div>
					<div>주소 :<input type="text" name="subAddr" id="subAddr" /><span id="subAddrHelper"></span></div>
					<br/>
					<div class="clickBtn">
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