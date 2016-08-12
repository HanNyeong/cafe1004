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

	$.calculator = function(){
		var totalPrice = $('#totalPrice').val();
		totalPrice = 0 ;
		var sum = $('#sum').val();
		sum = 0;
		$('.checking').each(function(index,item){
			var payMethodValue = $('#payMethodValue').val();
			var menuIngrePrice = $("input[class=menuIngrePrice]:eq(" + index + ")").val();
			var quantity = $("input[class=quantity]:eq(" + index + ")").val();
			var menuSellingPrice = $("input[class=menuSellingPrice]:eq(" + index + ")").val();
			var soonPrice = $("input[class=soonPrice]:eq(" + index + ")").val();
			if($(this).is(':checked')){
				$("input[class=menuIngrePriceText]:eq(" + index + ")").val(menuIngrePrice*quantity);
				$("input[class=menuSellingPriceText]:eq(" + index + ")").val(menuSellingPrice*quantity);
				$("input[class=soonPriceText]:eq(" + index + ")").val(soonPrice*quantity);
				if($('#payMethod').val() != ""){
					totalPrice= Number(totalPrice);
					sum = Number(sum);
					console.log(typeof Number(sum));
					console.log(typeof sum);
					
					console.log(typeof totalPrice+"이거");
					sum +=Number(soonPrice)*Number(quantity);
					$('#sum').val(sum);
					totalPrice+=Number(payMethodValue)*Number(soonPrice)*Number(quantity);
					$('#totalPrice').val(totalPrice);
				}
			}else{
				$("input[class=menuIngrePriceText]:eq(" + index + ")").val();
				$("input[class=menuSellingPriceText]:eq(" + index + ")").val();
				$("input[class=soonPriceText]:eq(" + index + ")").val();
			}
		});
	}

	$(document).ready(function(){
		console.log("ready");
		$('.checking').click(function(){
				$.calculator();
		});
		$('.totalSoonPriceBtn').click(function(){
			$.calculator();
		});
		$('.quantity').change(function(){
			$.calculator();
		});
		$('#payMethod').change(function(){
			$.calculator();
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
				<input type="hidden" class="menuIngrePrice" value="${menuList.menuIngrePrice}">
				<input type="hidden" class="menuSellingPrice" value="${menuList.menuSellingPrice}">
				<input type="hidden" class="soonPrice" value="${menuList.menuSellingPrice - menuList.menuIngrePrice}">
				<input type="checkbox" class="checking" name="menuNameChk" value="${menuList.menuCode}"/>
				수량 : <input class="quantity" type="number" min="1" value=""/>
				원가 : <input type="text" class="menuIngrePriceText" name="menuIngrePrice" value="" readonly="readonly"/>
				판매가 : <input type="text" class="menuSellingPriceText" name="menuSellingPrice" value="" readonly="readonly"/>
				순이익 : <input type="text" class="soonPriceText" name="soonPrice" value="" readonly="readonly"/>
					<c:set var= "sum" value=""/>			
							
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
			<input type="button" >
	</form>
</body>
</html>