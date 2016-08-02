<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
	
	$(document).ready(function(){
		
		/* 오름차/내림차순 정렬 설정 */
		$('#deliveryCodeUp').click(function(){
			console.log("deliveryCodeUp");
			$('#criteria').attr('value','delivery_code');
			$('#upDown').attr('value','DESC');
			$('#deliveryList').submit();
		});
		$('#deliveryCodeDown').click(function(){
			
			$('#criteria').attr('value','delivery_code');
			$('#upDown').attr('value','ASC');
			$('#deliveryList').submit();
		});
		
		
		$('#deliveryDateUp').click(function(){
			
			$('#criteria').attr('value','delivery_date');
			$('#upDown').attr('value','DESC');
			$('#deliveryList').submit();
		});
		$('#deliveryDateDown').click(function(){
			
			$('#criteria').attr('value','delivery_date');
			$('#upDown').attr('value','ASC');
			$('#deliveryList').submit();
		});
		
		
		$('#deliveryReceiveUp').click(function(){
			
			$('#criteria').attr('value','delivery_receive');
			$('#upDown').attr('value','DESC');
			$('#deliveryList').submit();
		});
		$('#deliveryReceiveDown').click(function(){
			
			$('#criteria').attr('value','delivery_receive');
			$('#upDown').attr('value','ASC');
			$('#deliveryList').submit();
		});
		
		
		
		$('#deliveryLocationUp').click(function(){
			
			$('#criteria').attr('value','delivery_location');
			$('#upDown').attr('value','DESC');
			$('#deliveryList').submit();
		});
		$('#deliveryLocationDown').click(function(){
			
			$('#criteria').attr('value','delivery_location');
			$('#upDown').attr('value','ASC');
			$('#deliveryList').submit();
		});
		
		
		$('#deliveryReturnUp').click(function(){
			
			$('#criteria').attr('value','delivery_return');
			$('#upDown').attr('value','DESC');
			$('#deliveryList').submit();
		});
		$('#deliveryReturnDown').click(function(){
			
			$('#criteria').attr('value','delivery_return');
			$('#upDown').attr('value','ASC');
			$('#deliveryList').submit();
		});
		
		$('#deliveryPersonUp').click(function(){
			
			$('#criteria').attr('value','delivery_person');
			$('#upDown').attr('value','DESC');
			$('#deliveryList').submit();
		});
		$('#deliveryPersonDown').click(function(){
			
			$('#criteria').attr('value','delivery_person');
			$('#upDown').attr('value','ASC');
			$('#deliveryList').submit();
		});
		
		$('#ordersCodeUp').click(function(){
			
			$('#criteria').attr('value','orders_code');
			$('#upDown').attr('value','DESC');
			$('#deliveryList').submit();
		});
		$('#ordersCodeDown').click(function(){
			
			$('#criteria').attr('value','orders_code');
			$('#upDown').attr('value','ASC');
			$('#deliveryList').submit();
		});
		
		$('#subOrdersGroupUp').click(function(){
			
			$('#criteria').attr('value','sub_orders_group');
			$('#upDown').attr('value','DESC');
			$('#deliveryList').submit();
		});
		$('#subOrdersGroupDown').click(function(){
			
			$('#criteria').attr('value','sub_orders_group');
			$('#upDown').attr('value','ASC');
			$('#deliveryList').submit();
		});
		
		$('#headStaffIdUp').click(function(){
			
			$('#criteria').attr('value','head_staff_id');
			$('#upDown').attr('value','DESC');
			$('#deliveryList').submit();
		});
		$('#headStaffIdDown').click(function(){
			
			$('#criteria').attr('value','head_staff_id');
			$('#upDown').attr('value','ASC');
			$('#deliveryList').submit();
		});
		
		$('#subCodeUp').click(function(){
			
			$('#criteria').attr('value','sub_code');
			$('#upDown').attr('value','DESC');
			$('#deliveryList').submit();
		});
		$('#subCodeDown').click(function(){
			
			$('#criteria').attr('value','sub_code');
			$('#upDown').attr('value','ASC');
			$('#deliveryList').submit();
		});
		
	});

