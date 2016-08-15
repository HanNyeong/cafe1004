<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>customerUpdateClaimForm</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(document).on("ready",function(){
	console.log("ready");
	//폼 제출 유효성
  	 var check = undefinedEvent($('#claimBtn'),$('#claimUpdateForm'),$('#valChekMsg'));
	   });
	//파일 추가
	$("#addClaimFileBtn").on("click",function(){
		console.log("addClaimFileBtn click");
		$("#addClaimFile").append('<div><input id = "claimFile" type="file" class="btn btn-default" name="claimFile"/></div>');	
	});
	
</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-3">
	</div>
	
	<div class="col-sm-6">
	<h1>= 클래임 수정 =</h1>
		<form id="claimUpdateForm" method="post" enctype="multipart/form-data">
			<div>
				<input type="hidden" name="claimCode" value="${map.claimContent.claimCode}"/>
				<label>클래임 종류 : </label>
				<select id ="claimType" name="claimType" required="required" valChek="클래임의 종류를 선택해주세요">
					<option value="">::선택::</option>
					<option value="직원불친절" <c:if test="${map.claimContent.claimType eq '직원불친절'}">selected="selected"</c:if>>직원불친절</option>
					<option value="매장노후" <c:if test="${map.claimContent.claimType eq '매장노후'}">selected="selected"</c:if>>매장노후</option>
					<option value="위생상태" <c:if test="${map.claimContent.claimType eq '위생상태'}">selected="selected"</c:if>>위생상태</option>
					<option value="프렌차이즈문의" <c:if test="${map.claimContent.claimType eq '프렌차이즈문의'}">selected="selected"</c:if>>프렌차이즈문의</option>
					<option value="유통문의" <c:if test="${map.claimContent.claimType eq '유통문의'}">selected="selected"</c:if>>유통문의</option>
					<option value="기타" <c:if test="${map.claimContent.claimType eq '기타'}">selected="selected"</c:if>>기타</option>
				</select>
			</div>
			<div>
				<label>클래임 내용 : </label>
				<textarea id="claimContent" rows="5" cols="100" name="claimContent" valChek="클래임의 내용을 입력해주세요">${map.claimContent.claimContent}</textarea>
			</div>
			<br/>
			<div>
				<label>지점 선택 : </label>
				<select id="subCode" name="subCode" valChek="지점을 선택해주세요">
					<option value="">::선택::</option>
					<option value="본사" <c:if test="${map.claimContent.subCode eq '본사'}">selected="selected"</c:if>>본사</option>
					<option value="sub_code1" <c:if test="${map.claimContent.subCode eq 'sub_code1'}">selected="selected"</c:if>>1지점</option>
					<option value="sub_code2" <c:if test="${map.claimContent.subCode eq 'sub_code2'}">selected="selected"</c:if>>2지점</option>
					<option value="sub_code3" <c:if test="${map.claimContent.subCode eq 'sub_code3'}">selected="selected"</c:if>>3지점</option>
					<option value="sub_code4" <c:if test="${map.claimContent.subCode eq 'sub_code4'}">selected="selected"</c:if>>4지점</option>
					<option value="sub_code5" <c:if test="${map.claimContent.subCode eq 'sub_code5'}">selected="selected"</c:if>>5지점</option>
					<option value="sub_code6" <c:if test="${map.claimContent.subCode eq 'sub_code6'}">selected="selected"</c:if>>6지점</option>					
				</select>
			</div>
			<br/>
			<p>[고객이름과 전화번호는 고객님께서 사용하실 아이디와 비밀번호 역할을 할 것 입니다. 정확히 기입해주세요]</p>
			<div>
				<label>고객 이름 : </label>
				<input id="customerName" type="text" name="customerName" value="${map.claimContent.customerName}" readonly="readonly"/>
			</div>
			<div>
				<label>고객 전화 번호 : </label>
				<input id="customerPhone" type="text" name="customerPhone" value="${map.claimContent.customerPhone}" readonly="readonly"/>
			</div>
			<div>
				<input id="claimFile" type="file" class="btn btn-default" name="claimFile"/>
			</div>
			<div class="clickCenterBtn">
				<span id="valChekMsg"></span>
				<input id="addClaimFileBtn" type="button" class="btn btn-default" value="파일추가"/>
				<input id="claimBtn" type="button" class="btn btn-default" value="수정"	/>
			</div>
		
		</form>
	</div>
	<div class="col-sm-3">
	</div>
</div>	
<jsp:include page="/WEB-INF/module/footer.jsp"/>		
</body>
</html>