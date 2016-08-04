<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$.list = function(upDown,criteria){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		$('#ordersListOrderBy').submit();	
	};
	$(document).ready(function(){
		$('#delOrdersBtn').click(function(){
			$('#ordersListForm').attr('action','/delOrders');
			$('#ordersListForm').submit();
		});
		$('#modifyPayBtn').click(function(){
			$('#ordersListForm').attr('action','/modifyOrdersPay');
			$('#ordersListForm').submit();
		});
		
	});
</script>
<body>
	<h1>주문내역</h1>
	<form id="ordersListOrderBy" action="/viewOrdersList" method="POST">
		<input type="hidden" id="upDown" name="upDown" value="" />
		<input type="hidden" id="criteria" name="criteria" value=""/>
		<input type="hidden" id="subCode" name="subCode" value="${subLogin.subCode}"/>
		등록 날짜: 
		<input type="date" name="regitDateStart" value="${clientSearch.regitDateStart}"/> ~
		<input type="date" name="regitDateEnd" value="${clientSearch.regitDateEnd}"/> 
		<br/><br/>
	</form>
	<p>
		1.발주 코드<span class="up">▲</span><span class="down">▼</span>
		2.주문 그룹 코드<span class="up">▲</span><span class="down">▼</span>
		3.주문 수량<span class="up">▲</span><span class="down">▼</span>
		4.주문 날짜<span class="up">▲</span><span class="down">▼</span>
		5.본사 확인 날짜<span class="up">▲</span><span class="down">▼</span>
		6.배송 상태<span class="up">▲</span><span class="down">▼</span>
		7.결제 유무<span class="up">▲</span><span class="down">▼</span>
		8.결제 날짜<span class="up">▲</span><span class="down">▼</span>
		9.상품 코드<span class="up">▲</span><span class="down">▼</span>
		10.주문 직원<span class="up">▲</span><span class="down">▼</span>
		11.승인 본사 직원<span class="up">▲</span><span class="down">▼</span>
		12.본사 확인 여부<span class="up">▲</span><span class="down">▼</span>
	</p>
	<form id="ordersListForm" action="" method="POST">
		<c:forEach var="ordersList" items="${ordersList}">
			<p>
			1.${ordersList.ordersCode}
			2.${ordersList.subOrdersGroup}
			3.${ordersList.subOrdersQuantity}
			4.${ordersList.subOrdersDate}
			5.${ordersList.subOrdersHeadCheck}
			6.${ordersList.subOrdersStatus}
			7.${ordersList.ordersPay}
			8.${ordersList.ordersPayDate}
			9.${ordersList.headItemCode}
			10.${ordersList.subStaffCode}
			11.${ordersList.headStaffId}
			12.${ordersList.headOrdersConfirm}
			</p>
			<c:if test="${ordersList.subOrdersStatus == '배송준비중'}">
				<input type="button" id="delOrdersBtn" value="주문취소">
			</c:if>
			<c:if test="${ordersList.ordersPay == 'N'}">
				<input type="button" id="modifyPayBtn" value="결제">
			</c:if>
		</c:forEach>
	</form>
	<!-- 주문취소,결제하기 btn추가 0804할일 -->
</body>
</html>