</script>
</head>
<body>
<a href="/">home</a>
	<h1>[본사]에서 배송조회</h1>
	<c:if test="${empty deliveryList}">
		[본사]의 배송 내역이 없습니다.
	</c:if>
	<c:if test="${!empty deliveryList}">
	
	<!-- 상품 검색 -->
	<form name="deliveryList" id="deliveryList" action="/headViewDeliveryList" method="post">
	<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
		<input type="hidden" name="criteria" id="criteria" value=""/>
		<input type="hidden" name="upDown" id="upDown" value=""/>
					
		등록 날짜: 
		<input type="date" name="regitDateStart" value="${deliverySearch.regitDateStart}"/> ~
		<input type="date" name="regitDateEnd" value="${deliverySearch.regitDateEnd}"/> 
		<br/><br/>
		<select name="searchKey" required="required">
			<option value="">::선택::</option>
			<option value="delivery_code" <c:if test="${deliverySearch.searchKey eq 'delivery_code'}">selected="selected"</c:if>>delivery_code</option>
			<option value="delivery_location" <c:if test="${deliverySearch.searchKey eq 'delivery_location'}">selected="selected"</c:if>>delivery_location</option>
			<option value="delivery_person" <c:if test="${deliverySearch.searchKey eq 'delivery_person'}">selected="selected"</c:if>>delivery_person</option>
			<option value="orders_code" <c:if test="${deliverySearch.searchKey eq 'orders_code'}">selected="selected"</c:if>>orders_code</option>
			<option value="subOrders_group" <c:if test="${deliverySearch.searchKey eq 'subOrders_group'}">selected="selected"</c:if>>subOrders_group</option>
			<option value="head_staff_id" <c:if test="${deliverySearch.searchKey eq 'head_staff_id'}">selected="selected"</c:if>>head_staff_id</option>
			<option value="sub_code" <c:if test="${deliverySearch.searchKey eq 'sub_code'}">selected="selected"</c:if>>sub_code</option>
		</select>
		<input type="text" name="searchDelivery" value="${deliverySearch.searchDelivery}"/>
		<button>검색</button>
	</form>
	<hr/>
	
	
	<div>
			deliveryCode<span id="deliveryCodeUp">▲</span><span id="deliveryCodeDown">▼</span>
			deliveryDate<span id="deliveryDateUp">▲</span><span id="deliveryDateDown">▼</span>
			deliveryReceive<span id="deliveryReceiveUp">▲</span><span id="deliveryReceiveDown">▼</span>
			deliveryLocation<span id="deliveryLocationUp">▲</span><span id="deliveryLocationDown">▼</span>
			deliveryReturn<span id="deliveryReturnUp">▲</span><span id="deliveryReturnDown">▼</span>
			deliveryPerson<span id="deliveryPersonUp">▲</span><span id="deliveryPersonDown">▼</span>
			ordersCode<span id="ordersCodeUp">▲</span><span id="ordersCodeDown">▼</span>
			subOrdersGroup<span id="subOrdersGroupUp">▲</span><span id="subOrdersGroupDown">▼</span>
			headStaffId<span id="headStaffIdUp">▲</span><span id="headStaffIdDown">▼</span>
			subCode<span id="subCodeUp">▲</span><span id="subCodeDown">▼</span>
	</div>
	
	<div>
		<c:forEach var="deliveryList" items="${deliveryList}"> 
			<div>
				${deliveryList.deliveryCode}
				${deliveryList.deliveryDate}
				${deliveryList.deliveryReceive}
				${deliveryList.deliveryLocation}
				${deliveryList.deliveryReturn}
				${deliveryList.deliveryPerson}
				${deliveryList.ordersCode}
				${deliveryList.subOrdersGroup}
				${deliveryList.headStaffId}
				${deliveryList.subCode}
			</div>
		</c:forEach>
		
	</div>
	
	</c:if>
	
</body>
</html>