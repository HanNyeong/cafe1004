<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>headAnswerClaimForm</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(document).on("ready",function(){
	console.log("ready");
	
	$("#answerBtn").on("click", function(){
		console.log("answerBtn click");
		
		if($("#claimAnswerContent").val() == ""){
			$("#claimAnswerContentMsg").text("답변을 작성해주세요")
		}else{
			$("#answerForm").attr("action", "/headAnswerClaim");
			$("#answerForm").submit();
		}
	});
})
</script>

</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-3">
	</div>
	
	<div class="col-sm-6">
	<h1>= 클래임 답변하기 =</h1>
	<form id="answerForm" method="post" enctype="multipart/form-data">
		<div>
			<label>클래임 코드 : </label>
			<input type="text" name="claimCode" class="ffffNoLine" value="${claim.claimCode}" readonly="readonly"/>
		</div>
		<div>
			<label class="topLabel">클래임 내용 : </label>
			<textarea rows="5" cols="100" class="textereaContent"  readonly="readonly">${claim.claimContent}</textarea>
		</div>
		<div>
			<label>가맹 코드 : </label>
			<input type="text" value="${claim.claimCode}" class="ffffNoLine" readonly="readonly"/>
		</div>
		<div>
			<label>고객 이름 : </label>
			<input type="text" value="${claim.customerName}" class="ffffNoLine" readonly="readonly"/>
		</div>
		<div>
			<label>고객 번호  : </label>
			<input type="text" value="${claim.customerPhone}" class="ffffNoLine" readonly="readonly"/>
		</div>
		<hr/>
		
		<div>
			<label class="topLabel">본사 측 답변 : </label>
			<textarea id="claimAnswerContent" name="claimAnswerContent" class="textereaContent" rows="5" cols="100">${claim.claimAnswerContent}</textarea>
			<span id="claimAnswerContentMsg"></span>
		</div>
		<div class="clickBtn">
			<input id="answerBtn" class="btn btn-default" type="button" value="등록"	/>
		</div>		
	</form>
	</div>
	<div class="col-sm-3">
	</div>
</div>	
<jsp:include page="/WEB-INF/module/footer.jsp"/>	
</body>
</html>