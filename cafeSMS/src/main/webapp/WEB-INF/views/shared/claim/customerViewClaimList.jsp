<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
var list = function(upDown,criteria){
	$('#upDown').attr('value',upDown);
	$('#criteria').attr('value',criteria);
	$('#subSellList').submit();	
}



$(document).ready(function(){
	var columnList = ['sub_sell_code','inte_code','sub_sell_group','sub_sell_date','sub_sell_practical_selling_price','total_account_group','sub_sell_final','sub_sell_final_date','pay_method','sub_code','event_code','sub_staff_code','sub_sell_final_staff','sub_sell_cost']
	

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
		$('#subSellList').submit();
	});
	$('#searchBtn').click(function(){
		if($('#searchSubStaff').val() == ""){
			console.log("검색어입력하세요");
		}else{
			$('#subSellList').submit();
		}
	});
	
	
	//selectYN
	$('#selectYN').on('change',function(){
		if($('#selectYN').val() == ''){
			$('#YN').val('');
			$('#subSellList').submit();
		}else if($('#selectYN').val() == 'Y'){
			$('#YN').val('Y');
			$('#subSellList').submit();
		}else if($('#selectYN').val() == 'N'){
			$('#YN').val('N');
			$('#subSellList').submit();
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
	<div class="col-sm-8 cIfForm">
		<h1>클래임 리스트 페이지입니다.</h1>
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
				<input type="hidden" id="upDown" name="upDown" value="${search.upDown}" />
				<input type="hidden" id="criteria" name="criteria" value="${search.criteria}"/>
				<input type="hidden" name="customerName" value="${claim.customerName}"/>
				<input type="hidden" name="customerPhone" value="${claim.customerPhone}"/>
				<input type="hidden" id="viewMore" name="viewMore" value="${search.viewMore}"/>
				<input type="hidden" id="YN"  name="YN" value="${YN}"/>
				
				등록 날짜: 
				<input type="date" name="regitDateStart" value="${search.regitDateStart}"/> ~
				<input type="date" name="regitDateEnd" value="${search.regitDateEnd}"/> 
				<br/><br/>
		
				<select name="searchKey" required="required">
					<option value="">::선택::</option>
					<option value="claim_code" <c:if test="${claimSearch.searchKey eq 'claim_code'}">selected="selected"</c:if>>claim_code</option>
					<option value="claim_type" <c:if test="${claimSearch.searchKey eq 'claim_type'}">selected="selected"</c:if>>claim_type</option>
					<option value="sub_code" <c:if test="${claimSearch.searchKey eq 'sub_code'}">selected="selected"</c:if>>sub_code</option>
					<option value="customer_name" <c:if test="${claimSearch.searchKey eq 'customer_name'}">selected="selected"</c:if>>customer_name</option>
					<option value="customer_phone" <c:if test="${claimSearch.searchKey eq 'customer_phone'}">selected="selected"</c:if>>customer_phone</option>
				</select>
				<input type="text" id="search" name="search" value="${search.search}"/>
				<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
				<input type="button" class="btn btn-default"  value="전체보기"/></a>
				
				분류 : 
				<select id="selectYN" required="required">
					<option value="" <c:if test="${YN eq ''}">selected="selected"</c:if>>::선택::</option>
					<option value="Y" <c:if test="${YN eq 'Y'}">selected="selected"</c:if>>마감Y</option>
					<option value="N" <c:if test="${YN eq 'N'}">selected="selected"</c:if>>마감N</option>
				</select>
			
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
				불만접수코드<span id="claimCodeUp">▲</span><span id="claimCodeDown">▼</span>
			</div>
			<div class="col-sm-1 th">
				불만 종류<span id="claimTypeUp">▲</span><span id="claimTypeDown">▼</span>
			</div>
			<div class="col-sm-1 th">
				접수 날짜<span id="claimAskDateUp">▲</span><span id="claimAskDateDown">▼</span>
			</div>
			<div class="col-sm-1 th">
				답변 일자<span id="claimAnswerDateUp">▲</span><span id="claimAnswerDateDown">▼</span>
			</div>
			<div class="col-sm-1 th">
				가맹 코드<span id="subCodeUp">▲</span><span id="subCodeDown">▼</span>
			</div>
			<div class="col-sm-1 th">
				고객 이름<span id="customerNameUp">▲</span><span id="customerNameDown">▼</span>
			</div>
			<div class="col-sm-1 th">
				고객 번호<span id="customerPhoneUp">▲</span><span id="customerPhoneDown">▼</span>
			</div>
			<div class="col-sm-1 th">
				처리 상태<span id="claimStatusUp">▲</span><span id="claimStatusDown">▼</span>
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