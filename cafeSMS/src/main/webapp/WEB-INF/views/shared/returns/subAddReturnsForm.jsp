<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subAddReturnsForm</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
var list = function(upDown,criteria){
	$('#upDown').attr('value',upDown);
	$('#criteria').attr('value',criteria);
	$('#subStockList').submit();	
}



$(document).ready(function(){
	var columnList = ['sub_stock_code','sub_stock_in_date','sub_stock_out','orders_code','head_item_code','specific_item_code','sub_staff_code']
	

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
		$('#subStockList').submit();
	});
	$('#searchBtn').click(function(){
		if($('#search').val() == ""){
			console.log("검색어입력하세요");
		}else{
			$('#subStockList').submit();
		}
	});
	//폼 제출 유효성
	 var check = undefinedEvent($('#searchBtn'),$('#subStockList'),$('#valChekMsg'));
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
		<form name="subStockList" id="subStockList" action="/subAddReturnsForm" method="post">
			<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
				<input type="hidden" id="upDown" name="upDown" value="${search.upDown}" />
				<input type="hidden" id="criteria" name="criteria" value="${search.criteria}"/>
				<input type="hidden" id="viewMore" name="viewMore" value="${search.viewMore}"/>
				<input type="hidden" id="subCode" name="subCode" value="${subCode}"/>
					
							
			등록 날짜: 
			<input type="date" name="regitDateStart" value="${search.regitDateStart}"/> ~
			<input type="date" name="regitDateEnd" value="${search.regitDateEnd}"/> 
			<br/><br/>
			<select name="searchKey" required="required" valChek="검색 종류를 선택해주세요">
				<option value="">::선택::</option>
				<option value="sub_stock_code" <c:if test="${search.searchKey eq 'sub_stock_code'}">selected="selected"</c:if>>재고코드</option>
				<option value="orders_code" <c:if test="${search.searchKey eq 'orders_code'}">selected="selected"</c:if>>주문코드</option>
				<option value="head_item_code" <c:if test="${search.searchKey eq 'head_item_code'}">selected="selected"</c:if>>아이템코드</option>
				<option value="specific_item_code" <c:if test="${search.searchKey eq 'specific_item_code'}">selected="selected"</c:if>>개별상품코드</option>
				<option value="sub_staff_code" <c:if test="${search.searchKey eq 'sub_staff_code'}">selected="selected"</c:if>>가맹직원코드</option>
			</select>
			<input type="text" id="search" name="search" value="${search.search}" valChek="검색어를  입력해주세요"/>
			<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
			<a href="/subAddReturnsForm?subCode=${subCode}"><input type="button" class="btn btn-default"  value="전체보기"/></a><br/>
			<span id="valChekMsg"></span>			
			<br/>
		</form>
		</div>
	<div class="col-sm-2">
	</div>
</div>
<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-8">
		<h3>= 가맹 환불 가능 리스트 =</h3>	
		<br/>
		<p>subStockOut[출고]가 N이고  subStockInDate[가맹이확인하고 입고한날짜]가 notNull인것만 환불 신청가능</p>	
	</div>
	<div class="col-sm-2">
	</div>
</div>	
<br/>
<br/>
<div class="row tablediv">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-1 th">
		재고코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		가맹입고날짜<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		판매여부<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		주문코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		본사상품코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		개별상품코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		가맹확인담당<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		[환불신청]
	</div>
	<div class="col-sm-2">
	</div>
</div>

<c:forEach var="subStockList" items="${subStockList}">
	<div class="row tablediv">
		<div class="col-sm-2">
		</div>	
		<div class="col-sm-1">${subStockList.subStockCode}</div>		
		<div class="col-sm-1">${subStockList.subStockInDate}</div>
		<div class="col-sm-1">${subStockList.subStockOut}</div>
		<div class="col-sm-1">${subStockList.ordersCode}</div>	
		<div class="col-sm-1">${subStockList.headItemCode}</div>
		<div class="col-sm-1">${subStockList.specificItemCode}</div>
		<div class="col-sm-1">${subStockList.subStaffCode}</div>
		<div class="col-sm-1">
			<a href="/subAddReturnsForm2?subStockCode=${subStockList.subStockCode}">[환불신청]</a>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
</c:forEach>
<input type="button" class="btn btn-default" id="viewMoreBtn" value="더보기"/>
<jsp:include page="/WEB-INF/module/footer.jsp"/>	
</body>
</html>