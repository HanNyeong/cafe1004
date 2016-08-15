<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subViewReturnsList</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="resources/function/upDownCheck.js"></script>
<script>

$(document).ready(function(){
	var columnList = ['return_code','return_price','return_report_date','return_head_check_date','return_re_delivery','orders_code','head_returns_confirm']
	

	$('.up').each(function(index,item){
		$(item).click(function(){
			list('ASC',columnList[index],$("#returnsList"));
		});
	});
	$('.down').each(function(index,item){
		$(item).click(function(){
			list('DESC',columnList[index],$("#returnsList"));
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
	//폼 제출 유효성
	 var check = undefinedEvent($('#searchBtn'),$('#returnsList'),$('#valChekMsg'));
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
		<c:if test="${!empty returnsList}">
		<!-- 상품 검색 -->
			<form name="returnsList" id="returnsList" action="/subViewReturnsList" method="post">
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
				<select name="searchKey" required="required" valChek="검색 종류를 선택해주세요">
					<option value="">::선택::</option>
					<option value="return_code" <c:if test="${search.searchKey eq 'return_code'}">selected="selected"</c:if>>반품코드</option>
					<option value="orders_code" <c:if test="${search.searchKey eq 'orders_code'}">selected="selected"</c:if>>주문코드</option>
				</select>
				
				<input type="text" id="search" name="search" value="${search.search}" valChek="검색어를  입력해주세요"/>
				<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
				<a href="/subViewReturnsList?subCode=${subCode}"><input type="button" class="btn btn-default"  value="전체보기"/></a>
				<br/>
				<span id="valChekMsg"></span>	
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
		<h3>= ${subCode} 반품상품조회 =</h3>
	</div>	
	<div class="col-sm-5 clickBtn">		
		<h4>분류 : 
		<select id="selectYN" required="required">
			<option value="" <c:if test="${YN eq ''}">selected="selected"</c:if>>::선택::</option>
			<option value="Y" <c:if test="${YN eq 'Y'}">selected="selected"</c:if>>본사확인</option>
			<option value="N" <c:if test="${YN eq 'N'}">selected="selected"</c:if>>승인대기</option>
		</select>
		<a href="/subAddReturnsForm?subCode=${subCode}"><button class="btn btn-default">환불신청</button></a>
		</h4>
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<c:if test="${!empty returnsList}">
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
			재배송요청<span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">	
			주문코드<span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">	
			본사확인<span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">	
			비고		
		</div>	
		<div class="col-sm-2">
		</div>
	</div> 		
	<c:forEach var="returnsList" items="${returnsList}">
		
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-1">${returnsList.returnCode}</div>
			<div class="col-sm-1">${returnsList.returnPrice}</div>
			<div class="col-sm-1">${returnsList.returnReportDate}</div>
			<div class="col-sm-1">(${returnsList.returnHeadCheck})${returnsList.returnHeadCheckDate}</div>
			<div class="col-sm-1">${returnsList.returnReDelivery}</div>
			<div class="col-sm-1">${returnsList.ordersCode}</div>
			<div class="col-sm-1">${returnsList.headReturnsConfirm}</div>
			<div class="col-sm-1">
				<p><a href="/viewReturnsContent?returnCode=${returnsList.returnCode}">[상세보기]</a></p>
				
				<c:if test="${returnsList.returnHeadCheck == 'N'}">
				<a href="/subCancelReturns?returnCode=${returnsList.returnCode}&ordersCode=${returnsList.ordersCode}&subCode=${returnsList.subCode}">[환불취소]</a>		
				</c:if>
				<c:if test="${returnsList.headReturnsConfirm == 'Y'}">
					[환불완료]
				</c:if>
			</div>
			<div class="col-sm-2">
			</div>
		</div>	
	
	</c:forEach>
</c:if>
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