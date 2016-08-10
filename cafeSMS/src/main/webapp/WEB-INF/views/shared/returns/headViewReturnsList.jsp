<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>headViewReturnsList</title>
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
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-8">
		<c:if test="${empty returnsList}">
			해당 내역이 존재하지 않습니다.
		</c:if>
	</div>
	<div class="col-sm-2">
	</div>
</div>
<c:if test="${!empty returnsList}">
<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-8">
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
				<option value="return_code" <c:if test="${search.searchKey eq 'return_code'}">selected="selected"</c:if>>반품코드</option>
				<option value="orders_code" <c:if test="${search.searchKey eq 'orders_code'}">selected="selected"</c:if>>주문코드</option>
				<option value="specific_item_code" <c:if test="${search.searchKey eq 'specific_item_code'}">selected="selected"</c:if>>개별상품코드</option>
				<option value="sub_code" <c:if test="${search.searchKey eq 'sub_code'}">selected="selected"</c:if>>가맹코드</option>
			</select>
		
			<input type="text" id="search" name="search" value="${search.search}"/>
			<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
			<a href="/headViewReturnsList"><input type="button" class="btn btn-default"  value="전체보기"/></a>			
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
	<div class="col-sm-4">
		<h3>= 본사 반품 상품 조회 =</h3>
	</div>
	<div class="col-sm-4 clickBtn">
		<h4>분류 : 
			<select id="selectYN" required="required">
				<option value="" <c:if test="${YN eq ''}">selected="selected"</c:if>>::선택::</option>
				<option value="Y" <c:if test="${YN eq 'Y'}">selected="selected"</c:if>>본사확인</option>
				<option value="N" <c:if test="${YN eq 'N'}">selected="selected"</c:if>>승인대기</option>
			</select>	
		</h4>
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<div class="row tablediv">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-1 th">
		반품코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		반품가격<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		가맹보고날짜<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		본사확인날짜<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		주문코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		개별상품코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		가맹코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		비고
	</div>
	
	<div class="col-sm-2">
	</div>
</div>
	<c:forEach var="returnsList" items="${returnsList}">
		<c:if test="${YN eq '' || YN eq null }">
			<div class="row tablediv">
				<div class="col-sm-2">
				</div>					
				<div class="col-sm-1">${returnsList.returnCode}</div>
				<div class="col-sm-1">${returnsList.returnPrice}</div>
				<div class="col-sm-1">${returnsList.returnReportDate}</div>
				<div class="col-sm-1">(${returnsList.returnHeadCheck})${returnsList.returnHeadCheckDate}</div>
				<div class="col-sm-1">${returnsList.ordersCode}</div>
				<div class="col-sm-1">${returnsList.specificItemCode}</div>
				<div class="col-sm-1">${returnsList.subCode}</div>
				<div class="col-sm-1">
					<a href="/viewReturnsContent?returnCode=${returnsList.returnCode}">[상세보기]</a><br/>
					<c:if test="${returnsList.returnHeadCheck == 'N'}">
						<a href="/approvalReturns?returnCode=${returnsList.returnCode}">[환불승인]</a>
						<br/>
					</c:if>	
					<c:if test="${returnsList.returnReDelivery == 'N' && returnsList.headReturnsConfirm == 'N'}">
						<a href="/">[환불]</a>
						<br/>
					</c:if>
					<c:if test="${returnsList.returnReDelivery == 'N' && returnsList.headReturnsConfirm == 'Y'}">
						[환불 처리]
						<br/>
					</c:if>
					<c:if test="${returnsList.returnReDelivery == 'Y' && returnsList.headReturnsConfirm == 'N'}">
						<a href="/headReturnReDelivery?ordersCode=${returnsList.ordersCode}">[재배송]</a>
						<br/>
					</c:if>
					<c:if test="${returnsList.returnReDelivery == 'Y' && returnsList.headReturnsConfirm == 'Y'}">
						[재배송 처리]
					</c:if>
				</div>
				<div class="col-sm-2">
				</div>
			</div>
		</c:if>
		
		<c:if test="${returnsList.returnHeadCheck == YN}">
				<div class="row tablediv">
				<div class="col-sm-2">
				</div>					
				<div class="col-sm-1">${returnsList.returnCode}</div>
				<div class="col-sm-1">${returnsList.returnPrice}</div>
				<div class="col-sm-1">${returnsList.returnReportDate}</div>
				<div class="col-sm-1">(${returnsList.returnHeadCheck})${returnsList.returnHeadCheckDate}</div>
				<div class="col-sm-1">${returnsList.ordersCode}</div>
				<div class="col-sm-1">${returnsList.specificItemCode}</div>
				<div class="col-sm-1">${returnsList.subCode}</div>
				<div class="col-sm-1">
					<a href="/viewReturnsContent?returnCode=${returnsList.returnCode}">[상세보기]</a><br/>
					<c:if test="${returnsList.returnHeadCheck == 'N'}">
						<a href="/approvalReturns?returnCode=${returnsList.returnCode}">[환불승인]</a>
						<br/>
					</c:if>	
					<c:if test="${returnsList.returnReDelivery == 'N' && returnsList.headReturnsConfirm == 'N'}">
						<a href="/">[환불]</a>
						<br/>
					</c:if>
					<c:if test="${returnsList.returnReDelivery == 'N' && returnsList.headReturnsConfirm == 'Y'}">
						[환불 처리]
						<br/>
					</c:if>
					<c:if test="${returnsList.returnReDelivery == 'Y' && returnsList.headReturnsConfirm == 'N'}">
						<a href="/headReturnReDelivery?ordersCode=${returnsList.ordersCode}">[재배송]</a>
						<br/>
					</c:if>
					<c:if test="${returnsList.returnReDelivery == 'Y' && returnsList.headReturnsConfirm == 'Y'}">
						[재배송 처리]
					</c:if>
				</div>
				<div class="col-sm-2">
				</div>
			</div>
		</c:if>
	</c:forEach>
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</c:if> 
</body>
</html>