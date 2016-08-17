<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subModifyCart</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $('#modifyCartBtn').click(function(){
    	
       $('#modifyCartForm').submit();
    });
 });
</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-4">
	</div>
		<div class="col-sm-3 addForm">
			<h1> 장바구니 수정 </h1>
		<form action="/subModifyCart" method="POST" id="modifyCartForm">
		   <input type="hidden" name="cartCode" value="${reCart.cartCode}" />
		   <input type="hidden" name="hItemCode" value="${reCart.hItemCode}" />
		   <input type="hidden" name="subCode" value="${subLogin.subCode}" />
		<div>
		   	<p>장바구니 코드 : ${reCart.cartCode}</p>
		 	<p>상품 수량 : <input type="number" id="cartQuantity" name="cartQuantity" min="1" value="${reCart.cartQuantity}"/></p>
			<p>본사 상품 코드 : ${reCart.hItemCode}</p>
			<p>가맹 대표 코드 : ${reCart.subCode}</p>
		</div>
		<br/>
			<div class="clickBtn">
				<input type="button" id="modifyCartBtn" class="btn btn-default" name="modifyCartBtn" value="수정"/>
		    </div>
			<br/>  
		</form> 
		</div>
	<div class="col-sm-5">
	</div>
</div>

<jsp:include page="/WEB-INF/module/footer.jsp"/>

</body>
</html>