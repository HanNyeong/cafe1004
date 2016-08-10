<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/function/upDownCheck.js"></script>
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
		var columnList = ['orders_code','sub_orders_group','sub_orders_quantity','sub_orders_date','sub_orders_head_check','sub_orders_status','orders_pay','orders_pay_date','head_item_code','sub_staff_code','head_staff_id','head_orders_confirm']

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
		<form id="ordersListOrderBy" action="/viewOrdersList" method="POST">
			<input type="hidden" id="upDown" name="upDown" value="" />
			<input type="hidden" id="criteria" name="criteria" value=""/>
			<input type="hidden" id="subCode" name="subCode" value="${subLogin.subCode}"/>
			등록 날짜: 
			<input type="date" name="regitDateStart" value="${clientSearch.regitDateStart}"/> ~
			<input type="date" name="regitDateEnd" value="${clientSearch.regitDateEnd}"/> 
			<br/><br/>
		<input type="button" class="btn btn-default" id="searchBtn" value="검색" /> 
		<a href="/subOrdersPayConfirm?subCode=${subLogin.subCode}"><input type="button" class="btn btn-default" value="전체보기"/></a>
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
	</form>
<jsp:include page="/WEB-INF/module/footer.jsp"/>

</body>
</html>