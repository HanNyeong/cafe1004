<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$(document).on("ready", function(){
		console.log("ready");
		$("#claimListBtn").on("click", function(){
			console.log("claimListBtn click");
			if($("#customerName").val() == ""){
				$("#customerNameMsg").text("이름을 입력하세요");
			}else if($("#customerPhone").val() == "" || isNaN($("#customerPhone").val())){
				$("#customerNameMsg").text("");
				$("#customerPhoneMsg").text("전화번호를 입력하세요(-제외하고 숫자만 기입하세요)");
			}else{
				$("#customerNameMsg").text("");
				$("#customerPhoneMsg").text("");
				$("#customerLogin").attr("action", "/customerViewClaimList");
				$("#customerLogin").submit();
			}
			
			
		});
	});
</script>
</head>
<body>
	<h1>호갱님, 클래임 리스트를 확인하시려면 이름과 전화번호를 기입하세요</h1>
	<form id="customerLogin" method="post">
		<div>
			<label>성명 : </label>
			<input id="customerName" type="text" name="customerName"/>
			<span id="customerNameMsg"></span>
		</div>
		<div>
			<label>전화번호 : </label>
			<input id="customerPhone" type="text" name="customerPhone"/>
			<span id="customerPhoneMsg"></span>
		</div>
		<div>
			<input id="claimListBtn" type="button" value="확인"/>
		</div>
	
	</form>
	
	<hr/>
	<h1> 클래임 등록하기 </h1>
	<a href="/customerAddClaim">[클래임 등록하기]</a>
	
	
</body>
</html>