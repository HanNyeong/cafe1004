<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subAddRecharterContract</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
 $(document).on("ready",function(){
	console.log("ready");
	var id = null;
	
	//계약서 파일 추가
	$("#contractFileBtn").on("click",function(){
		console.log("contractFileBtn click");
		$("#contractFileAdd").append('<div><input id = "contractFile" type="file" class="btn btn-default" name="contractFile"/></div>');	
	});
	
	//폼 제출 유효성
	 var check = undefinedEvent($('#reContractAddBtn'),$('#reContractAddForm'),$('#valChekMsg'));
 });

</script>

</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
		<div class="col-sm-4">
		</div>
		<div class="col-sm-3 addForm">
		<h1>= 재계약 신청 폼 =</h1>
		<div>
			<form id="reContractAddForm" action="/subAddRecharterContract" method="post" enctype="multipart/form-data">
					<input id="contractCode" type="hidden" name="contractCode" value="${contract.contractCode}">
				
				<div>
					<label>계약자 이름  : </label>
					<input id="contractName" type="text" name="contractName" value="${contract.contractName}" valChek="이름을  입력해주세요"/>
				</div>	
				
				<div>
					<label>이전 계약 날짜 : </label>
					<input id="preContractActualDate" type="text" value="${contract.contractActualDate}" readonly="readonly"/>
				</div>	
				<div>	
					<label>계약 날짜 : </label>
					<input id="contractActualDate" type="date" name="contractActualDate" valChek="계약 날짜를  입력해주세요"/>
				</div>	
				<div>
					<label>이전 계약 만료일 : </label>
					<input id="preContractExpiryDate" type="text" value="${contract.contractExpiryDate}" readonly="readonly"/>
				</div>	
				<div>	
					<label>계약 만료일  : </label>
					<input id="contractExpiryDate" type="date" name="contractExpiryDate" valChek="계약 만료일을  입력해주세요"/>
				</div>	
				<div>
					<label>가맹 금액  : </label>
					<input id="contractDeposit" type="text" name="contractDeposit" value="${contract.contractDeposit}" valChek="가맹 금액을  입력해주세요"/>
				</div>	
				<div>
					<label>이익 배분율 : </label>
					<input id="contractProfitPercent" type="text" name="contractProfitPercent" value="${contract.contractProfitPercent}" valChek="이익배분율을  입력해주세요"/>
				</div>	
				<div>
					<label>계약 첨부파일 : </label>
					<input id="contractFileBtn" type="button" class="btn btn-default"value="파일추가"/>
					<input id="contractFile" type="file" class="btn btn-default" name="contractFile" valChek="파일을 추가해주세요"/>
					
				</div>	
				<span id="contractFileAdd"></span>
				<div>
					<label>계약 차수 : </label>
					<input id="contractN" type="text" name="contractN" value="${contract.contractN + 1}" readonly="readonly"/>
				</div>	
				<div>
					<label>본사 계약 담당 직원 : </label>
					<input id="headStaffId" type="text" name="headStaffId" value="${contract.headStaffId}" valChek="본사계약 담당직원 아이디를 입력해주세요"/>
				</div>	
				<div>
					<label>가맹 대표 코드 : </label>
					<input id="subCode" type="text" name="subCode" value="${contract.subCode}" readonly="readonly"/>
				</div>
				<br/>	
				<div class="clickBtn">
					<span id="valChekMsg"></span>
					<input id="reContractAddBtn" type="button" class="btn btn-default" value="계약등록"/>
				</div>
				<br/>
				</form>
				</div>
			</div>
		<div class="col-sm-5">
		</div>
	</div>
	
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>