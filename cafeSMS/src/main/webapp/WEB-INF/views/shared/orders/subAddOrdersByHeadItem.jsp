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
		<%-- <input type="hidden" name="hItemCode" value="${headItemList.hItemCode}">
		<input type="hidden" name="subCode" value="${subLogin.subCode}"> --%>
	<c:forEach var="headItemList" items="${headItemList}">
		<div>
			1. 상품명 : <input type="text" name="hItemName" value="${headItemList.hItemName}" readonly/>
		</div>
		<div>
			2. 상품수량 : <input type="text" name="hItemQuantity" value="${headItemList.hItemQuantity}" readonly/>
		</div>
		<div>
			3. 공급가 : <input type="text" name="hItemSellingPrice" value="${headItemList.hItemSellingPrice}" readonly/>
		</div>
	</c:forEach>
	<%-- <div>
		발주total가격 : <input type="text" name="hItemSellingPrice" value="${headItemList.hItemSellingPrice*headItemList.hItemQuantity}" readonly/>
	</div> --%>
</body>
</html>