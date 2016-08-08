<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
	
	$(document).ready(function(){
		
		/* 오름차/내림차순 정렬 설정 */
		$('#subStockCodeUp').click(function(){
			
			$('#criteria').attr('value','sub_stock_code');
			$('#upDown').attr('value','DESC');
			$('#subStockList').submit();
		});
		$('#subStockCodeDown').click(function(){
			
			$('#criteria').attr('value','sub_stock_code');
			$('#upDown').attr('value','ASC');
			$('#subStockList').submit();
		});
		
		
		$('#headStockInDateUp').click(function(){
			
			$('#criteria').attr('value','head_stock_in_date');
			$('#upDown').attr('value','DESC');
			$('#subStockList').submit();
		});
		$('#headStockInDateDown').click(function(){
			
			$('#criteria').attr('value','head_stock_in_date');
			$('#upDown').attr('value','ASC');
			$('#subStockList').submit();
		});
		
		
		$('#subStockInDateUp').click(function(){
			
			$('#criteria').attr('value','sub_stock_in_date');
			$('#upDown').attr('value','DESC');
			$('#subStockList').submit();
		});
		$('#subStockInDateDown').click(function(){
			
			$('#criteria').attr('value','sub_stock_in_date');
			$('#upDown').attr('value','ASC');
			$('#subStockList').submit();
		});
		
		$('#subStockOutUp').click(function(){
			
			$('#criteria').attr('value','sub_stock_out');
			$('#upDown').attr('value','DESC');
			$('#subStockList').submit();
		});
		$('#subStockOutDown').click(function(){
			
			$('#criteria').attr('value','sub_stock_out');
			$('#upDown').attr('value','ASC');
			$('#subStockList').submit();
		});
		
		$('#ordersCodeUp').click(function(){
			
			$('#criteria').attr('value','orders_code');
			$('#upDown').attr('value','DESC');
			$('#subStockList').submit();
		});
		$('#ordersCodeDown').click(function(){
			
			$('#criteria').attr('value','orders_code');
			$('#upDown').attr('value','ASC');
			$('#subStockList').submit();
		});
		
		$('#subCodeUp').click(function(){
			
			$('#criteria').attr('value','sub_code');
			$('#upDown').attr('value','DESC');
			$('#subStockList').submit();
		});
		$('#subCodeDown').click(function(){
			
			$('#criteria').attr('value','sub_code');
			$('#upDown').attr('value','ASC');
			$('#subStockList').submit();
		});
		
		$('#headItemCodeUp').click(function(){
			
			$('#criteria').attr('value','head_item_code');
			$('#upDown').attr('value','DESC');
			$('#subStockList').submit();
		});
		$('#headItemCodeDown').click(function(){
			
			$('#criteria').attr('value','head_item_code');
			$('#upDown').attr('value','ASC');
			$('#subStockList').submit();
		});
		
		$('#specificItemCodeUp').click(function(){
			
			$('#criteria').attr('value','specific_item_code');
			$('#upDown').attr('value','DESC');
			$('#subStockList').submit();
		});
		$('#specificItemCodeDown').click(function(){
			
			$('#criteria').attr('value','specific_item_code');
			$('#upDown').attr('value','ASC');
			$('#subStockList').submit();
		});
		
		$('#subStaffCodeUp').click(function(){
			
			$('#criteria').attr('value','sub_staff_code');
			$('#upDown').attr('value','DESC');
			$('#subStockList').submit();
		});
		$('#subStaffCodeDown').click(function(){
			
			$('#criteria').attr('value','sub_staff_code');
			$('#upDown').attr('value','ASC');
			$('#subStockList').submit();
		});
		
	});

