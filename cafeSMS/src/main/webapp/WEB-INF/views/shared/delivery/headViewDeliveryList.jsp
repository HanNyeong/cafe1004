<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>headViewDeliveryList</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="resources/function/upDownCheck.js"></script>
<script>
var list = function(upDown,criteria){
	$('#upDown').attr('value',upDown);
	$('#criteria').attr('value',criteria);
	$('#deliveryList').submit();	
}



$(document).ready(function(){
	var columnList = ['delivery_code','delivery_date','delivery_receive','delivery_location','delivery_return','delivery_person','orders_code','sub_orders_group','head_staff_id','sub_code']
	

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
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-2">
	</div>	
		<div class="col-sm-8">
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
				<option value="delivery_code" <c:if test="${search.searchKey eq 'delivery_code'}">selected="selected"</c:if>>배송코드</option>
				<option value="delivery_location" <c:if test="${search.searchKey eq 'delivery_location'}">selected="selected"</c:if>>현재위치</option>
				<option value="delivery_person" <c:if test="${search.searchKey eq 'delivery_person'}">selected="selected"</c:if>>배송담당자</option>
				<option value="orders_code" <c:if test="${search.searchKey eq 'orders_code'}">selected="selected"</c:if>>주문코드</option>
				<option value="subOrders_group" <c:if test="${search.searchKey eq 'subOrders_group'}">selected="selected"</c:if>>주문통합그룹</option>
				<option value="head_staff_id" <c:if test="${search.searchKey eq 'head_staff_id'}">selected="selected"</c:if>>본사배송담당자</option>
				<option value="sub_code" <c:if test="${search.searchKey eq 'sub_code'}">selected="selected"</c:if>>가맹코드</option>
			</select>
			<input type="text" id="search" name="search" value="${search.search}"/>
			<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
			<a href="/headViewDeliveryList"><input type="button" class="btn btn-default"  value="전체보기"/></a>
		
		</form>
	</c:if>
	</div>
	<div class="col-sm-2">
	</div>
</div>
<br/>
<br/>
<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-3">	
		<h3>본사측 배송조회</h3>
	</div>	
	<div class="col-sm-5 clickBtn">	
		<h4>
			분류 : 
			<select id="selectYN" required="required">
				<option value="" <c:if test="${YN eq ''}">selected="selected"</c:if>>::선택::</option>
				<option value="Y" <c:if test="${YN eq 'Y'}">selected="selected"</c:if>>수령</option>
				<option value="N" <c:if test="${YN eq 'N'}">selected="selected"</c:if>>미수령</option>
			</select>		
		</h4>
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<c:if test="${!empty deliveryList}">
	<div class="row tablediv">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-1 th">
			배송코드<span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">		
			배송 출발 날짜<span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">		
			배송 현재 위치<span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">		
			반송 해당여부<span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">		
			배송 담당자<span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">		
			주문코드<span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">		
			본사승인직원<span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">		
			가맹코드<span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-2">	
		</div>
	</div>
<c:forEach var="deliveryList" items="${deliveryList}"> 
	
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-1">${deliveryList.deliveryCode}</div>
			<div class="col-sm-1">${deliveryList.deliveryDate}</div>
			<div class="col-sm-1">(${deliveryList.deliveryReceive})${deliveryList.deliveryLocation}</div>
			<div class="col-sm-1">${deliveryList.deliveryReturn}</div>
			<div class="col-sm-1">${deliveryList.deliveryPerson}</div>
			<div class="col-sm-1">${deliveryList.ordersCode}</div>
			<div class="col-sm-1">${deliveryList.headStaffId}</div>
			<div class="col-sm-1">${deliveryList.subCode}</div>
			<div class="col-sm-2">	
			</div>
		</div>
	
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
</c:if>
	
</body>
</html>