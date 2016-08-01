<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(document).on("ready",function(){
	console.log("ready");
	
	//파일 추가
	$("#addClaimFileBtn").on("click",function(){
		console.log("addClaimFileBtn click");
		$("#addClaimFile").append('<div><label>첨부파일 : </label><input id = "claimFile" type="file" name="claimFile"/></div>');	
	});
	
	$("#claimBtn").on("click", function(){
		console.log("claimBtn click");
		
		if($("#claimType").val()==""){
			$("#claimTypeMsg").text("클래임종류를 선택해주세요");
		}else if($("#claimContent").val()==""){
			$("#claimTypeMsg").text("");
			$("#claimContentMsg").text("클래임 내용을 작성하세요");
		}else if($("#subCode").val()==""){
			$("#claimTypeMsg").text("");
			$("#claimContentMsg").text("");
			$("#subCodeMsg").text("해당지점을 선택해주세요");
		}else if($("#customerName").val()==""){
			$("#claimTypeMsg").text("");
			$("#claimContentMsg").text("");
			$("#subCodeMsg").text("");
			$("#customerNameMsg").text("고객님의 성함을 작성해주세요");
		}else if($("#customerPhone").val()==""|| isNaN($("#customerPhone").val())){
			$("#claimTypeMsg").text("");
			$("#claimContentMsg").text("");
			$("#subCodeMsg").text("");
			$("#customerNameMsg").text("");
			$("#customerPhoneMsg").text("전화번호를 입력하세요(-제외하고 숫자만 기입하세요)");
		}else{
			$("#claimForm").attr("action","/customerAddClaim");
			$("#claimForm").submit();
		}
		
	});
	
});

</script>
</head>
<body>
	<h1>고객클래임접수등록</h1>
	<form id="claimForm" method="post" enctype="multipart/form-data">
		<div>
			<label>클래임 종류 : </label>
			<select id ="claimType" name="claimType">
				<option value="">::선택::</option>
				<option value="직원불친절">직원불친절</option>
				<option value="매장노후">매장노후</option>
				<option value="위생상태">위생상태</option>
				<option value="프렌차이즈문의">프렌차이즈문의</option>
				<option value="유통문의">유통문의</option>
				<option value="기타">기타</option>
			</select>
			<span id="claimTypeMsg"></span>
		</div>
		<div>
			<label>클래임 내용 : </label>
			<textarea id="claimContent" rows="5" cols="50" name="claimContent"></textarea>
			<span id="claimContentMsg"></span>
		</div>
		<div>
			<label>지점 선택 : </label>
			<select id="subCode" name="subCode">
				<option value="">::선택::</option>
				<option value="본사">본사</option>
				<option value="sub_code1">1지점</option>
				<option value="sub_code2">2지점</option>
				<option value="sub_code3">3지점</option>
				<option value="sub_code4">4지점</option>
				<option value="sub_code5">5지점</option>
				<option value="sub_code6">6지점</option>
				<option value="sub_code7">7지점</option>
				<option value="sub_code8">8지점</option>
				<option value="sub_code9">9지점</option>
				<option value="sub_code10">10지점</option>
				<option value="sub_code11">11지점</option>
				<option value="sub_code12">12지점</option>
				<option value="sub_code13">13지점</option>
				<option value="sub_code14">14지점</option>
				<option value="sub_code15">15지점</option>
				<option value="sub_code16">16지점</option>
				<option value="sub_code17">17지점</option>
				<option value="sub_code18">18지점</option>
				<option value="sub_code19">19지점</option>
				<option value="sub_code20">20지점</option>
				
			</select>
			<span id="subCodeMsg"></span>
		</div>
		<p>[고객이름과 전화번호는 고객님께서 사용하실 아이디와 비밀번호 역할을 할 것 입니다. 정확히 기입해주세요]</p>
		<div>
			<label>고객 이름 : </label>
			<input id="customerName" type="text" name="customerName"/>
			<span id="customerNameMsg"></span>
		</div>
		<div>
			<label>고객 전화 번호 : </label>
			<input id="customerPhone" type="text" name="customerPhone"/>
			<span id="customerPhoneMsg"></span>
		</div>
		<div>
			<label>첨부파일 : </label>
			<input id="claimFile" type="file" name="claimFile"/>
			<input id="addClaimFileBtn" type="button" value="addClaimFileBtn"/>
			<span id="addClaimFile"></span>
		</div>
		<div>
			<input id="claimBtn" type="button" value="claimBtn"	/>
		</div>
	
	</form>
	
	
</body>
</html>