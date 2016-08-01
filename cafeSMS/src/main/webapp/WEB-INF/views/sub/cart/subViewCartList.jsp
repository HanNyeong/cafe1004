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

		
	});
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
		6:삭제
		7:주문
	</P>        
	<c:forEach var="cartList" items="${cartList}">
	
		<p>
			1:${cartList.cartCode}
			2:${cartList.cartQuantity}
			3:${cartList.hItemCode}
			4:${cartList.subCode}
			5:<a href="/subModifyCart?cartCode=${cartList.cartCode}"><input type="button" id="cartModifyBtn" name="cartModifyBtn" value="수정"></a>
			5:<a href="/subDeleteCart?cartCode=${cartList.cartCode}"><input type="button" id="cartDeleteBtn" name="cartDeleteBtn" value="삭제"></a>
			5:<a href=""><input type="button" id="ordersBtn" name="ordersBtn" value="주문"></a>
		</p>
	
	</c:forEach>
</body>
</html>