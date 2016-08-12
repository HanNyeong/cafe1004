<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		console.log("ready");
		
		
		//수량을 적용

		$(".totalSoonPriceBtn").click(function(){
			var quanA = $(".quantity").val();
			var quanB = $(".soonPrice").val();
			var quanC = quanA * quanB;
			$(".totalSoonPrice").val(quanC);
		});
		
		
		//결제방식에따른 가격
		$("#payMethod").change(function(){
			if($("#payMethod").val() == "현금"){
				$("#payMethodValue").val(1);
				var payA = $("#sum").val();
				var payB = $("#payMethodValue").val();
				var payC = payA * payB;
				$("#totalPrice").val(payC);
			}else if($("#payMethod").val() == "카드"){
				$("#payMethodValue").val(0.9);
				var payA = $("#sum").val();
				var payB = $("#payMethodValue").val();
				var payC = payA * payB;
				$("#totalPrice").val(payC);
			}	
		});	
			
	});
</script>
</head>
<body>
	<h1>가맹판매등록!!</h1>
	<form>
		<c:set var = "sum" value = "0" />
		<c:forEach var="menuList" items="${menuList}">
			<div>
				${menuList.menuName}
				<input type="checkbox" class="checking" name="menuNameChk" value="${menuList.menuCode}"/>
				수량 : <input class="quantity" type="number" value=""/>
				<input type="text" name="menuIngrePrice" value="${menuList.menuIngrePrice}" readonly="readonly"/>
				<input type="text" name="menuSellingPrice" value="${menuList.menuSellingPrice}" readonly="readonly"/>
				<input type="text" class="soonPrice" name="soonPrice" value="${menuList.menuSellingPrice - menuList.menuIngrePrice}" readonly="readonly"/>
				<input type="text" class="totalSoonPrice" name="totalSoonPrice" value="" readonly="readonly"/>
				<input type="button" class="totalSoonPriceBtn" value="합계"/>
					<c:set var= "sum" value="${sum + (menuList.menuSellingPrice - menuList.menuIngrePrice)}"/>			
							
			</div>
			
			
		</c:forEach>
			
			결제수단적용전 총합계  : <input id="sum" type="text" value="${sum}" />
			<div>
				결제수단 : 
				<select id="payMethod">
					<option value="">::결제수단::</option>
					<option value="현금">현금</option>
					<option value="카드">카드</option>
				</select>
				<input id="payMethodValue" type="text" name="payMethodValue" value="">
			</div>
			<div>
			
				총 합계 : <input id="totalPrice" type="text" value="" readonly="readonly"/>
			</div>
	</form>
</body>
</html>