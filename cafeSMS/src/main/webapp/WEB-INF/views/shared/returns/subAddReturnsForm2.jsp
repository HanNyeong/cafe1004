<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subAddReturnsForm2</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(document).on("ready",function(){
	console.log("ready");
	
	//파일 추가
	$("#addReturnFileBtn").on("click",function(){
		console.log("addReturnFileBtn click");
		$("#addReturnFile").append('<div><input id = "returnFile" class="btn btn-default" type="file" name="returnFile"/></div>');	
	});
	//폼 제출 유효성
	 var check = undefinedEvent($('#addReturnBtn'),$('#addReturnForm'),$('#valChekMsg'));
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-4">
	</div>
	<div class="col-sm-5">
	<h1>= 재고상품 반품신청 =</h1>
		<form  id="addReturnForm" action="/subAddReturns" method="post" enctype="multipart/form-data">
			<input type="hidden" name="subStockCode" value="${addReturns.subStockCode}"/>
			<div>
				<!-- 직접기입 -->
				<label class="topLabel">반품사유 : </label>
				<textarea id="returnReason"  class="textereaContent" name="returnReason" cols="50" rows="5" value ="" valChek="반품 사유를  입력해주세요"></textarea>
			</div>
			<div>
				<!-- 자동 -->
				<label>반품가격 : </label>
				<input id="returnPrice" type="text" name="returnPrice" class="ffffNoLine" value="${addReturns.hItemSellingPrice}" readonly="readonly"/>
				<span id="returnPriceMsg"></span>
			</div>
			<div>
				<!-- 직접기입 -->
				<label>반품첨부파일 : </label>
				<input id="addReturnFileBtn" type="button" class="btn btn-default" value="파일추가"/>
				<input id="returnFile" type="file" name="returnFile" class="btn btn-default" value="" valChek="파일을 추가해주세요"/>
			</div>
			<div>
				<span id="addReturnFile"></span>
			</div>
			<div>
				<!-- 자동 -->
				<label>주문코드 : </label>
				<input id="ordersCode" type="text" name="ordersCode" value="${addReturns.ordersCode}" class="ffffNoLine" readonly="readonly"/>
			</div>
			<div>
				<!-- 자동 -->
				<label>개별상품코드 : </label>
				<input id="specificItemCode" type="text" name="specificItemCode" value="${addReturns.specificItemCode}" class="ffffNoLine" readonly="readonly"/>
			</div>
			<div>
				<!-- 자동 -->
				<label>가맹대표코드 : </label>
				<input id="subCode" type="text" name="subCode" value="${addReturns.subCode}" class="ffffNoLine" readonly="readonly"/>
			</div>
			<div>
				<label>재배송여부  Y : </label>
				<input type="radio" name="returnReDelivery" value="Y" checked="checked"/>
				<label> N : </label>
				<input type="radio" name="returnReDelivery" value="N"/>
			</div>
			<div class="clickCenterBtn">
				<span id="valChekMsg"></span>	
				<input id="addReturnBtn" class="btn btn-default" type="button" value="환불신청"/>
			</div>
		</form>
	</div>
	<div class="col-sm-3">
	</div>
</div>	
<jsp:include page="/WEB-INF/module/footer.jsp"/>	
</body>
</html>