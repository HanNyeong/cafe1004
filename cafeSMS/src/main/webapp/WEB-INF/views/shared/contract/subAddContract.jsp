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
	
	//가맹대표코드 중복체크
	$('#subCodeCheck').click(function(){
		$.ajax({
		      type		: "POST",
		      url		: "/subCodeCheck",
		      data		: { subCode	: $('#subCode').val() },
		      dataType	: "JSON",
		      success	: function(str) {
					console.log("성공");
					if(str.result=="true"){
						alert('사용할 수 있는 가맹대표코드입니다');
						id = "OK";
					}else{ 
						alert('이미 계약한 가맹대표코드입니다');
						id = "NO";
					}
		      }
	  });
	});
	
	
	
	//계약등록 버튼
	$("#contractAddBtn").on("click", function(){
		console.log("contractAddBtn click");
		
		if($("#contractName").val() == ""){
			$("#contractNameMsg").text("계약이름을 입력하시오.");
			
		}else if($("#contractActualDate").val() ==""){
			$("#contractNameMsg").text("");
			$("#contractActualDateMsg").text("실계약일자를 입력하시오.");
			
		}else if($("#contractExpiryDate").val() ==""){
			$("#contractNameMsg").text("");
			$("#contractActualDateMsg").text("");
			$("#contractExpiryDateMsg").text("만료일자를 입력하시오.");
			
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
			if(id == "NO"){
				$("#contractNameMsg").text("");
				$("#contractActualDateMsg").text("");
				$("#contractExpiryDateMsg").text("");
				$("#contractDepositMsg").text("");
				$("#contractProfitPercentMsg").text("");
				$("#headStaffIdMsg").text("");
				$("#subCodeMsg").text("");
				$("#subCodeMsg").text("이미존재하는 subCode입니다.");
			}else if(id =="OK"){
				$("#contractNameMsg").text("");
				$("#contractActualDateMsg").text("");
				$("#contractExpiryDateMsg").text("");
				$("#contractDepositMsg").text("");
				$("#contractProfitPercentMsg").text("");
				$("#headStaffIdMsg").text("");
				$("#subCodeMsg").text("");
				$("#contractAddForm").attr("action","/subAddContract");
				$("#contractAddForm").submit();	

					
			}else{
				$("#subCodeMsg").text("");
				$("#subCodeMsg").text("중복체크를 해주세요");
			}
				
		
		}
	
	});
	
 });

</script>

</head>
<body>
<h1>내가 등록폼일쌔!!</h1>
	<div>
		<form id="contractAddForm" method="post" enctype="multipart/form-data">
			<div>
				<label>contractName : </label>
				<input id="contractName" type="text" name="contractName"/>
				<span id="contractNameMsg"></span>
			</div>	
			<div>
				<label>contractActualDate : </label>
				<input id="contractActualDate" type="date" name="contractActualDate"/>
				<span id="contractActualDateMsg"></span>
			</div>	
			<div>
				<label>contractExpiryDate : </label>
				<input id="contractExpiryDate" type="date" name="contractExpiryDate"/>
				<span id="contractExpiryDateMsg"></span>
			</div>	
			<div>
				<label>contractDeposit : </label>
				<input id="contractDeposit" type="text" name="contractDeposit"/>
				<span id="contractDepositMsg"></span>
			</div>	
			<div>
				<label>contractProfitPercent : </label>
				<input id="contractProfitPercent" type="text" name="contractProfitPercent"/>
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
				<input id="contractN" type="text" name="contractN" value="1" readonly="readonly"/>
			</div>	
			<div>
				<label>headStaffId : </label>
				<input id="headStaffId" type="text" name="headStaffId"/>
				<span id="headStaffIdMsg"></span>
			</div>	
			<div>
				<label>subCode : </label>
				<input id="subCode" type="text" name="subCode" value="${subCode}"/>
				<input id="subCodeCheck" type="button" value="가맹대표코드중복체크"/>	
				<span id="subCodeMsg"></span>
			</div>	
			<div>
				<input id="contractAddBtn" type="button" value="계약등록"/>
			</div>
			
		
		</form>
	</div>
</body>
</html>