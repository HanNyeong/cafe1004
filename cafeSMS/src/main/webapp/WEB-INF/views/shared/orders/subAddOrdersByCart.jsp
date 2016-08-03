<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>발주내역확인:by head_item</h1>
		
	<c:forEach var="ordersConfirmList" items="${ordersConfirmList}">
		<div>
			1. 상품코드 : <input type="text" name="hItemName" value="${ordersConfirmList.hItemCode}" readonly/>
		</div>
		<div>
			2. 상품명 : <input type="text" name="hItemName" value="${ordersConfirmList.hItemName}" readonly/>
		</div>
		<div>
			3. 상품수량 : <input type="text" name="hItemQuantity" value="${ordersConfirmList.cartQuantity}" readonly/>
		</div>
		<div>
			4. 공급가 : <input type="text" name="hItemSellingPrice" value="${ordersConfirmList.hItemSellingPrice}" readonly/>
		</div>
	</c:forEach>
		<button>주문하기</button>
	<%-- <div>
		발주total가격 : <input type="text" name="hItemSellingPrice" value="${headItemList.hItemSellingPrice*headItemList.hItemQuantity}" readonly/>
	</div> --%>
</body>
</html>