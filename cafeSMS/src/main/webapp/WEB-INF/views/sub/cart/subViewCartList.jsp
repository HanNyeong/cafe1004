<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subViewCartList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$.list = function(upDown,criteria){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		$('#cartList').submit();	
	}
	$(document).ready(function(){
		//컬럼 명 지정해주는 배열 
		//자기입맛에 맛게 고쳐 쓰세요
		var columnList = ['cart_code','cart_quantity','h_item_code','sub_code']

		$('.up').each(function(index,item){
			$(item).click(function(){
				$.list('ASC',columnList[index]);
			});
		});
		$('.down').each(function(index,item){
			$(item).click(function(){
				$.list('DESC',columnList[index]);
			});
		});
		$('#searchBtn').click(function(){
			if($('#searchCart').val() == ""){
				console.log("검색어입력하세요");
			}else{
				$('#cartList').submit();
			}
		});
		
		// 삭제 체크 되어 있는 값 추출
		$('#cartDeleteBtn').click(function(){
			if($('.cartDelete:checked').size()<1){
		        alert("1개 이상 체크해주세요");
		        console.log("delete");
		    }else{
		    	$('.cartDelete').each(function(index,item){
		    		if(!$(this).is(":checked")){
		    			console.log("체크안됨");
						$("input[class=cartCode]:eq(" + index + ")").prop('name','');
						$("input[class=cartQuantity]:eq(" + index + ")").prop('name','');
						$("input[class=hItemCode]:eq(" + index + ")").prop('name','');
						$("input[class=subCode]:eq(" + index + ")").prop('name','');
						$("input[class=hItemName]:eq(" + index + ")").prop('name','');
						$("input[class=hItemSellingPrice]:eq(" + index + ")").prop('name','');
		    		}else if($(this).is(":checked")){
		    			console.log("체크됨");
		    		}else{
		    			console.log("안됨")
		    		}
		    	});
	    	
	    		$('#cartListForm').submit();
		    }
		});
		// 주문 체크 되어 있는 값 추출
		$('#ordersBtn').click(function(){
			if($('.cartOrders:checked').size()<1){
		        alert("1개 이상 체크해주세요");
		        console.log("orders");
		    }else{
		    	$('.cartOrders').each(function(index,item){
		    		if(!$(this).is(":checked")){
		    			console.log("체크안됨");
						$("input[class=cartCode]:eq(" + index + ")").prop('name','');
						$("input[class=cartQuantity]:eq(" + index + ")").prop('name','');
						$("input[class=hItemCode]:eq(" + index + ")").prop('name','');
						$("input[class=subCode]:eq(" + index + ")").prop('name','');
						$("input[class=hItemName]:eq(" + index + ")").prop('name','');
						$("input[class=hItemSellingPrice]:eq(" + index + ")").prop('name','');
		    			}else if($(this).is(":checked")){
		    				console.log("체크됨");
		    			}else{
		    				console.log("안됨")
		    			}
		    	});
					$('#cartListForm').prop('action','/viewOrdersInCart');
					$('#cartListForm').prop('method','GET');
					$('#cartListForm').submit();
		    }
		});
	});
	//삭제 체크 박스 전체 선택/해제
	function selectCartDeleteAll(source) {
		var checkboxes = document.getElementsByName('cartDelete');
			for(var i=0; i<checkboxes.length; i++) {
			checkboxes[i].checked = source.checked; // '모두 체크'에 체크가 되면 다 체크하고 아니면 다 해제하고!
		}
	}
	//주문 체크 박스 전체 선택/해제
	function selectCartOrdersAll(source) {
		var checkboxes = document.getElementsByName('cartOrders');
			for(var i=0; i<checkboxes.length; i++) {
			checkboxes[i].checked = source.checked; // '모두 체크'에 체크가 되면 다 체크하고 아니면 다 해제하고!
		}
	}
	
	
</script>
</head>
<body>

	<form id="cartList" action="/subViewCartList" method="POST">
		<input type="hidden" id="upDown" name="upDown" value="" />
		<input type="hidden" id="criteria" name="criteria" value=""/>
		<input type="hidden" id="cartCode" name="cartCode" value="${cart.cartCode}"/>
		<br/><br/>
		<select name="searchKey" required="required">
			<option value="">::선택::</option>
			<option value="cart_code" <c:if test="${cartSearch.searchKey eq 'cart_code'}">selected="selected"</c:if>>장바구니 코드</option>
			<option value="h_item_code" <c:if test="${cartSearch.searchKey eq 'cart_quantity'}">selected="selected"</c:if>>본사 상품 코드</option>
			<option value="sub_code" <c:if test="${cartSearch.searchKey eq 'sub_code'}">selected="selected"</c:if>>가맹 대표 코드</option>
		</select>
		<input type="text" id="searchCart" name="searchCart" value="${cartSearch.searchCart}"/>
		<input type="button" id="searchBtn" value="검색" /><a href="/viewcartList"><input type="button" value="전체보기"/></a>
	</form>
	<P>
		1:장바구니 코드<span class="up">▲</span><span class="down">▼</span>
		2:상품 수량<span class="up">▲</span><span class="down">▼</span>
		3:본사 상품 코드<span class="up">▲</span><span class="down">▼</span>
		4:가맹 대표 코드<span class="up">▲</span><span class="down">▼</span>
		5:수정
		6:삭제<input type="checkbox" id="cartDeleteAll" class="cartCodeChk" name="cartDeleteAll" onclick="selectCartDeleteAll(this)" value="삭제 전체 선택">
		7:주문<input type="checkbox" id="cartOrdersAll" class="cartCodeChk" name="cartOrdersAll" onclick="selectCartOrdersAll(this)" value="주문 전체 선택">
	</P>        
	<form id="cartListForm" action="/subDeleteCart" method="POST">
		<c:forEach var="cartList" items="${cartList}">
			<p>
				1:${cartList.cartCode}<input type="hidden" class="cartCode" name="cartCode" value="${cartList.cartCode}">
				2:${cartList.cartQuantity}<input type="hidden" class="cartQuantity" name="cartQuantity" value="${cartList.cartQuantity}">
				3:${cartList.hItemCode}<input type="hidden" class="hItemCode" name="hItemCode" value="${cartList.hItemCode}">
				4:${cartList.subCode}<input type="hidden" class="subCode" name="subCode" value="${cartList.subCode}">
				<input type="hidden" class="hItemName" name="hItemName" value="${cartList.hItemName}">
				<input type="hidden" class="hItemSellingPrice" name="hItemSellingPrice" value="${cartList.hItemSellingPrice}">
				5:<a href="/subModifyCart?cartCode=${cartList.cartCode}"><input type="button" id="cartModifyBtn" name="cartModifyBtn" value="수정"></a>
				6:<input type="checkbox" class="cartDelete" name="cartDelete" value="${cartList.cartCode}">
				7:<input type="checkbox" class="cartOrders" name="cartOrders" value="${cartList.cartCode}">
			</p>
		</c:forEach>
		<input type="button" id="cartDeleteBtn" name="cartDeleteBtn" value="삭제">
		<input type="button" id="ordersBtn" name="ordersBtn" value="주문">
	</form>
</body>
</html>