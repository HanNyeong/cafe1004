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
	
	//파일 추가
	$("#addReturnFileBtn").on("click",function(){
		console.log("addReturnFileBtn click");
		$("#addReturnFile").append('<div><label>반품첨부파일 : </label><input id = "returnFile" type="file" name="returnFile"/></div>');	
	});
	
	
	//반품 등록
	$("#addReturnBtn").on("click",function(){
		console.log("addReturnBtn click");
		
		if($("#returnReason").val()==""){
			$("#returnReasonMsg").text("반품사유를 적어주세요");
		}else if($("#returnFile").val()==""){
			$("#returnReasonMsg").text("");
			$("#returnFileMsg").text("첨부파일을 하나이상 첨부해주세요")	
		}else{
			$("#addReturnForm").attr("action","/subAddReturns");
			$("#addReturnForm").submit();
		}
			
	});
		
	
	
	
	
});

</script>
</head>
<body>
	<h1>해당 재고상품의 반품신청폼</h1><hr/>
	<div>
		<form  id="addReturnForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="subStockCode", value="${addReturns.subStockCode}"/>
			<div>
				<!-- 직접기입 -->
				<label>반품사유 : </label>
				<textarea id="returnReason" name="returnReason" cols="50" rows="5"></textarea>
				<span id="returnReasonMsg"></span>
			</div>
			<div>
				<!-- 자동 -->
				<label>반품가격 : </label>
				<input id="returnPrice" type="text" name="returnPrice" value="${addReturns.hItemSellingPrice}" readonly="readonly"/>
				<span id="returnPriceMsg"></span>
			</div>
			<div>
				<!-- 자동 -->
				<label>통합회계그룹 : </label>
				<input id="totalAccountGroup" type="text" name="totalAccountGroup" value="${addReturns.totalAccountGroup}" readonly="readonly"/>
			</div>
			<div>
				<!-- 직접기입 -->
				<label>반품첨부파일 : </label>
				<input id="returnFile" type="file" name="returnFile" />
				<input id="addReturnFileBtn" type="button" value="addReturnFileBtn"/>
				<span id="returnFileMsg"></span>
			</div>
			<div>
				<span id="addReturnFile"></span>
			</div>
			<div>
				<!-- 자동 -->
				<label>주문코드 : </label>
				<input id="ordersCode" type="text" name="ordersCode" value="${addReturns.ordersCode}" readonly="readonly"/>
			</div>
			<div>
				<!-- 자동 -->
				<label>개별상품코드 : </label>
				<input id="specificItemCode" type="text" name="specificItemCode" value="${addReturns.specificItemCode}" readonly="readonly"/>
			</div>
			<div>
				<!-- 자동 -->
				<label>가맹대표코드 : </label>
				<input id="subCode" type="text" name="subCode" value="${addReturns.subCode}" readonly="readonly"/>
			</div>
			<div>
				<input id="addReturnBtn" type="button" value="환불신청"/>
			</div>
		</form>
	</div>
</body>
</html>