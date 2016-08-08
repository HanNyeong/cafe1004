<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		var price = 0;
		$('.price').each(function(index,item){
			price += $("input[class=cartQuantity]:eq(" + index + ")").val()*$("input[class=price]:eq(" + index + ")").val();
		});
		$('#totalPrice').text(price);
	});
</script>
<title>subAddOrdersByCart</title>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-4">
	</div>
		<div class="col-sm-3 addForm">
			<h1>발주내역확인</h1>
		<form action="/addOrders" method="POST">
		<c:forEach var="ordersConfirmList" items="${ordersConfirmList}">
			<input type="hidden" name="subCode" value="${ordersConfirmList.subCode}"/>
			<input type="hidden" name="cartCode" value="${ordersConfirmList.cartCode}"/>
			<div class="inputNoLine">
				<div>
					1. 상품코드 : <input type="text" class="inputNoLine" name="hItemCode" readonly="readonly" value="${ordersConfirmList.hItemCode}"/>
				</div>
				<div>
					2. 상품명 : <input type="text" class="inputNoLine" name="hItemName" readonly="readonly" value="${ordersConfirmList.hItemName}" />
				</div>
				<div>
					3. 상품수량 : <input type="text" class="cartQuantity" name="cartQuantity" readonly="readonly" value="${ordersConfirmList.cartQuantity}"/>
				</div>
				<div>
					4. 공급가 : <input type="text" class="price" name="hItemSellingPrice" readonly="readonly" value="${ordersConfirmList.hItemSellingPrice}"/>
				</div>
			</div>
			<hr/>
		</c:forEach>
				<div class="clickBtn">
					<p>총 가격 : <span id="totalPrice"></span> 원 </p>
					<button  class="btn btn-default">주문
				</button></div>
			<br/>

		</form>
		</div>
	<div class="col-sm-5">
	</div>
</div>

<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>