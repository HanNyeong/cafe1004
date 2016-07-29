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
	var id = null;
	
	//계약서 파일 추가
	$("#contractFileBtn").on("click",function(){
		console.log("contractFileBtn click");
		$("#contractFileAdd").append('<div><label>contractFile : </label><input id = "contractFile" type="file" name="contractFile"/></div>');	
	});
	
	//계약등록 버튼
	$("#reContractAddBtn").on("click", function(){
		console.log("reContractAddBtn click");
		
		if($("#contractName").val() == ""){
			$("#contractNameMsg").text("계약이름을 입력하시오.");
			
		}else if($("#contractActualDate").val() ==""){
			$("#contractNameMsg").text("");
			$("#contractActualDateMsg").text("실계약일자를 입력하시오.");
		
		}else if($("#contractActualDate").val() <= $("#preContractExpiryDate").val() ){
			$("#contractNameMsg").text("");
			$("#contractActualDateMsg").text("");
			$("#contractActualDateMsg").text("계약이전 만료일 보다 이후이어야합니다.");
			
		}else if($("#contractExpiryDate").val() ==""){
			$("#contractNameMsg").text("");
			$("#contractActualDateMsg").text("");
			$("#contractExpiryDateMsg").text("만료일자를 입력하시오.");
		
		}else if($("#contractExpiryDate").val() <= $("#preContractExpiryDate").val() ){
			$("#contractNameMsg").text("");
			$("#contractActualDateMsg").text("");
			$("#contractExpiryDateMsg").text("계약이전 만료일 보다 이후이어야합니다.");	
			
		}else if($("#contractExpiryDate").val() <= $("#contractActualDate").val()){
			$("#contractNameMsg").text("");
			$("#contractActualDateMsg").text("");
			$("#contractExpiryDateMsg").text("만료일자는 실계약보다 더 커야합니다.");
			
		}else if($("#contractDeposit").val() == "" || isNaN($("#contractDeposit").val())){
			$("#contractNameMsg").text("");
			$("#contractActualDateMsg").text("");
			$("#contractExpiryDateMsg").text("");
			$("#contractDepositMsg").text("가맹금액을 입력하시오. 숫자를 입력하시오");
			
		}else if($("#contractProfitPercent").val() == "" || isNaN($("#contractProfitPercent").val())){
			$("#contractNameMsg").text("");
			$("#contractActualDateMsg").text("");
			$("#contractExpiryDateMsg").text("");
			$("#contractDepositMsg").text("");
			$("#contractProfitPercentMsg").text("이익배분율을 입력하시오. 숫자를 입력하시오");
		
		}else if($("#contractFile").val()==""){
			
			$("#contractNameMsg").text("");
			$("#contractActualDateMsg").text("");
			$("#contractExpiryDateMsg").text("");
			$("#contractDepositMsg").text("");
			$("#contractFileMsg").text("파일을 하나이상 등록해주세요");	
			
		}else if($("#headStaffId").val() == ""){
			$("#contractNameMsg").text("");
			$("#contractActualDateMsg").text("");
			$("#contractExpiryDateMsg").text("");
			$("#contractDepositMsg").text("");
			$("#contractProfitPercentMsg").text("");
			$("#headStaffIdMsg").text("본사계약담당직원 아이디를 입력하시오.");
			
		}else if($("#subCode").val() == ""){
			$("#contractNameMsg").text("");
			$("#contractActualDateMsg").text("");
			$("#contractExpiryDateMsg").text("");
			$("#contractDepositMsg").text("");
			$("#contractProfitPercentMsg").text("");
			$("#headStaffIdMsg").text("");
			$("#subCodeMsg").text("가맹대표코드를 입력하시오.");
			
		}else{
			$("#reContractAddForm").attr("action","/subAddRecharterContract");
			$("#reContractAddForm").submit();	
		
		}
	
	});
	
	
 });

</script>

</head>
<body>
	<h1>재계약 신청 폼</h1>
	<div>
		<form id="reContractAddForm" method="post" enctype="multipart/form-data">
				<input id="contractCode" type="hidden" name="contractCode" value="${contract.contractCode}">
			
			<div>
				<label>contractName : </label>
				<input id="contractName" type="text" name="contractName" value="${contract.contractName}"/>
				<span id="contractNameMsg"></span>
			</div>	
			
			<div>
				<label>이전 contractActualDate : </label>
				<input id="preContractActualDate" type="text" value="${contract.contractActualDate}" readonly="readonly"/>
				<label>contractActualDate : </label>
				<input id="contractActualDate" type="date" name="contractActualDate"/>
				<span id="contractActualDateMsg"></span>
			</div>	
			<div>
				<label>이전 contractExpiryDate : </label>
				<input id="preContractExpiryDate" type="text" value="${contract.contractExpiryDate}" readonly="readonly"/>
				<label>contractExpiryDate : </label>
				<input id="contractExpiryDate" type="date" name="contractExpiryDate"/>
				<span id="contractExpiryDateMsg"></span>
			</div>	
			<div>
				<label>contractDeposit : </label>
				<input id="contractDeposit" type="text" name="contractDeposit" value="${contract.contractDeposit}"/>
				<span id="contractDepositMsg"></span>
			</div>	
			<div>
				<label>contractProfitPercent : </label>
				<input id="contractProfitPercent" type="text" name="contractProfitPercent" value="${contract.contractProfitPercent}"/>
				<span id="contractProfitPercentMsg"></span>
			</div>	
			<div>
				<label>contractFile : </label>
				<input id="contractFile" type="file" name="contractFile"/>
				<input id="contractFileBtn" type="button" value="AddBtn"/>
				<span id="contractFileMsg"></span>
				
			</div>	
			<span id="contractFileAdd"></span>
			<div>
				<label>contractN : </label>
				<input id="contractN" type="text" name="contractN" value="${contract.contractN + 1}" readonly="readonly"/>
			</div>	
			<div>
				<label>headStaffId : </label>
				<input id="headStaffId" type="text" name="headStaffId" value="${contract.headStaffId}"/>
				<span id="headStaffIdMsg"></span>
			</div>	
			<div>
				<label>subCode : </label>
				<input id="subCode" type="text" name="subCode" value="${contract.subCode}" readonly="readonly"/>
				<span id="subCodeMsg"></span>
			</div>	
			<div>
				<input id="reContractAddBtn" type="button" value="계약등록"/>
			</div>
			
		
		</form>
	</div>
</body>
</html>