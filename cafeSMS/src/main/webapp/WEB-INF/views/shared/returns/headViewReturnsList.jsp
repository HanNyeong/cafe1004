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
		$('#returnCodeUp').click(function(){
			
			$('#criteria').attr('value','return_code');
			$('#upDown').attr('value','DESC');
			$('#returnsList').submit();
		});
		$('#returnCodeDown').click(function(){
			
			$('#criteria').attr('value','return_code');
			$('#upDown').attr('value','ASC');
			$('#returnsList').submit();
		});
		
		
		$('#returnPriceUp').click(function(){
			
			$('#criteria').attr('value','return_price');
			$('#upDown').attr('value','DESC');
			$('#returnsList').submit();
		});
		$('#returnPriceDown').click(function(){
			
			$('#criteria').attr('value','return_price');
			$('#upDown').attr('value','ASC');
			$('#returnsList').submit();
		});
		
		
		$('#returnReportDateUp').click(function(){
			
			$('#criteria').attr('value','return_report_date');
			$('#upDown').attr('value','DESC');
			$('#returnsList').submit();
		});
		$('#returnReportDateDown').click(function(){
			
			$('#criteria').attr('value','return_report_date');
			$('#upDown').attr('value','ASC');
			$('#returnsList').submit();
		});
		
		
		$('#returnHeadCheckUp').click(function(){
			
			$('#criteria').attr('value','return_head_check');
			$('#upDown').attr('value','DESC');
			$('#returnsList').submit();
		});
		$('#returnHeadCheckDown').click(function(){
			
			$('#criteria').attr('value','return_head_check');
			$('#upDown').attr('value','ASC');
			$('#returnsList').submit();
		});
		
		
		$('#returnHeadCheckDateUp').click(function(){
			
			$('#criteria').attr('value','return_head_check_date');
			$('#upDown').attr('value','DESC');
			$('#returnsList').submit();
		});
		$('#returnHeadCheckDateDown').click(function(){
			
			$('#criteria').attr('value','return_head_check_date');
			$('#upDown').attr('value','ASC');
			$('#returnsList').submit();
		});
		
		$('#totalAccountGroupUp').click(function(){
			
			$('#criteria').attr('value','total_account_group');
			$('#upDown').attr('value','DESC');
			$('#returnsList').submit();
		});
		$('#totalAccountGroupDown').click(function(){
			
			$('#criteria').attr('value','total_account_group');
			$('#upDown').attr('value','ASC');
			$('#returnsList').submit();
		});
		
		
		$('#returnReDeliveryUp').click(function(){
			
			$('#criteria').attr('value','return_re_delivery');
			$('#upDown').attr('value','DESC');
			$('#returnsList').submit();
		});
		$('#returnReDeliveryDown').click(function(){
			
			$('#criteria').attr('value','return_re_delivery');
			$('#upDown').attr('value','ASC');
			$('#returnsList').submit();
		});
		
		
		$('#returnCancelUp').click(function(){
			
			$('#criteria').attr('value','return_cancel');
			$('#upDown').attr('value','DESC');
			$('#returnsList').submit();
		});
		$('#returnCancelDown').click(function(){
			
			$('#criteria').attr('value','return_cancel');
			$('#upDown').attr('value','ASC');
			$('#returnsList').submit();
		});
		
		$('#ordersCodeUp').click(function(){
			
			$('#criteria').attr('value','orders_code');
			$('#upDown').attr('value','DESC');
			$('#returnsList').submit();
		});
		$('#ordersCodeDown').click(function(){
			
			$('#criteria').attr('value','orders_code');
			$('#upDown').attr('value','ASC');
			$('#returnsList').submit();
		});
		
		$('#specificItemCodeUp').click(function(){
			
			$('#criteria').attr('value','specific_item_code');
			$('#upDown').attr('value','DESC');
			$('#returnsList').submit();
		});
		$('#specificItemCodeDown').click(function(){
			
			$('#criteria').attr('value','specific_item_code');
			$('#upDown').attr('value','ASC');
			$('#returnsList').submit();
		});
		
		$('#headReturnsConfirmUp').click(function(){
			
			$('#criteria').attr('value','head_returns_confirm');
			$('#upDown').attr('value','DESC');
			$('#returnsList').submit();
		});
		$('#headReturnsConfirmDown').click(function(){
			
			$('#criteria').attr('value','head_returns_confirm');
			$('#upDown').attr('value','ASC');
			$('#returnsList').submit();
		});
		$('#subCodeUp').click(function(){
			
			$('#criteria').attr('value','sub_code');
			$('#upDown').attr('value','DESC');
			$('#returnsList').submit();
		});
		$('#subCodeDown').click(function(){
			
			$('#criteria').attr('value','sub_code');
			$('#upDown').attr('value','ASC');
			$('#returnsList').submit();
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
			<input type="hidden" name="criteria" id="criteria" value=""/>
			<input type="hidden" name="upDown" id="upDown" value=""/>
			
			
			
			
			등록 날짜: 
			<input type="date" name="regitDateStart" value="${returnsSearch.regitDateStart}"/> ~
			<input type="date" name="regitDateEnd" value="${returnsSearch.regitDateEnd}"/> 
			<br/><br/>
			<select name="searchKey" required="required">
				<option value="">::선택::</option>
				<option value="return_code" <c:if test="${returnsSearch.searchKey eq 'return_code'}">selected="selected"</c:if>>return_code</option>
				<option value="total_account_group" <c:if test="${returnsSearch.searchKey eq 'total_account_group'}">selected="selected"</c:if>>total_account_group</option>
				<option value="orders_code" <c:if test="${retunrsSearch.searchKey eq 'orders_code'}">selected="selected"</c:if>>orders_code</option>
				<option value="specific_item_code" <c:if test="${returnsSearch.searchKey eq 'specific_item_code'}">selected="selected"</c:if>>specific_item_code</option>
				<option value="sub_code" <c:if test="${returnsSearch.searchKey eq 'sub_code'}">selected="selected"</c:if>>sub_code</option>
			</select>
			<input type="text" name="searchReturns" value="${returnsSearch.searchReturns}"/>
			<button>검색</button>
		</form>
	<hr/>
	
	<div>
		returnCode<span id="returnCodeUp">▲</span><span id="returnCodeDown">▼</span>
		returnPrice<span id="returnPriceUp">▲</span><span id="returnPriceDown">▼</span>
		returnReportDate<span id="returnReportDateUp">▲</span><span id="returnReportDateDown">▼</span>
		returnHeadCheck<span id="returnHeadCheckUp">▲</span><span id="returnHeadCheckDown">▼</span>
		returnHeadCheckDate<span id="returnHeadCheckDateUp">▲</span><span id="returnHeadCheckDateDown">▼</span>
		totalAccountGroup<span id="totalAccountGroupUp">▲</span><span id="totalAccountGroupDown">▼</span>
		returnReDelivery<span id="returnReDeliveryUp">▲</span><span id="returnReDeliveryDown">▼</span>
		returnCancel<span id="returnCancelUp">▲</span><span id="returnCancelDown">▼</span>
		ordersCode<span id="ordersCodeUp">▲</span><span id="ordersCodeDown">▼</span>
		specificItemCode<span id="specificItemCodeUp">▲</span><span id="specificItemCodeDown">▼</span>
		headReturnsConfirm<span id="headReturnsConfirmUp">▲</span><span id="headReturnsConfirmDown">▼</span>
		subCode<span id="subCodeUp">▲</span><span id="subCodeDown">▼</span>
		[상세보기]
		[환불승인]
		[처리]
	</div>
	<div>
		<div>-------------------------------------------------------------------------본사승인받은 [returnHeadCheck = Y]환불리스트-------------------------------------------------------------------------</div>
		<c:forEach var="returnsList" items="${returnsList}">
			<c:if test="${returnsList.returnHeadCheck == 'Y'}">	
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
					[Null]
					<c:if test="${returnsList.returnReDelivery == 'Y' && returnsList.headReturnsConfirm == 'N'}">
						<a href="/headReturnReDelivery?ordersCode=${returnsList.ordersCode}">[재배송]</a>
					</c:if>
					<c:if test="${returnsList.returnReDelivery == 'N' && returnsList.headReturnsConfirm == 'N'}">
						<a href="/">[환불처리]</a>
					</c:if>
					
					
				</div>
			</c:if>	
		</c:forEach>
		<div>-------------------------------------------------------------------------승인대기중인 [returnHeadCheck = N]환불리스트-------------------------------------------------------------------------</div>
		<c:forEach var="returnsList" items="${returnsList}">
			<c:if test="${returnsList.returnHeadCheck == 'N'}">	
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
					<a href="/approvalReturns?returnCode=${returnsList.returnCode}">[환불승인]</a>
					[Null]
				</div>
			</c:if>	
		</c:forEach>
	</div>
	 </c:if>
</body>
</html>