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
			$("#contractExpireFileAdd").append('<div><input id = "contractExpireFile"  class="btn btn-default" type="file" name="contractExpireFile"/></div>');	
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
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
		<div class="col-sm-4">
		</div>
		<div class="col-sm-3 addForm">
			<h1>계약파기</h1>
			 <p>파기서유서를 첨부하세요. </p>
			 <p>※파기시 되돌릴 수 없으니 다시 한번 더 검토해주세요※</p>
			 	<form  id="contractExpireForm"  method="post" enctype="multipart/form-data">
		 			<div>
						<label>계약 코드 : </label> 			
		 				<input type="text" name="contractCode" value="${contractCode}" readonly="readonly"/>
		 			</div>
		 			<input type="hidden" name="subCode" value="${subCode}"/>
		 			
		 			<div>
		 				<label>계약파기 파일 : </label>
		 				<input id="contractExpireFileBtn" type="button"  class="btn btn-default" value="파일추가"/>
		 				<input id = "contractExpireFile"  class="btn btn-default" type="file" name="contractExpireFile"/>
		 				<span id="contractExpireFileMsg"></span>
		 			</div>
		 			<span id="contractExpireFileAdd"></span>
		 			<br/>
					<div class="clickBtn">	
		 				<input id="addExpireFile" type="button"  class="btn btn-default" value="파기"/>
		 			</div>				
					<br/>
			 	</form>
			</div>
			<div class="col-sm-5">
		</div>
	</div>	
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</body>
</html>