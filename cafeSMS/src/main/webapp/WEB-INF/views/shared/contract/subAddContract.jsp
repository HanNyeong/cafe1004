<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subAddContract</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
 $(document).on("ready",function(){
	console.log("ready");

	//계약서 파일 추가
	$("#contractFileBtn").on("click",function(){
		console.log("contractFileBtn click");
		$("#contractFileAdd").append('<div><input id = "contractFile" class="btn btn-default" type="file" name="contractFile"/></div>');	
	});

	//폼 제출 유효성
	undefinedEvent($('#contractAddBtn'),$('#contractAddForm'),$('#valChekMsg'));
   });

</script>

</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
		<div class="col-sm-4">
		</div>
		<div class="col-sm-4 addForm">
		<h1>= 계약 등록 =</h1>
			<div>
				<form id="contractAddForm" action="/subAddContract" method="post" enctype="multipart/form-data">
					<div>
						<label>계약자 이름 : </label>
						<input id="contractName" type="text" name="contractName" value="" valChek="이름을 입력해주세요"/>
					</div>	
					<div>
						<label>계약 날짜 : </label>
						<input id="regitDateStart" type="date" name="contractActualDate" value="" valChek="계약 날짜를 입력해주세요"/>
					</div>	
					<div>
						<label>계약 만료일 : </label>
						<input id="regitDateEnd" type="date" name="contractExpiryDate" value="" valChek="만료일을 입력해주세요"/>
					</div>	
					<div>
						<label>가맹 금액 : </label>
						<input id="contractDeposit" type="text" name="contractDeposit" value="" valChek="가맹 금액을 입력해주세요"/>
					</div>	
						
					<div>
						<label>계약 첨부파일 : </label>
						<input id="contractFileBtn" type="button" class="btn btn-default" value="파일추가"/>
						<span id="contractFileAdd"></span>
						<input id="contractFile" type="file" class="btn btn-default" name="contractFile" value="" valChek="파일을 추가해주세요"/>
					</div>	
					<div>
						<label>계약 차수 : </label>
						<input id="contractN" type="text" name="contractN" value="1" readonly="readonly"/>
					</div>	
					<div>
						<label>본사 계약 담당 직원 : </label>
						<input id="headStaffId" type="text" name="headStaffId" value="" valChek="본사 담당직원 아이디를 입력해주세요"/>
					</div>	
					<div>
						<label>가맹 대표 코드 : </label>
						<input id="subCode" type="text" name="subCode" value="${subCode}" readonly="readonly"/>
<!-- 						<input id="subCodeCheck" type="button" class="btn btn-default" value="중복체크"/>	 -->
					</div>	
					<br/>
					<div class="clickBtn">
						<span id="valChekMsg"></span>
						<input id="contractAddBtn" type="button" class="btn btn-default" value="계약등록"/>
					</div>				
					<br/>
				</form>
			</div>
			</div>
		<div class="col-sm-4">
		</div>
	</div>
	
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>