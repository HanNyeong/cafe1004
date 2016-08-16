<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subViewSubStockList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
	var columnList = ['sub_stock_code','head_stock_in_date','sub_stock_in_date','sub_stock_out','orders_code','sub_code','head_item_code','specific_item_code','sub_staff_code']
	

	//컬럼별조회 위
	$('.up').each(function(index,item){
		$(item).click(function(){
			list('ASC',columnList[index],$('#subStockList'));
		});
	});
	//컬럼별조회 아래
	$('.down').each(function(index,item){
		$(item).click(function(){
			list('DESC',columnList[index],$('#subStockList'));
		});
	});
	// 더보기
	$('#viewMoreBtn').click(function(){
		var viewMore = $('#viewMore').val();
		$('#viewMore').val(viewMore*1+25);
		$('#subStockList').submit();
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
	
	// 주문 체크 되어 있는 값 추출
	$('#subWarehousingBtn').click(function(){
		if($('.checking:checked').size()<1){
	        alert("1개 이상 체크해주세요");
	        console.log("subSellFinal");
	    }else{
	    	$('.checking').each(function(index,item){
	    		if(!$(this).is(":checked")){
	    			console.log("체크안됨");
					}else if($(this).is(":checked")){
	    									
					$("input[class=subCode]:eq(" + index + ")").prop('name','subCode');
					$("input[class=subStockCode]:eq(" + index + ")").prop('name','subStockCode');
					$("input[class=ordersCode]:eq(" + index + ")").prop('name','ordersCode');
					$("input[class=specificItemCode]:eq(" + index + ")").prop('name','specificItemCode');
					console.log("체크됨");

					}else{
	    				console.log("안됨")
	    			}
	    	});
				
				$('#subWarehousing').submit();
	    }
	});
	//폼 제출 유효성
	undefinedEvent($('#searchBtn'),$('#subStockList'),$('#valChekMsg'));
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
			<input type="date" id="regitDateStart" name="regitDateStart" value="${search.regitDateStart}"/> ~
			<input type="date" id="regitDateEnd" name="regitDateEnd" value="${search.regitDateEnd}"/> 
			<br/><br/>
			<select name="searchKey" required="required" valChek="검색 종류를 선택해주세요">
				<option value="">::선택::</option>
				<option value="sub_stock_code" <c:if test="${search.searchKey eq 'sub_stock_code'}">selected="selected"</c:if>>재고코드</option>
				<option value="orders_code" <c:if test="${search.searchKey eq 'orders_code'}">selected="selected"</c:if>>주문코드</option>
				<option value="head_item_code" <c:if test="${search.searchKey eq 'head_item_code'}">selected="selected"</c:if>>본사상품코드</option>
				<option value="specific_item_code" <c:if test="${search.searchKey eq 'specific_item_code'}">selected="selected"</c:if>>개별상품코드</option>
				<option value="sub_staff_code" <c:if test="${search.searchKey eq 'sub_staff_code'}">selected="selected"</c:if>>본사확인직원</option>
			</select>
			<input type="text" id="search" name="search" value="${search.search}" valChek="검색어를  입력해주세요"/>
			<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
			<a href="/subViewSubStockList?subCode=${subCode}"><input type="button" class="btn btn-default"  value="전체보기"/></a>
			<br/>
			<span id="valChekMsg"></span>	
		</form>
	
		
	</div>
	<div>
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
		<h2>= 가맹 재고 관리 =</h2>
	</div>
	<div class="col-sm-5 clickBtn">
			<h4><a href="/subViewSubStockOutList?subCode=${subCode}">[출하가능리스트]</a></h4>
			<h4>
			분류 : 
			<select id="selectYN" required="required">
				<option value="" <c:if test="${YN eq ''}">selected="selected"</c:if>>::선택::</option>
				<option value="Y" <c:if test="${YN eq 'Y'}">selected="selected"</c:if>>입고후</option>
				<option value="N" <c:if test="${YN eq 'N'}">selected="selected"</c:if>>입고전</option>
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
		입고/출하<input type="checkbox" id="selectAll" class="selectAll" name="selectAll" onclick="selectAll(this)" value="전체 선택">
	</div>	
	<div class="col-sm-2">
	</div>
</div> 	
<form action="/subWarehousing" method="POST" id="subWarehousing">
<c:forEach var="subStockList" items="${subStockList}">
	
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
				
				<c:if test="${subStockList.subStockInDate eq null}">
					<input type="checkbox" class="checking" name="checking">
					<input type="hidden" class="subCode" name="" value="${subStockList.subCode}">
					<input type="hidden" class="subStockCode" name="" value="${subStockList.subStockCode}">
					<input type="hidden" class="ordersCode" name="" value="${subStockList.ordersCode}">
					<input type="hidden" class="specificItemCode" name="" value="${subStockList.specificItemCode}">
				</c:if>
				
			</div>
			<div class="col-sm-2">
			</div>
		</div>
	
	
</c:forEach>
</form>
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