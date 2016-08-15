<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>customerViewClaimList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>

$(document).ready(function(){
	var columnList = ['claim_code','claim_type','claim_ask_date','claim_answer_date','sub_code','customer_name','customer_phone','claim_status']
	$('.up').each(function(index,item){
		$(item).click(function(){
			list('ASC',columnList[index],$("#claimList"));
		});
	});
	$('.down').each(function(index,item){
		$(item).click(function(){
			list('DESC',columnList[index],$("#claimList"));
		});
	});
	// 더보기
	$('#viewMoreBtn').click(function(){
		var viewMore = $('#viewMore').val();
		$('#viewMore').val(viewMore*1+25);
		$('#contractList').submit();
	});
	
	//폼 제출 유효성
	 var check = undefinedEvent($('#searchBtn'),$('#claimList'),$('#valChekMsg'));
  });

</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-2">
	</div>		
	<div class="col-sm-8 cIfForm">
		<h1>= 클래임 리스트 페이지 =</h1>
		<br/>	
		<c:if test="${empty claimList}">
			<p>해당하는 클래임이 존재하지 않습니다. 이름 또는 전화번호를 정확하게 입력해 주세요.</p>
			<a href="/">홈화면으로 이동하기</a>
		</c:if>		
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<div class="row">
	<div class="col-sm-2">
	</div>		
	<div class="col-sm-8">
		<c:if test="${!empty claimList}">
			<!-- 상품 검색 -->
			<form name="claimList" id="claimList" action="/customerViewClaimList" method="post">
				<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
				<input type="hidden" name="criteria" id="criteria" value=""/>
				<input type="hidden" name="upDown" id="upDown" value=""/>
				<input type="hidden" name="customerName" value="${claim.customerName}"/>
				<input type="hidden" name="customerPhone" value="${claim.customerPhone}"/>
					
				등록 날짜: 
				<input type="date" name="regitDateStart" value="${claimSearch.regitDateStart}"/> ~
				<input type="date" name="regitDateEnd" value="${claimSearch.regitDateEnd}"/> 
				<br/><br/>
		
				<select name="searchKey" required="required" valChek="검색 종류를 선택해주세요">
					<option value="">::선택::</option> 
					<option value="claim_code" <c:if test="${claimSearch.searchKey eq 'claim_code'}">selected="selected"</c:if>>클래임접수코드</option>
					<option value="claim_type" <c:if test="${claimSearch.searchKey eq 'claim_type'}">selected="selected"</c:if>>클래임 종류</option>
					<option value="sub_code" <c:if test="${claimSearch.searchKey eq 'sub_code'}">selected="selected"</c:if>>가맹 코드</option>
					<option value="customer_name" <c:if test="${claimSearch.searchKey eq 'customer_name'}">selected="selected"</c:if>>고객 이름</option>
					<option value="customer_phone" <c:if test="${claimSearch.searchKey eq 'customer_phone'}">selected="selected"</c:if>>고객 번호</option>
				</select>
				<input type="text" name="searchClaim" value="${claimSearch.searchClaim}" valChek="검색어를 입력해주세요"/>
				<button id="searchBtn" class="btn btn-default" >검색</button><span id="valChekMsg"></span>
			
			
			</form>
		</c:if>
	</div>	
	<div class="col-sm-2">
	</div>
</div>
<div class="row tablediv">
	<div class="col-sm-2">
	</div>	
		<c:if test="${!empty claimList}">
			<div class="col-sm-1 th">
				접수코드<span class="up">▲</span><span class="down">▼</span>
			</div>
			<div class="col-sm-1 th">	
				클래임 종류<span class="up">▲</span><span class="down">▼</span>
			</div>
			<div class="col-sm-1 th">	
				접수 날짜<span class="up">▲</span><span class="down">▼</span>
			</div>
			<div class="col-sm-1 th">	
				답변 일자<span class="up">▲</span><span class="down">▼</span>
			</div>
			<div class="col-sm-1 th">
				가맹 코드<span id="subCodeUp">▲</span><span id="subCodeDown">▼</span>
			</div>
			<div class="col-sm-1 th">	
				고객 이름<span class="up">▲</span><span class="down">▼</span>
			</div>
			<div class="col-sm-1 th">	
				고객 번호<span class="up">▲</span><span class="down">▼</span>
			</div>
			<div class="col-sm-1 th">	
				처리 상태<span class="up">▲</span><span class="down">▼</span>
			</div>
		</c:if>
	<div class="col-sm-2">
	</div>
</div>	
<c:if test="${!empty claimList}">
	<c:forEach var="claimList" items="${claimList}">
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>		
				<div class="col-sm-1">${claimList.claimCode}</div>	
				<div class="col-sm-1">${claimList.claimType}</div>	
				<div class="col-sm-1">${claimList.claimAskDate}</div>	
				<div class="col-sm-1">${claimList.claimAnswerDate}</div>	
				<div class="col-sm-1">${claimList.subCode}</div>	
				<div class="col-sm-1">${claimList.customerName}</div>	
				<div class="col-sm-1">${claimList.customerPhone}</div>	
				<div class="col-sm-1">
					${claimList.claimStatus}
					<a href="/viewClaimContent?claimCode=${claimList.claimCode}&customerName=${claimList.customerName}">[상세보기]</a>
				</div>	
			<div class="col-sm-2">
			</div>
		</div>
	</c:forEach>
</c:if>

<jsp:include page="/WEB-INF/module/footer.jsp"/>	
</body>
</html>