</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-8">
	<!-- 상품 검색 -->
		<form name="subStockList" id="subStockList" action="/subViewSubStockList" method="post">
			<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
			<input type="hidden" name="criteria" id="criteria" value=""/>
			<input type="hidden" name="upDown" id="upDown" value=""/>
			<input type="hidden" name="subCode" value="${subCode}"/>			
			등록 날짜: 
			<input type="date" name="regitDateStart" value="${subStockSearch.regitDateStart}"/> ~
			<input type="date" name="regitDateEnd" value="${subStockSearch.regitDateEnd}"/> 
			<br/><br/>
			<select name="searchKey" required="required">
				<option value="">::선택::</option>
				<option value="sub_stock_code" <c:if test="${subStockSearch.searchKey eq 'sub_stock_code'}">selected="selected"</c:if>>sub_stock_code</option>
				<option value="orders_code" <c:if test="${subStockSearch.searchKey eq 'orders_code'}">selected="selected"</c:if>>orders_code</option>
				<option value="head_item_code" <c:if test="${subStockSearch.searchKey eq 'head_item_code'}">selected="selected"</c:if>>head_item_code</option>
				<option value="specific_item_code" <c:if test="${subStockSearch.searchKey eq 'specific_item_code'}">selected="selected"</c:if>>specific_item_code</option>
				<option value="sub_staff_code" <c:if test="${subStockSearch.searchKey eq 'sub_staff_code'}">selected="selected"</c:if>>sub_staff_code</option>
			</select>
			<input type="text" name="searchSubStock" value="${subStockSearch.searchSubStock}"/>
			<button  class="btn btn-default">검색</button>
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
		<h3>= 가맹재고리스트 =</h3>
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<br/>
<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-8">
		<h4> ● 입고 전 </h4>
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<c:forEach var="subStockList" items="${subStockList}">
	<c:if test="${subStockList.subStockInDate == null}">
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-1 th">	
				재고 코드<span id="subStockCodeUp">▲</span><span id="subStockCodeDown">▼</span>
			</div>
			<div class="col-sm-1 th">	
				가맹입고날<span id="headStockInDateUp">▲</span><span id="headStockInDateDown">▼</span>	
			</div>
			<div class="col-sm-1 th">	
				판매 여부<span id="subStockOutUp">▲</span><span id="subStockOutDown">▼</span>
			</div>
			<div class="col-sm-1 th">	
				주문 코드<span id="ordersCodeUp">▲</span><span id="ordersCodeDown">▼</span>
			</div>
			<div class="col-sm-1 th">
				가맹 코드<span id="subCodeUp">▲</span><span id="subCodeDown">▼</span>
			</div>
			<div class="col-sm-1 th">
				본사상품C<span id="headItemCodeUp">▲</span><span id="headItemCodeDown">▼</span>
			</div>
			<div class="col-sm-1 th">	
				개별상품C<span id="specificItemCodeUp">▲</span><span id="specificItemCodeDown">▼</span>
			</div>
			<div class="col-sm-1 th">
				입고확인
			</div>
			<div class="col-sm-2">
			</div>
		</div>
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>	 
				<div class="col-sm-1">${subStockList.subStockCode}</div>
				<div class="col-sm-1">${subStockList.headStockInDate}</div>
				<div class="col-sm-1">${subStockList.subStockOut}</div>
				<div class="col-sm-1">${subStockList.ordersCode}</div>
				<div class="col-sm-1">${subStockList.subCode}</div>
				<div class="col-sm-1">${subStockList.headItemCode}</div>
				<div class="col-sm-1">${subStockList.specificItemCode}</div>
				<div class="col-sm-1">
					<a href="/subWarehousing?subStockCode=${subStockList.subStockCode}&subCode=${subStockList.subCode}&ordersCode=${subStockList.ordersCode}">[입고]</a>
				</div>
			<div class="col-sm-2">
			</div>
		</div>
	</c:if>	
</c:forEach>
<br/>
<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-8">
		<h4> ● 입고 후 </h4>
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<c:forEach var="subStockList" items="${subStockList}">
	<c:if test="${subStockList.subStockInDate != null}">
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-1 th">	
				재고 코드<span id="subStockCodeUp">▲</span><span id="subStockCodeDown">▼</span>
			</div>
			<div class="col-sm-1 th">	
				가맹입고날<span id="headStockInDateUp">▲</span><span id="headStockInDateDown">▼</span>
			</div>
			<div class="col-sm-1 th">	
				입고확인날<span id="subStockInDateUp">▲</span><span id="subStockInDateDown">▼</span>
			</div>
			<div class="col-sm-1 th">
				판매여부<span id="subStockOutUp">▲</span><span id="subStockOutDown">▼</span>
			</div>
			<div class="col-sm-1 th">
				주문코드<span id="ordersCodeUp">▲</span><span id="ordersCodeDown">▼</span>
			</div>
			<div class="col-sm-1 th">
				본사상품C<span id="headItemCodeUp">▲</span><span id="headItemCodeDown">▼</span>
			</div>
			<div class="col-sm-1 th">
				개별상품C<span id="specificItemCodeUp">▲</span><span id="specificItemCodeDown">▼</span>
			</div>
			<div class="col-sm-1 th">
				확인직원<span id="subStaffCodeUp">▲</span><span id="subStaffCodeDown">▼</span>
			</div>
			<div class="col-sm-2">
			</div>
		</div>
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>
				<div class="col-sm-1">${subStockList.subStockCode}</div>
				<div class="col-sm-1">${subStockList.headStockInDate}</div>
				<div class="col-sm-1">${subStockList.subStockInDate}</div>
				<div class="col-sm-1">${subStockList.subStockOut}</div>
				<div class="col-sm-1">${subStockList.ordersCode}</div>
				<div class="col-sm-1">${subStockList.subCode}</div>
				<div class="col-sm-1">${subStockList.specificItemCode}</div>
				<div class="col-sm-1">${subStockList.subStaffCode}</div>
			<div class="col-sm-2">
			</div>
		</div>
	</c:if>	
</c:forEach>
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>