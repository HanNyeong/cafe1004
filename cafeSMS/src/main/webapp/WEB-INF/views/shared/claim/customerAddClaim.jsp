<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		$("#claimForm").attr("action","/customerViewClaimList");
		$("#claimForm").submit();
		
		
	});
	
});

</script>
</head>
<body>
	<h1>고객클래임접수등록</h1>
	<form id="claimForm" method="post" enctype="multipart/form-data">
		<div>
			<label>클래임 종류 : </label>
			<select name="claimType">
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
			<label>클래임 내용 : </label>
			<textarea  rows="5" cols="50" name="claimContent"></textarea>
		</div>
		<div>
			<label>지점 선택 : </label>
			<select name="subCode">
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
		</div>
		<div>
			<label>고객 이름 : </label>
			<input type="text" name="customerName"/>
		</div>
		<div>
			<label>고객 전화 번호 : </label>
			<input type="text" name="customerName"/>
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