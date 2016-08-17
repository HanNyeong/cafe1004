<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subOrdersPayConfirm</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#delOrdersBtn').click(function(){
			$('#ordersListForm').attr('action','/delOrders');
			$('#ordersListForm').submit();
		});
		$('#modifyPayBtn').click(function(){
			$('#ordersListForm').attr('action','/modifyOrdersPay');
			$('#ordersListForm').submit();
		});
		var columnList = ['orders_code','sub_orders_quantity','sub_orders_date','orders_pay_date','sub_orders_status','head_item_code','sub_orders_price','head_orders_confirm']

		$('.up').each(function(index,item){
			$(item).click(function(){
				list('ASC',columnList[index],$("#ordersListOrderBy"));
			});
		});
		$('.down').each(function(index,item){
			$(item).click(function(){
				list('DESC',columnList[index],$("#ordersListOrderBy"));
			});
		});
		$('#viewMoreBtn').click(function(){
			var viewMore = $('#viewMore').val();
			$('#viewMore').val(viewMore*1+25);
			$('#ordersListOrderBy').submit();
		});
		$('#searchBtn').click(function(){
			$('#ordersListOrderBy').submit();
		});
	});
</script>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-8">
		<form id="ordersListOrderBy" action="/subOrdersPayConfirm" method="POST">
			<input type="hidden" id="upDown" name="upDown" value="${ordersSearch.upDown}" />
			<input type="hidden" id="criteria" name="criteria" value="${ordersSearch.criteria}"/>
			<input type="hidden" id="subCode" name="subCode" value="${subLogin.subCode}"/>
			<input type="hidden" id="viewMore" name="viewMore" value="${ordersSearch.viewMore}"/>
			<br/><br/> 
		
		</form>
	</div>
	<div class="col-sm-2">
	</div>
</div>
<br/>
<br/>
<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-2">
		<h3>= 최종 발주 리스트 =</h3>
	</div>
	<div class="col-sm-6 clickBtn">
		<a href="/viewOrdersList?subCode=${subLogin.subCode}"><input type="button" id="ordersPay" class="btn btn-default" value="발주추가"></a>	
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<div class="row tablediv">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-1 th">
		발주코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		주문 수량<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		주문 날짜<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		결제 날짜<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		배송 상태<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		상품 코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		결제 금액<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		본사확인<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-2">
	</div>
</div>
	<form id="ordersListForm" action="" method="POST">
		<c:forEach var="ordersList" items="${ordersList}">
			<c:if test="${ordersList.ordersPay == 'Y'}">
				<input type="hidden" class="ordersCode" name="" value="${ordersList.ordersCode}">
				<input type="hidden" class="subCode" name="" value="${subLogin.subCode}">
				
				<div class="row tablediv">
				<div class="col-sm-2">
				</div>	
					<div class="col-sm-1">${ordersList.ordersCode}</div>	
					<div class="col-sm-1">${ordersList.subOrdersQuantity}</div>	
					<div class="col-sm-1">${ordersList.subOrdersDate}</div>	 
					<div class="col-sm-1">${ordersList.ordersPayDate}</div>	 
					<div class="col-sm-1">${ordersList.subOrdersStatus}</div>	 
					<div class="col-sm-1">${ordersList.headItemCode}</div>	 
					<div class="col-sm-1">${ordersList.subOrdersPrice}</div>	
					<div class="col-sm-1">${ordersList.headOrdersConfirm}</div>	
					<div class="col-sm-2">
					</div>
				</div>
			</c:if>
		</c:forEach>
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-8">
				<input type="button" class="btn btn-default" id="viewMoreBtn" value="더보기"/>
			</div>
			<div class="col-sm-2">
			</div>
		</div>
	</form>
<jsp:include page="/WEB-INF/module/footer.jsp"/>

</body>
</html>