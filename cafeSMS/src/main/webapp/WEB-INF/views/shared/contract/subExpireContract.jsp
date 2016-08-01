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
		//계약파기사유서  파일 추가
		$("#contractExpireFileBtn").on("click",function(){
			console.log("contractExpireFileBtn");
			$("#contractExpireFileAdd").append('<div><label>contractExpireFile : </label><input id = "contractExpireFile" type="file" name="contractExpireFile"/></div>');	
		});
		
		$("#addExpireFile").on("click", function(){
			if($("#contractExpireFile").val() == ""){
				$("#contractExpireFileMsg").text("파기사유서를 첨부하세요");
			}else{
				$("#contractExpireFileMsg").text("");
				$("#contractExpireForm").attr("action","/subExpireContract");
				$("#contractExpireForm").submit();	
			}	
		});
		
		
			
	});

</script>

</head>
<body>
<h1>계약파기</h1>
 <p>headExpireContract form입니다.</p> 
 <p>파기서유서를 첨부하세요, 파기시 되돌릴 수 없으니 다시 한번 더 검토해주세요</p>
 	<form  id="contractExpireForm"  method="post" enctype="multipart/form-data">
 			<div>
				<label>contractCode : </label> 			
 				<input type="text" name="contractCode" value="${contractCode}" readonly="readonly"/>
 			</div>
 			<input type="hidden" name="subCode" value="${subCode}"/>
 			
 			<div>
 				<label>contractExpireFile : </label>
 				<input id = "contractExpireFile" type="file" name="contractExpireFile"/>
 				<input id="contractExpireFileBtn" type="button" value="AddBtn"/>
 				<span id="contractExpireFileMsg"></span>
 			</div>
 			<span id="contractExpireFileAdd"></span>	
 			<input id="addExpireFile" type="button" value="파기"/>
 			
 	</form>
</body>
</body>
</html>