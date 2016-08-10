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
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-3">
	</div>
	
	<div class="col-sm-6">
	<h1>= 고객클래임접수등록 =</h1>
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
				<label class="topLabel">클래임 내용 : </label>
				<textarea class="textereaContent" rows="5" cols="100" name="claimContent"></textarea>
				<span id="claimContentMsg"></span>
			</div>
			<br/>
			<div>
				<label> 지점 선택 : </label>
				<select id="subCode" name="subCode">
					<option value="">::선택::</option>
					<option value="본사">본사</option>
					<option value="sub_code1">1지점</option>
					<option value="sub_code2">2지점</option>
					<option value="sub_code3">3지점</option>
					<option value="sub_code4">4지점</option>			
				</select>
				<span id="subCodeMsg"></span>
			</div>
			<br/>
			<p>[고객이름과 전화번호는 고객님께서 사용하실 아이디와 비밀번호 역할을 할 것 입니다. 정확히 기입해주세요]</p>
			<div>
				<label> 고객 이름 : </label>
				<input id="customerName" type="text" name="customerName"/>
				<span id="customerNameMsg"></span>
			</div>
			<div>
				<label> 고객 전화 번호 : </label>
				<input id="customerPhone" type="text" name="customerPhone"/>
				<span id="customerPhoneMsg"></span>
			</div>
			<div>
				<input id="claimFile" type="file" class="btn btn-default" name="claimFile"/>
				<span id="addClaimFile"></span>
			</div>
			<div class="clickCenterBtn">
				<input id="addClaimFileBtn" type="button" class="btn btn-default" value="파일추가"/>
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