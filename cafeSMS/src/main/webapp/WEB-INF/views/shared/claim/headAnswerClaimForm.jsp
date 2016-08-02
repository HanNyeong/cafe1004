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
	<h1>본사가 해당클래임에 답변하기</h1>
	<form id="answerForm" method="post">
		<div>
			<label>claimCode : </label>
			<input type="text" name="claimCode" value="${claim.claimCode}" readonly="readonly"/>
		</div>
		<div>
			<label>claimContent : </label>
			<textarea rows="5" cols="50" readonly="readonly">${claim.claimContent}</textarea>
		</div>
		<div>
			<label>subCode : </label>
			<input type="text" value="${claim.claimCode}" readonly="readonly"/>
		</div>
		<div>
			<label>customerName : </label>
			<input type="text" value="${claim.customerName}" readonly="readonly"/>
		</div>
		<div>
			<label>customerPhone : </label>
			<input type="text" value="${claim.customerPhone}" readonly="readonly"/>
		</div>
		<div>
			<label>claimAnswerContent</label>
			<textarea id="claimAnswerContent" name="claimAnswerContent" rows="5" cols="50">${claim.claimAnswerContent}</textarea>
			<span id="claimAnswerContentMsg"></span>
		</div>
		<div>
			<input id="answerBtn" type="button" value="등록"	/>
		</div>
		
		
	</form>
</body>
</html>