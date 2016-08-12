<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/function/upDownCheck.js"></script>
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
		<form name="subStockList" id="subStockList" action="/subViewSubStockOutList" method="post">
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
			<a href="/subViewSubStockOutList?subCode=${subCode}"><input type="button" class="btn btn-default"  value="전체보기"/></a>
		
		</form>
	
		
	</div>
	<div>
		
		<a href="/subViewSubStockList?subCode=${subCode}">[재고리스트]</a>
	
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
		<h3>= 가맹 재고 전체 리스트 =</h3>
	</div>
	<div class="col-sm-5 clickBtn">
			<h4>
			분류 : 
			<select id="selectYN" required="required">
				<option value="" <c:if test="${YN eq ''}">selected="selected"</c:if>>::선택::</option>
				<option value="Y" <c:if test="${YN eq 'Y'}">selected="selected"</c:if>>비가용재고</option>
				<option value="N" <c:if test="${YN eq 'N'}">selected="selected"</c:if>>가용재고</option>
			</select>
			<input type="button" class="btn btn-default" id="subWarehousingBtn" value="입고"/>
			</h4>
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<br/>
<div class="row tablediv">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-1 th">
		재고코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">		
		확인입고날<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">		
		판매여부<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">		
		주문코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		본사상품C<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">		
		개별상품C<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">		
		확인직원<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">		
		[출하여부]
	</div>	
	<div class="col-sm-2">
	</div>
</div> 	
<c:forEach var="subStockList" items="${subStockList}">
	<c:if test="${YN eq '' || YN eq null}">	
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-1">
					${subStockList.subStockCode}					
			</div>
			<div class="col-sm-1">		
					${subStockList.subStockInDate}
			</div>
			<div class="col-sm-1">		
					${subStockList.subStockOut}
			</div>
			<div class="col-sm-1">		
					${subStockList.ordersCode}
			</div>
			<div class="col-sm-1">		
					${subStockList.headItemCode}
			</div>
			<div class="col-sm-1">		
					${subStockList.specificItemCode}
			</div>
			<div class="col-sm-1">		
					${subStockList.subStaffCode}
			</div>
			<div class="col-sm-1">		
					<c:if test="${subStockList.subStockOut == 'N' && subStockList.subStockInDate ne null}">
						<a href="/subStockOutY?subCode=${subStockList.subCode}&subStockCode=${subStockList.subStockCode}">[출하]</a>
					</c:if>
					<c:if test="${subStockList.subStockOut == 'Y'&& subStockList.subStockInDate ne null}">
						[출하완료]
					</c:if>
					
			</div>
			<div class="col-sm-2">
			</div>
		</div>
	</c:if>
<c:if test="${subStockList.subStockOut eq YN}">	
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-1">
					${subStockList.subStockCode}					
			</div>
			<div class="col-sm-1">		
					${subStockList.subStockInDate}
			</div>
			<div class="col-sm-1">		
					${subStockList.subStockOut}
			</div>
			<div class="col-sm-1">		
					${subStockList.ordersCode}
			</div>
			<div class="col-sm-1">		
					${subStockList.headItemCode}
			</div>
			<div class="col-sm-1">		
					${subStockList.specificItemCode}
			</div>
			<div class="col-sm-1">		
					${subStockList.subStaffCode}
			</div>
			<div class="col-sm-1">		
				<c:if test="${subStockList.subStockOut == 'N' && subStockList.subStockInDate ne null}">
					<a href="/subStockOutY?subCode=${subStockList.subCode}&subStockCode=${subStockList.subStockCode}">[출하]</a>
				</c:if>
				<c:if test="${subStockList.subStockOut == 'Y'&& subStockList.subStockInDate ne null}">
					[출하완료]
				</c:if>
				
			</div>
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
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>