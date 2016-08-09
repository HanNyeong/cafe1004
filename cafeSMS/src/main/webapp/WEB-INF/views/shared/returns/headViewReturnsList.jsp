<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	$('#returnsList').submit();	
}



$(document).ready(function(){
	var columnList = ['return_code','return_price','return_report_date','return_head_check','return_head_check_date','total_account_group','return_re_delivery','return_cancel','orders_code','specific_item_code','head_returns_confirm','sub_code']
	

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
		$('#returnsList').submit();
	});
	$('#searchBtn').click(function(){
		if($('#search').val() == ""){
			console.log("검색어입력하세요");
		}else{
			$('#returnsList').submit();
		}
	});
	
	
	//selectYN
	$('#selectYN').change(function(){
		console.log("change");
		
		
		if($('#selectYN').val() == ''){
			$('#YN').val('');
			$('#returnsList').submit();
		}else if($('#selectYN').val() == 'Y'){
			$('#YN').val('Y');
			$('#returnsList').submit();
		}else if($('#selectYN').val() == 'N'){
			$('#YN').val('N');
			$('#returnsList').submit();
		}	
	});
	

	
});

</script>
</head>
<body>
<a href="/">home</a><br>
	<c:if test="${empty returnsList}">
		해당 내역이 존재하지 않습니다.
	</c:if>
	<c:if test="${!empty returnsList}">
	<h1>[본사]측 반픔상품조회</h1>
	<!-- 상품 검색 -->
		<form name="returnsList" id="returnsList" action="/headViewReturnsList" method="post">
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
				<option value="return_code" <c:if test="${search.searchKey eq 'return_code'}">selected="selected"</c:if>>return_code</option>
				<option value="total_account_group" <c:if test="${search.searchKey eq 'total_account_group'}">selected="selected"</c:if>>total_account_group</option>
				<option value="orders_code" <c:if test="${search.searchKey eq 'orders_code'}">selected="selected"</c:if>>orders_code</option>
				<option value="specific_item_code" <c:if test="${search.searchKey eq 'specific_item_code'}">selected="selected"</c:if>>specific_item_code</option>
				<option value="sub_code" <c:if test="${search.searchKey eq 'sub_code'}">selected="selected"</c:if>>sub_code</option>
			</select>
		
			<input type="text" id="search" name="search" value="${search.search}"/>
			<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
			<a href="/headViewReturnsList"><input type="button" class="btn btn-default"  value="전체보기"/></a>
			
			분류 : 
			<select id="selectYN" required="required">
				<option value="" <c:if test="${YN eq ''}">selected="selected"</c:if>>::선택::</option>
				<option value="Y" <c:if test="${YN eq 'Y'}">selected="selected"</c:if>>수령</option>
				<option value="N" <c:if test="${YN eq 'N'}">selected="selected"</c:if>>미수령</option>
			</select>	
		</form>
	<hr/>
	
	<div>
		returnCode<span class="up">▲</span><span class="down">▼</span>
		returnPrice<span class="up">▲</span><span class="down">▼</span>
		returnReportDate<span class="up">▲</span><span class="down">▼</span>
		returnHeadCheck<span class="up">▲</span><span class="down">▼</span>
		returnHeadCheckDate<span class="up">▲</span><span class="down">▼</span>
		totalAccountGroup<span class="up">▲</span><span class="down">▼</span>
		returnReDelivery<span class="up">▲</span><span class="down">▼</span>
		returnCancel<span class="up">▲</span><span class="down">▼</span>
		ordersCode<span class="up">▲</span><span class="down">▼</span>
		specificItemCode<span class="up">▲</span><span class="down">▼</span>
		headReturnsConfirm<span class="up">▲</span><span class="down">▼</span>
		subCode<span class="up">▲</span><span class="down">▼</span>
		[상세보기]
		[환불승인]
		[처리]
	</div>
	<div>
		<div>-------------------------------------------------------------------------본사승인받은 [returnHeadCheck = Y]환불리스트-------------------------------------------------------------------------</div>
		<c:forEach var="returnsList" items="${returnsList}">
			<c:if test="${YN eq '' || YN eq null }">
				<div>
					${returnsList.returnCode}
					${returnsList.returnPrice}
					${returnsList.returnReportDate}
					${returnsList.returnHeadCheck}
					${returnsList.returnHeadCheckDate}
					${returnsList.totalAccountGroup}
					${returnsList.returnReDelivery}
					${returnsList.returnCancel}
					${returnsList.ordersCode}
					${returnsList.specificItemCode}
					${returnsList.headReturnsConfirm}
					${returnsList.subCode}
					<a href="/viewReturnsContent?returnCode=${returnsList.returnCode}">[상세보기]</a>
					
					<c:if test="${returnsList.returnHeadCheck == 'Y'}">
						<a href="/approvalReturns?returnCode=${returnsList.returnCode}">[환불승인]</a>
					</c:if>
					
					
					<c:if test="${returnsList.returnReDelivery == 'Y' && returnsList.headReturnsConfirm == 'N'}">
						<a href="/headReturnReDelivery?ordersCode=${returnsList.ordersCode}">[재배송]</a>
					</c:if>
					<c:if test="${returnsList.returnReDelivery == 'Y' && returnsList.headReturnsConfirm == 'Y'}">
						[재배송 처리]
					</c:if>
					<c:if test="${returnsList.returnReDelivery == 'N' && returnsList.headReturnsConfirm == 'N'}">
						<a href="/">[환불]</a>
					</c:if>
					<c:if test="${returnsList.returnReDelivery == 'N' && returnsList.headReturnsConfirm == 'Y'}">
						[환불 처리]
					</c:if>
				</div>
			</c:if>
			
			<c:if test="${returnsList.returnHeadCheck == YN}">
				<div>
					${returnsList.returnCode}
					${returnsList.returnPrice}
					${returnsList.returnReportDate}
					${returnsList.returnHeadCheck}
					${returnsList.returnHeadCheckDate}
					${returnsList.totalAccountGroup}
					${returnsList.returnReDelivery}
					${returnsList.returnCancel}
					${returnsList.ordersCode}
					${returnsList.specificItemCode}
					${returnsList.headReturnsConfirm}
					${returnsList.subCode}
					<a href="/viewReturnsContent?returnCode=${returnsList.returnCode}">[상세보기]</a>
					
					<c:if test="${returnsList.returnHeadCheck == 'Y'}">
						<a href="/approvalReturns?returnCode=${returnsList.returnCode}">[환불승인]</a>
					</c:if>
					
					
					<c:if test="${returnsList.returnReDelivery == 'Y' && returnsList.headReturnsConfirm == 'N'}">
						<a href="/headReturnReDelivery?ordersCode=${returnsList.ordersCode}">[재배송]</a>
					</c:if>
					<c:if test="${returnsList.returnReDelivery == 'Y' && returnsList.headReturnsConfirm == 'Y'}">
						[재배송 처리]
					</c:if>
					<c:if test="${returnsList.returnReDelivery == 'N' && returnsList.headReturnsConfirm == 'N'}">
						<a href="/">[환불]</a>
					</c:if>
					<c:if test="${returnsList.returnReDelivery == 'N' && returnsList.headReturnsConfirm == 'Y'}">
						[환불 처리]
					</c:if>
				</div>
			</c:if>
		</c:forEach>
	
	</div>
	</c:if> 
</body>
</html>