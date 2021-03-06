<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>headViewOrdersList</title>
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
		$('#ordersConfirm').click(function(){
			if($('.checking:checked').size()<1){
		        alert("1개 이상 체크해주세요");
		        console.log("delete");
		    }else{
		    	$('.checking').each(function(index,item){
		    		if(!$(this).is(":checked")){
		    			console.log("체크안됨");
		    		}else if($(this).is(":checked")){
		    			console.log("체크됨");
						$("input[class=ordersCode]:eq(" + index + ")").prop('name','ordersCode');
						$("input[class=subCode]:eq(" + index + ")").prop('name','subCode');
						$("input[class=headItemCode]:eq(" + index + ")").prop('name','headItemCode');
						$("input[class=subOrdersQuantity]:eq(" + index + ")").prop('name','subOrdersQuantity');
						$("input[class=totalAccountGroup]:eq(" + index + ")").prop('name','totalAccountGroup');
		    		}else{
		    			console.log("안됨")
		    		}
		    	});
	    		$('#ordersListForm').prop('action','/modifyOrdersConfirm');
	    		$('#ordersListForm').submit();
		    }
		});
		
	});
</script>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-8">
		<form id="ordersListOrderBy" action="/headViewOrdersList" method="POST">
			<input type="hidden" id="upDown" name="upDown" value="${ordersSearch.upDown}" />
			<input type="hidden" id="criteria" name="criteria" value="${ordersSearch.criteria}"/>
			<input type="hidden" id="subCode" name="subCode" value="${subLogin.subCode}"/>
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
		<h3>= 주문내역 =</h3>
	</div>
	<div class="col-sm-6 clickBtn">
		<input type="button" id="ordersConfirm" class="btn btn-default" value="승인하기">
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<div class="row tablediv">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-1 th">
		<input type="checkbox" id="selectAll" class="selectAll" name="selectAll" onclick="selectAll(this)" value="전체 선택">
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
		본사 확인<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-2">
	</div>
</div>
	<form id="ordersListForm" action="" method="POST">
		<c:forEach var="ordersList" items="${ordersList}">
			<c:if test="${ordersList.ordersPay == 'Y' && ordersList.headOrdersConfirm == 'N'}">
				<input type="hidden" class="ordersCode" name="" value="${ordersList.ordersCode}">
				<input type="hidden" class="subCode" name="" value="${subLogin.subCode}">
				<input type="hidden" class="subOrdersQuantity" name="" value="${ordersList.subOrdersQuantity}">
				<input type="hidden" class="headItemCode" name="" value="${ordersList.headItemCode}">
				<input type="hidden" class="totalAccountGroup" name="" value="${ordersList.totalAccountGroup}">
				<div class="row tablediv">
				<div class="col-sm-2">
				</div>	
					<div class="col-sm-1">
						<input type="checkbox" class="checking" name="checking">
						${ordersList.ordersCode}  
					</div>	
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