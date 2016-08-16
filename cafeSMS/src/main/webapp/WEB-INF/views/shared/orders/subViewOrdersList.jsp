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
		var columnList = ['orders_code','sub_orders_group','sub_orders_quantity','sub_orders_date','sub_orders_head_check','sub_orders_status','orders_pay','orders_pay_date','head_item_code','sub_staff_code','head_staff_id','sub_orders_price']

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
		// 더보기
		$('#viewMoreBtn').click(function(){
			var viewMore = $('#viewMore').val();
			$('#viewMore').val(viewMore*1+25);
			$('#ordersListOrderBy').submit();
		});
		$('#ordersPayBtn').click(function(){
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
						$("input[class=subOrdersPrice]:eq(" + index + ")").prop('name','subOrdersPrice');
						$("input[class=totalAccountGroup]:eq(" + index + ")").prop('name','totalAccountGroup');
		    		}else{
		    			console.log("안됨")
		    		}
		    	});
	    		$('#ordersListForm').prop('action','/modifyOrdersPay');
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
	<form id="ordersListOrderBy" action="/viewOrdersList" method="POST">
		<input type="hidden" id="upDown" name="upDown" value="${ordersSearch.upDown}" />
		<input type="hidden" id="criteria" name="criteria" value="${ordersSearch.criteria}"/>
		<input type="hidden" id="subCode" name="subCode" value="${subLogin.subCode}"/>
		<input type="hidden" id="viewMore" name="viewMore" value="${ordersSearch.viewMore}"/>
		등록 날짜: 
		<input type="date" id="regitDateStart" name="regitDateStart" value="${ordersSearch.regitDateStart}"/> ~
		<input type="date" id="regitDateEnd" name="regitDateEnd" value="${ordersSearch.regitDateEnd}"/> 
		<br/><br/>
		
		<a href="/subOrdersPayConfirm?subCode=${subLogin.subCode}">
		<input type="button" id="ordersPay" class="btn btn-default" value="전체리스트보기"></a>
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
	<div class="col-sm-8">
		<h3>= 발주 결제 예정 목록 =</h3>
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-8 clickBtn">		
		<input type="button" id="ordersPayBtn" class="btn btn-default" value="결제">
		<input type="button" id="ordersPayBtn" class="btn btn-default" value="결제취소">
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
		본사확인날<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		배송 상태<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		결제 날짜<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		상품 코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		결제 금액<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-2">
	</div>
</div>
	<form id="ordersListForm" action="" method="POST">
		<c:forEach var="ordersList" items="${ordersList}">
		<c:if test="${ordersList.ordersPay == 'N'}">
				<input type="hidden" class="ordersCode" name="" value="${ordersList.ordersCode}">
				<input type="hidden" class="subCode" name="" value="${subLogin.subCode}">
				<input type="hidden" class="subOrdersPrice" name="" value="${ordersList.subOrdersPrice}">
				<input type="hidden" class="totalAccountGroup" name="" value="${ordersList.subOrdersGroup}">
				
			<div class="row tablediv">
				<div class="col-sm-2">
				</div>	
					<div class="col-sm-1">
						<input type="checkbox" class="checking" name="checking">
						${ordersList.ordersCode} 
					</div>
					<div class="col-sm-1">${ordersList.subOrdersQuantity} </div>
					<div class="col-sm-1">${ordersList.subOrdersDate} </div>
					<div class="col-sm-1">
						(${ordersList.headOrdersConfirm})
						${ordersList.subOrdersHeadCheck} 
					</div>
					<div class="col-sm-1">${ordersList.subOrdersStatus}</div>
					<div class="col-sm-1">
						(${ordersList.ordersPay})
						${ordersList.ordersPayDate} 
					</div>
					<div class="col-sm-1">${ordersList.headItemCode} </div>
					<div class="col-sm-1">${ordersList.subOrdersPrice} </div>
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