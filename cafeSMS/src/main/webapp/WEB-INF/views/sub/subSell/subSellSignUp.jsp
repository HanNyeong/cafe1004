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
		$('#totalPriceHelper').text('');
		var totalPrice = $('#totalPrice').val();
		totalPrice = 0 ;
		var sum = $('#sum').val();
		sum = 0;
		$('.checking').each(function(index,item){
			var payMethodValue = $('#payMethodValue').val();
			var menuIngrePrice = $("input[class=menuIngrePrice]:eq(" + index + ")").val();
			var soonPrice = $("input[class=soonPrice]:eq(" + index + ")").val();
			var menuSellingPrice = $("input[class=menuSellingPrice]:eq(" + index + ")").val();
			var quantity = $("input[class=quantity]:eq(" + index + ")").val();
			var eventDiscountRate = $("input[class=eventDiscountRate]:eq(" + index + ")").val();
			if($(this).is(':checked')){
				$("input[class=menuSellingPriceText]:eq(" + index + ")").val(menuSellingPrice*quantity);
				if($('#payMethod').val() != ""){
					totalPrice= Number(totalPrice);
					sum = Number(sum);
					sum +=Number(menuSellingPrice)*Number(quantity);
					$('#sum').val(sum);
					totalPrice+=Number(payMethodValue)*Number(menuSellingPrice)*Number(quantity);
					$('#totalPrice').val(totalPrice);
				}else{
					$('#totalPriceHelper').css('color','red');
					$('#totalPriceHelper').text('결제방식을 등록해주세요');
					
				}
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
			if($('#payMethod').val()=='현금'){
				$('#payMethodValue').val(1);
			}else if($('#payMethod').val()=='카드'){
				$('#payMethodValue').val(0.9);
			}else{
				$('#payMethodValue').val('');
			}
			$.calculator();
		});

		$('#subSellsignUpBtn').click(function(){
			if($('#totalPrice').val() != ""){
		    	$('.checking').each(function(index,item){
		    		if(!$(this).is(":checked")){
		    			console.log("체크안됨");
		    		}else if($(this).is(":checked")){
						$("input[class=menuIngrePrice]:eq(" + index + ")").prop('name','menuIngrePrice');
						$("input[class=menuSellingPrice]:eq(" + index + ")").prop('name','menuSellingPrice');
						$("input[class=soonPrice]:eq(" + index + ")").prop('name','soonPrice');
						$("input[class=quantity]:eq(" + index + ")").prop('name','quantity');
						$("input[class=eventCode]:eq(" + index + ")").prop('name','eventCode');
						$("input[class=menuCode]:eq(" + index + ")").prop('name','menuCode');
						$("input[class=subCode]:eq(" + index + ")").prop('name','subCode');
		    			console.log("체크됨");
		    			
						var onePlus = $("input[class=eventDiscountRate]:eq(" + index + ")").val();   
						console.log(onePlus);
		    			if(onePlus == 0.5){
		    				if($("input[class=quantity]:eq(" + index + ")").val()%2 != 0){
    							$('#totalPriceHelper').css('color','red');
    							$('#totalPriceHelper').text('1+1상품 입니다.');
    						}
		    			}
		    			
		    		}else{
		    			console.log("안됨")
		    		}
		    	});
		    	if($('#totalPriceHelper').text() == ""){
		    		$('#subSellsignUp').submit();
		    	}
			}else{
				$('#totalPriceHelper').css('color','red');
				$('#totalPriceHelper').text('상품을 등록해주세요');
			}
			
		});
	});
</script>
</head>
<body>
	<h1>가맹판매등록!!</h1>
	<form action="/subAddSubSell" method="POST" id="subSellsignUp">
		<input type="hidden" name="subCode" value="${subLogin.subCode}">
		<c:forEach var="menuList" items="${menuList}">
			
			<div>
				${menuList.menuName} 
				<c:if test="${menuList.eventName != '행사없음'}">
					${menuList.eventName}
					
				</c:if>: 
				${menuList.eventDiscountRate}
				${menuList.menuIngrePrice}
				${menuList.menuSellingPrice*menuList.eventDiscountRate}
				${menuList.menuSellingPrice*menuList.eventDiscountRate - menuList.menuIngrePrice}
				<input type="hidden" class="eventName" value="${menuList.eventName}">
				
				<input type="hidden" class="eventCode" name="" value="${menuList.eventCode}">
				<input type="hidden" class="eventDiscountRate" value="${menuList.eventDiscountRate}">
				<input type="hidden" class="menuIngrePrice" name="" value="${menuList.menuIngrePrice}">
				<input type="hidden" class="menuSellingPrice" name="" value="${menuList.menuSellingPrice*menuList.eventDiscountRate}">
				<input type="hidden" class="soonPrice"  name="" value="${menuList.menuSellingPrice*menuList.eventDiscountRate - menuList.menuIngrePrice}">
				<input type="hidden" class="menuCode" name="" value="${menuList.menuCode}">
				<input type="checkbox" class="checking" />
				
				수량 : <input class="quantity" type="number" min="1" value=""/>
				판매가 : <input type="text" class="menuSellingPriceText" value="" readonly="readonly"/>
				
			</div>
		</c:forEach>
			결제수단적용전 총합계  : <input id="sum" type="text" value="" />
			<div>
			
				결제수단 : 
				<select id="payMethod" name="payMethod">
					<option value="">::결제수단::</option>
					<option value="현금">현금</option>
					<option value="카드">카드</option>
				</select>
				<input id="payMethodValue" type="text" name="payMethodValue" value="">
			</div>
			<div>
			
				총 합계 : <input id="totalPrice" type="text" value="" readonly="readonly"/>
				<span id="totalPriceHelper"></span>
			</div>
			<input type="button" id="subSellsignUpBtn" value="판매">
	</form>
</body>
</html>