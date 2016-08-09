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
var list = function(upDown,criteria){
	$('#upDown').attr('value',upDown);
	$('#criteria').attr('value',criteria);
	$('#subStockList').submit();	
}



$(document).ready(function(){
	var columnList = ['sub_stock_code','head_stock_in_date','sub_stock_in_date','sub_stock_out','orders_code','sub_code','head_item_code','specific_item_code','sub_staff_code']
	

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
	
	
	//selectYN
	$('#selectYN').on('change',function(){
		if($('#selectYN').val() == ''){
			$('#YN').val('');
			$('#subStockList').submit();
		}else if($('#selectYN').val() == 'Y'){
			$('#YN').val('Y');
			$('#subStockList').submit();
		}else if($('#selectYN').val() == 'N'){
			$('#YN').val('N');
			$('#subStockList').submit();
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
	<!-- 상품 검색 -->
		<form name="subStockList" id="subStockList" action="/subViewSubStockList" method="post">
			<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
			<input type="hidden" id="upDown" name="upDown" value="${search.upDown}" />
			<input type="hidden" id="criteria" name="criteria" value="${search.criteria}"/>
			<input type="hidden" id="viewMore" name="viewMore" value="${search.viewMore}"/>
			<input type="hidden" id="subCode" name="subCode" value="${subCode}"/>
			<input type="hidden" id="YN"  name="YN" value="${YN}"/>			
			등록 날짜: 
			<input type="date" name="regitDateStart" value="${search.regitDateStart}"/> ~
			<input type="date" name="regitDateEnd" value="${search.regitDateEnd}"/> 
			<br/><br/>
			<select name="searchKey" required="required">
				<option value="">::선택::</option>
				<option value="sub_stock_code" <c:if test="${search.searchKey eq 'sub_stock_code'}">selected="selected"</c:if>>sub_stock_code</option>
				<option value="orders_code" <c:if test="${search.searchKey eq 'orders_code'}">selected="selected"</c:if>>orders_code</option>
				<option value="head_item_code" <c:if test="${search.searchKey eq 'head_item_code'}">selected="selected"</c:if>>head_item_code</option>
				<option value="specific_item_code" <c:if test="${search.searchKey eq 'specific_item_code'}">selected="selected"</c:if>>specific_item_code</option>
				<option value="sub_staff_code" <c:if test="${search.searchKey eq 'sub_staff_code'}">selected="selected"</c:if>>sub_staff_code</option>
			</select>
			<input type="text" id="search" name="search" value="${search.search}"/>
			<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
			<a href="/subViewSubStockList?subCode=${subCode}"><input type="button" class="btn btn-default"  value="전체보기"/></a>
		
	
			분류 : 
			<select id="selectYN" required="required">
				<option value="" <c:if test="${YN eq ''}">selected="selected"</c:if>>::선택::</option>
				<option value="Y" <c:if test="${YN eq 'Y'}">selected="selected"</c:if>>입고후</option>
				<option value="N" <c:if test="${YN eq 'N'}">selected="selected"</c:if>>입고전</option>
			</select>

	
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
		subStockList
	<div>
		가맹재고코드<span class="up">▲</span><span class="down">▼</span>
		본사가맹입고날짜<span class="up">▲</span><span class="down">▼</span>
		가맹확인입고날짜<span class="up">▲</span><span class="down">▼</span>
		판매여부<span class="up">▲</span><span class="down">▼</span>
		주문코드<span class="up">▲</span><span class="down">▼</span>
		가맹대표코드<span class="up">▲</span><span class="down">▼</span>
		본사상품코드<span class="up">▲</span><span class="down">▼</span>
		개별상품코드<span class="up">▲</span><span class="down">▼</span>
		가맹확인담당직원<span class="up">▲</span><span class="down">▼</span>
		[입고확인]
	</div>	
	<div>
		<c:forEach var="subStockList" items="${subStockList}">
			<c:if test="${YN eq '' || YN eq null}">	
				<div>
					${subStockList.subStockCode}
					${subStockList.headStockInDate}
					${subStockList.subStockInDate}
					${subStockList.subStockOut}
					${subStockList.ordersCode}
					${subStockList.subCode}
					${subStockList.headItemCode}
					${subStockList.specificItemCode}
					${subStockList.subStaffCode}
					<c:if test="${subStockList.subStockInDate == null}">
						<a href="/subWarehousing?subStockCode=${subStockList.subStockCode}&subCode=${subStockList.subCode}&ordersCode=${subStockList.ordersCode}">[입고]</a>
					</c:if>
					<c:if test="${subStockList.subStockInDate != null}">
						[Null]
					</c:if>
				</div>
			</c:if>
			<c:if test="${YN eq 'Y'}">	
				<c:if test="${subStockList.subStockInDate ne null}">
					<div>
						${subStockList.subStockCode}
						${subStockList.headStockInDate}
						${subStockList.subStockInDate}
						${subStockList.subStockOut}
						${subStockList.ordersCode}
						${subStockList.subCode}
						${subStockList.headItemCode}
						${subStockList.specificItemCode}
						${subStockList.subStaffCode}
						<c:if test="${subStockList.subStockInDate == null}">
							<a href="/subWarehousing?subStockCode=${subStockList.subStockCode}&subCode=${subStockList.subCode}&ordersCode=${subStockList.ordersCode}">[입고]</a>
						</c:if>
						<c:if test="${subStockList.subStockInDate != null}">
							[Null]
						</c:if>
					</div>
				</c:if>
			</c:if>
			<c:if test="${YN eq 'N'}">	
				<c:if test="${subStockList.subStockInDate eq null}">
					<div>
						${subStockList.subStockCode}
						${subStockList.headStockInDate}
						${subStockList.subStockInDate}
						${subStockList.subStockOut}
						${subStockList.ordersCode}
						${subStockList.subCode}
						${subStockList.headItemCode}
						${subStockList.specificItemCode}
						${subStockList.subStaffCode}
						<c:if test="${subStockList.subStockInDate == null}">
							<a href="/subWarehousing?subStockCode=${subStockList.subStockCode}&subCode=${subStockList.subCode}&ordersCode=${subStockList.ordersCode}">[입고]</a>
						</c:if>
						<c:if test="${subStockList.subStockInDate != null}">
							[Null]
						</c:if>
					</div>
				</c:if>
			</c:if>
			
		</c:forEach>
	</div>
	<input type="button" class="btn btn-default" id="viewMoreBtn" value="더보기"/>

<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>