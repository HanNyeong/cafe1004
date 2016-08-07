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
	
	$(document).ready(function(){
		
		/* 오름차/내림차순 정렬 설정 */
		$('#claimCodeUp').click(function(){
			
			$('#criteria').attr('value','claim_code');
			$('#upDown').attr('value','DESC');
			$('#claimList').submit();
		});
		$('#claimCodeDown').click(function(){
			
			$('#criteria').attr('value','claim_code');
			$('#upDown').attr('value','ASC');
			$('#claimList').submit();
		});
		
		
		$('#claimTypeUp').click(function(){
			
			$('#criteria').attr('value','claim_type');
			$('#upDown').attr('value','DESC');
			$('#claimList').submit();
		});
		$('#claimTypeDown').click(function(){
			
			$('#criteria').attr('value','claim_type');
			$('#upDown').attr('value','ASC');
			$('#claimList').submit();
		});
		
		
		$('#claimAskDateUp').click(function(){
			
			$('#criteria').attr('value','claim_ask_date');
			$('#upDown').attr('value','DESC');
			$('#claimList').submit();
		});
		$('#claimAskDateDown').click(function(){
			
			$('#criteria').attr('value','claim_ask_date');
			$('#upDown').attr('value','ASC');
			$('#claimList').submit();
		});
		
		
		$('#claimAnswerDateUp').click(function(){
			
			$('#criteria').attr('value','claim_answer_date');
			$('#upDown').attr('value','DESC');
			$('#claimList').submit();
		});
		$('#claimAnswerDateDown').click(function(){
			
			$('#criteria').attr('value','claim_answer_date');
			$('#upDown').attr('value','ASC');
			$('#claimList').submit();
		});
		
		
		$('#subCodeUp').click(function(){
			
			$('#criteria').attr('value','sub_code');
			$('#upDown').attr('value','DESC');
			$('#claimList').submit();
		});
		$('#subCodeDown').click(function(){
			
			$('#criteria').attr('value','sub_code');
			$('#upDown').attr('value','ASC');
			$('#claimList').submit();
		});
		
		$('#customerNameUp').click(function(){
			
			$('#criteria').attr('value','customer_name');
			$('#upDown').attr('value','DESC');
			$('#claimList').submit();
		});
		$('#customerNameDown').click(function(){
			
			$('#criteria').attr('value','customer_name');
			$('#upDown').attr('value','ASC');
			$('#claimList').submit();
		});
		
		$('#customerPhoneUp').click(function(){
			
			$('#criteria').attr('value','customer_phone');
			$('#upDown').attr('value','DESC');
			$('#claimList').submit();
		});
		$('#customerPhoneDown').click(function(){
			
			$('#criteria').attr('value','customer_phone');
			$('#upDown').attr('value','ASC');
			$('#claimList').submit();
		});
		
		$('#claimStatusUp').click(function(){
			
			$('#criteria').attr('value','claim_status');
			$('#upDown').attr('value','DESC');
			$('#claimList').submit();
		});
		$('#claimStatusDown').click(function(){
			
			$('#criteria').attr('value','claim_status');
			$('#upDown').attr('value','ASC');
			$('#claimList').submit();
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
				<input type="hidden" name="criteria" id="criteria" value=""/>
				<input type="hidden" name="upDown" id="upDown" value=""/>
				<input type="hidden" name="customerName" value="${claim.customerName}"/>
				<input type="hidden" name="customerPhone" value="${claim.customerPhone}"/>
				
				
				등록 날짜: 
				<input type="date" name="regitDateStart" value="${claimSearch.regitDateStart}"/> ~
				<input type="date" name="regitDateEnd" value="${claimSearch.regitDateEnd}"/> 
				<br/><br/>
				<select name="searchKey" required="required">
					<option value="">::선택::</option>
					<option value="claim_code" <c:if test="${claimSearch.searchKey eq 'claim_code'}">selected="selected"</c:if>>claim_code</option>
					<option value="claim_type" <c:if test="${claimSearch.searchKey eq 'claim_type'}">selected="selected"</c:if>>claim_type</option>
					<option value="sub_code" <c:if test="${claimSearch.searchKey eq 'sub_code'}">selected="selected"</c:if>>sub_code</option>
					<option value="customer_name" <c:if test="${claimSearch.searchKey eq 'customer_name'}">selected="selected"</c:if>>customer_name</option>
					<option value="customer_phone" <c:if test="${claimSearch.searchKey eq 'customer_phone'}">selected="selected"</c:if>>customer_phone</option>
				</select>
				<input type="text" name="searchClaim" value="${claimSearch.searchClaim}"/>
				<button class="btn btn-default">검색</button>
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
<div class="row tablediv">
	<div class="col-sm-2">
	</div>		
		<c:if test="${!empty claimList}">
			<c:forEach var="claimList" items="${claimList}">
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
			</c:forEach>
		</c:if>
	<div class="col-sm-2">
	</div>
</div>

<jsp:include page="/WEB-INF/module/footer.jsp"/>	
</body>
</html>