<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			$("#claimUpdateForm").attr("action","/customerUpdateClaim");
			$("#claimUpdateForm").submit();
		}
		
	});
	
});

</script>
</head>
<body>
	<h1>고객이 클래임 수정</h1>
	<form id="claimUpdateForm" method="post" enctype="multipart/form-data">
		<div>
			<input type="hidden" name="claimCode" value="${map.claimContent.claimCode}"/>
			<label>클래임 종류 : </label>
			<select id ="claimType" name="claimType" required="required">
				<option value="">::선택::</option>
				<option value="직원불친절" <c:if test="${map.claimContent.claimType eq '직원불친절'}">selected="selected"</c:if>>직원불친절</option>
				<option value="매장노후" <c:if test="${map.claimContent.claimType eq '매장노후'}">selected="selected"</c:if>>매장노후</option>
				<option value="위생상태" <c:if test="${map.claimContent.claimType eq '위생상태'}">selected="selected"</c:if>>위생상태</option>
				<option value="프렌차이즈문의" <c:if test="${map.claimContent.claimType eq '프렌차이즈문의'}">selected="selected"</c:if>>프렌차이즈문의</option>
				<option value="유통문의" <c:if test="${map.claimContent.claimType eq '유통문의'}">selected="selected"</c:if>>유통문의</option>
				<option value="기타" <c:if test="${map.claimContent.claimType eq '기타'}">selected="selected"</c:if>>기타</option>
			</select>
			<span id="claimTypeMsg"></span>
		</div>
		<div>
			<label>클래임 내용 : </label>
			<textarea id="claimContent" rows="5" cols="50" name="claimContent">${map.claimContent.claimContent}</textarea>
			<span id="claimContentMsg"></span>
		</div>
		<div>
			<label>지점 선택 : </label>
			<select id="subCode" name="subCode">
				<option value="">::선택::</option>
				<option value="본사" <c:if test="${map.claimContent.subCode eq '본사'}">selected="selected"</c:if>>본사</option>
				<option value="sub_code1" <c:if test="${map.claimContent.subCode eq 'sub_code1'}">selected="selected"</c:if>>1지점</option>
				<option value="sub_code2" <c:if test="${map.claimContent.subCode eq 'sub_code2'}">selected="selected"</c:if>>2지점</option>
				<option value="sub_code3" <c:if test="${map.claimContent.subCode eq 'sub_code3'}">selected="selected"</c:if>>3지점</option>
				<option value="sub_code4" <c:if test="${map.claimContent.subCode eq 'sub_code4'}">selected="selected"</c:if>>4지점</option>
				<option value="sub_code5" <c:if test="${map.claimContent.subCode eq 'sub_code5'}">selected="selected"</c:if>>5지점</option>
				<option value="sub_code6" <c:if test="${map.claimContent.subCode eq 'sub_code6'}">selected="selected"</c:if>>6지점</option>
				<option value="sub_code7" <c:if test="${map.claimContent.subCode eq 'sub_code7'}">selected="selected"</c:if>>7지점</option>
				<option value="sub_code8" <c:if test="${map.claimContent.subCode eq 'sub_code8'}">selected="selected"</c:if>>8지점</option>
				<option value="sub_code9" <c:if test="${map.claimContent.subCode eq 'sub_code9'}">selected="selected"</c:if>>9지점</option>
				<option value="sub_code10" <c:if test="${map.claimContent.subCode eq 'sub_code10'}">selected="selected"</c:if>>10지점</option>
				<option value="sub_code11" <c:if test="${map.claimContent.subCode eq 'sub_code11'}">selected="selected"</c:if>>11지점</option>
				<option value="sub_code12" <c:if test="${map.claimContent.subCode eq 'sub_code12'}">selected="selected"</c:if>>12지점</option>
				<option value="sub_code13" <c:if test="${map.claimContent.subCode eq 'sub_code13'}">selected="selected"</c:if>>13지점</option>
				<option value="sub_code14" <c:if test="${map.claimContent.subCode eq 'sub_code14'}">selected="selected"</c:if>>14지점</option>
				<option value="sub_code15" <c:if test="${map.claimContent.subCode eq 'sub_code15'}">selected="selected"</c:if>>15지점</option>
				<option value="sub_code16" <c:if test="${map.claimContent.subCode eq 'sub_code16'}">selected="selected"</c:if>>16지점</option>
				<option value="sub_code17" <c:if test="${map.claimContent.subCode eq 'sub_code17'}">selected="selected"</c:if>>17지점</option>
				<option value="sub_code18" <c:if test="${map.claimContent.subCode eq 'sub_code18'}">selected="selected"</c:if>>18지점</option>
				<option value="sub_code19" <c:if test="${map.claimContent.subCode eq 'sub_code19'}">selected="selected"</c:if>>19지점</option>
				<option value="sub_code20" <c:if test="${map.claimContent.subCode eq 'sub_code20'}">selected="selected"</c:if>>20지점</option>
				
			</select>
			<span id="subCodeMsg"></span>
		</div>
		<p>[고객이름과 전화번호는 고객님께서 사용하실 아이디와 비밀번호 역할을 할 것 입니다. 정확히 기입해주세요]</p>
		<div>
			<label>고객 이름 : </label>
			<input id="customerName" type="text" name="customerName" value="${map.claimContent.customerName}" readonly="readonly"/>
			<span id="customerNameMsg"></span>
		</div>
		<div>
			<label>고객 전화 번호 : </label>
			<input id="customerPhone" type="text" name="customerPhone" value="${map.claimContent.customerPhone}" readonly="readonly"/>
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