<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>customerAddClaim</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(document).on("ready",function(){
	console.log("ready");
	//파일 추가
	$("#addClaimFileBtn").on("click",function(){
		console.log("addClaimFileBtn click");
		$("#addClaimFile").append('<div><input id = "claimFile" type="file" class="btn btn-default" name="claimFile"/></div>');	
	});

//폼 제출 유효성
  	 var check = undefinedEvent($('#claimBtn'),$('#claimForm'),$('#valChekMsg'));
   });

</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-3">
	</div>
	
	<div class="col-sm-6">
	<h1>= 고객클래임접수등록 =</h1>
		<form id="claimForm" method="post" enctype="multipart/form-data">
			<div>
				<label>클래임 종류 : </label>
				<select id ="claimType" name="claimType" valChek="클래임 종류를 선택해주세요">
					<option value="">::선택::</option>
					<option value="직원불친절">직원불친절</option>
					<option value="매장노후">매장노후</option>
					<option value="위생상태">위생상태</option>
					<option value="프렌차이즈문의">프렌차이즈문의</option>
					<option value="유통문의">유통문의</option>
					<option value="기타">기타</option>
				</select>
			</div>
			<div>
				<label class="topLabel">클래임 내용 : </label>
				<textarea class="textereaContent" rows="5" cols="100" name="claimContent" value="" valChek="내용을 입력해주세요"></textarea>
			</div>
			<br/>
			<div>
				<label> 지점 선택 : </label>
				<select id="subCode" name="subCode" valChek="지점을 선택해주세요">
					<option value="">::선택::</option>
					<option value="본사">본사</option>
					<option value="sub_code1">1지점</option>
					<option value="sub_code2">2지점</option>
					<option value="sub_code3">3지점</option>
					<option value="sub_code4">4지점</option>			
				</select>
			</div>
			<br/>
			<p>[고객이름과 전화번호는 고객님께서 사용하실 아이디와 비밀번호 역할을 할 것 입니다. 정확히 기입해주세요]</p>
			<div>
				<label> 고객 이름 : </label>
				<input id="customerName" type="text" name="customerName" value="" valChek="이름을 입력해주세요"/>
			</div>
			<div>
				<label> 고객 전화 번호 : </label>
				<input id="customerPhone" type="text" name="customerPhone" value="" valChek="번호를 입력해주세요"/>
			</div>
			<div>
				<label> 첨부파일 : </label>
				<input id="addClaimFileBtn" type="button" class="btn btn-default" value="파일추가"/>
				<span id="addClaimFile"></span>
				<input id="claimFile" type="file" class="btn btn-default" name="claimFile" value="" valChek="파일을 선택해주세요"/>
			</div>
			<div class="clickCenterBtn">
				<span id="valChekMsg"></span>
				<input id="claimBtn" type="button" class="btn btn-default" value="불만접수"/>
			</div>
		</form>
	</div>
	<div class="col-sm-3">
	</div>
</div>	
<jsp:include page="/WEB-INF/module/footer.jsp"/>	
</body>
</html>