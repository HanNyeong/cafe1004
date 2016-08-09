<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="resources/function/upDownCheck.js"></script>
<script>
var list = function(upDown,criteria){
	$('#upDown').attr('value',upDown);
	$('#criteria').attr('value',criteria);
	$('#subSellList').submit();	
}



$(document).ready(function(){
	var columnList = ['sub_sell_code','inte_code','sub_sell_group','sub_sell_date','sub_sell_practical_selling_price','total_account_group','sub_sell_final','sub_sell_final_date','pay_method','sub_code','event_code','sub_staff_code','sub_sell_final_staff','sub_sell_cost']
	

	$('.up').each(function(index,item){
		$(item).click(function(){
			list('ASC',columnList[index]);
		});
	});
	$('.down').each(function(index,item){
		$(item).click(function(){
			list('DESC',columnList[index]);
		});
	});
	// 더보기
	$('#viewMoreBtn').click(function(){
		var viewMore = $('#viewMore').val();
		$('#viewMore').val(viewMore*1+25);
		$('#deliveryList').submit();
	});
	$('#searchBtn').click(function(){
		if($('#search').val() == ""){
			console.log("검색어입력하세요");
		}else{
			$('#deliveryList').submit();
		}
	});
	
	
	//selectYN
	$('#selectYN').change(function(){
		console.log("change");
		
		
		if($('#selectYN').val() == ''){
			$('#YN').val('');
			$('#deliveryList').submit();
		}else if($('#selectYN').val() == 'Y'){
			$('#YN').val('Y');
			$('#deliveryList').submit();
		}else if($('#selectYN').val() == 'N'){
			$('#YN').val('N');
			$('#deliveryList').submit();
		}	
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
		<input type="hidden" id="upDown" name="upDown" value="${search.upDown}" />
		<input type="hidden" id="criteria" name="criteria" value="${search.criteria}"/>
		<input type="hidden" id="viewMore" name="viewMore" value="${search.viewMore}"/>
		<input type="hidden" id="YN"  name="YN" value="${YN}"/>
					
		등록 날짜: 
		<input type="date" name="regitDateStart" value="${search.regitDateStart}"/> ~
		<input type="date" name="regitDateEnd" value="${search.regitDateEnd}"/> 
		<br/><br/>
		<select name="searchKey" required="required">
			<option value="">::선택::</option>
			<option value="delivery_code" <c:if test="${search.searchKey eq 'delivery_code'}">selected="selected"</c:if>>delivery_code</option>
			<option value="delivery_location" <c:if test="${search.searchKey eq 'delivery_location'}">selected="selected"</c:if>>delivery_location</option>
			<option value="delivery_person" <c:if test="${search.searchKey eq 'delivery_person'}">selected="selected"</c:if>>delivery_person</option>
			<option value="orders_code" <c:if test="${search.searchKey eq 'orders_code'}">selected="selected"</c:if>>orders_code</option>
			<option value="subOrders_group" <c:if test="${search.searchKey eq 'subOrders_group'}">selected="selected"</c:if>>subOrders_group</option>
			<option value="head_staff_id" <c:if test="${search.searchKey eq 'head_staff_id'}">selected="selected"</c:if>>head_staff_id</option>
			<option value="sub_code" <c:if test="${search.searchKey eq 'sub_code'}">selected="selected"</c:if>>sub_code</option>
		</select>
		<input type="text" id="search" name="search" value="${search.search}"/>
		<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
		<a href="/headViewDeliveryList"><input type="button" class="btn btn-default"  value="전체보기"/></a>
	
		분류 : 
		<select id="selectYN" required="required">
			<option value="" <c:if test="${YN eq ''}">selected="selected"</c:if>>::선택::</option>
			<option value="Y" <c:if test="${YN eq 'Y'}">selected="selected"</c:if>>수령</option>
			<option value="N" <c:if test="${YN eq 'N'}">selected="selected"</c:if>>미수령</option>
		</select>		
	</form>
	<hr/>
	
	
	<div>
			deliveryCode<span class="up">▲</span><span class="down">▼</span>
			deliveryDate<span class="up">▲</span><span class="down">▼</span>
			deliveryReceive<span class="up">▲</span><span class="down">▼</span>
			deliveryLocation<span class="up">▲</span><span class="down">▼</span>
			deliveryReturn<span class="up">▲</span><span class="down">▼</span>
			deliveryPerson<span class="up">▲</span><span class="down">▼</span>
			ordersCode<span class="up">▲</span><span class="down">▼</span>
			subOrdersGroup<span class="up">▲</span><span class="down">▼</span>
			headStaffId<span class="up">▲</span><span class="down">▼</span>
			subCode<span class="up">▲</span><span class="down">▼</span>
	</div>
	
	<div>
		<c:forEach var="deliveryList" items="${deliveryList}"> 
			<c:if test="${YN eq '' || YN eq null}">			
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
			</c:if>
			<c:if test="${deliveryList.deliveryReceive == YN}">			
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
			</c:if>
		</c:forEach>
		
	</div>
	
	</c:if>
	
</body>
</html>