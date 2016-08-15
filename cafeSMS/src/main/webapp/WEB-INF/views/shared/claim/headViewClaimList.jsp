<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>headViewClaimList</title>
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
		<h1>= 본사 고객클래임리스트 =</h1>
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<div class="row">
	<div class="col-sm-2">
	</div>		
	<div class="col-sm-8">
	<!-- 상품 검색 -->
		<form name="claimList" id="claimList" action="/headViewClaimList" method="post">
			<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
			<input type="hidden" name="criteria" id="criteria" value=""/>
			<input type="hidden" name="upDown" id="upDown" value=""/>
			
			등록 날짜: 
			<input type="date" name="regitDateStart" value="${claimSearch.regitDateStart}"/> ~
			<input type="date" name="regitDateEnd" value="${claimSearch.regitDateEnd}"/> 
			<br/><br/>
			<select name="searchKey" required="required" valChek="검색 종류를 입력해주세요">
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
	</div>	
	<div class="col-sm-2">
	</div>
</div>
	
<div class="row">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-8">		
		<h3>● 답변 완료 ●</h3>
	</div>
	<div class="col-sm-2">
	</div>
</div>
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>
				<div class="col-sm-1 th">접수코드<span id="claimCodeUp">▲</span><span id="claimCodeDown">▼</span></div>
				<div class="col-sm-1 th">클래임 종류<span id="claimTypeUp">▲</span><span id="claimTypeDown">▼</span></div>
				<div class="col-sm-1 th">접수 날짜<span id="claimAskDateUp">▲</span><span id="claimAskDateDown">▼</span></div>
				<div class="col-sm-1 th">가맹 코드<span id="subCodeUp">▲</span><span id="subCodeDown">▼</span></div>
				<div class="col-sm-1 th">고객 이름<span id="customerNameUp">▲</span><span id="customerNameDown">▼</span></div>
				<div class="col-sm-1 th">고객 번호<span id="customerPhoneUp">▲</span><span id="customerPhoneDown">▼</span></div>
				<div class="col-sm-1 th">처리 상태<span id="claimStatusUp">▲</span><span id="claimStatusDown">▼</span></div>
				<div class="col-sm-1 th">비고	</div>	
			<div class="col-sm-2">
			</div>
		</div>
		<c:forEach var="claimList" items="${claimList}">
			<c:if test="${claimList.claimStatus == 'Y'}">
				<div class="row tablediv">
					<div class="col-sm-2">
					</div>
					<div class="col-sm-1">${claimList.claimCode}</div>
					<div class="col-sm-1">${claimList.claimType}</div>
					<div class="col-sm-1">${claimList.claimAskDate}</div>
					<div class="col-sm-1">${claimList.subCode}</div>
					<div class="col-sm-1">${claimList.customerName}</div>
					<div class="col-sm-1">${claimList.customerPhone}</div>
					<div class="col-sm-1">${claimList.claimStatus}</div>
					<div class="col-sm-1">
						<a href="/viewClaimContent?claimCode=${claimList.claimCode}">[상세보기]</a><br/>
						<a href="/headAnswerClaimForm?claimCode=${claimList.claimCode}">[수정하기]</a>
					</div>
					<div class="col-sm-2">
					</div>
				</div>
			</c:if>
		</c:forEach>
<div class="row">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-8">		
		<h3>● 답변 예정 ●</h3>
	</div>
	<div class="col-sm-2">
	</div>
</div>
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>
				<div class="col-sm-1 th">접수코드<span id="claimCodeUp">▲</span><span id="claimCodeDown">▼</span></div>
				<div class="col-sm-1 th">클래임 종류<span id="claimTypeUp">▲</span><span id="claimTypeDown">▼</span></div>
				<div class="col-sm-1 th">접수 날짜<span id="claimAskDateUp">▲</span><span id="claimAskDateDown">▼</span></div>
				<div class="col-sm-1 th">가맹 코드<span id="subCodeUp">▲</span><span id="subCodeDown">▼</span></div>
				<div class="col-sm-1 th">고객 이름<span id="customerNameUp">▲</span><span id="customerNameDown">▼</span></div>
				<div class="col-sm-1 th">고객 번호<span id="customerPhoneUp">▲</span><span id="customerPhoneDown">▼</span></div>
				<div class="col-sm-1 th">처리 상태<span id="claimStatusUp">▲</span><span id="claimStatusDown">▼</span></div>
				<div class="col-sm-1 th">비고	</div>	
			<div class="col-sm-2">
			</div>
		</div>
		<c:forEach var="claimList" items="${claimList}">
			<c:if test="${claimList.claimStatus == 'N'}">
			<div class="row tablediv">
					<div class="col-sm-2">
					</div>
					<div class="col-sm-1">${claimList.claimCode}</div>
					<div class="col-sm-1">${claimList.claimType}</div>
					<div class="col-sm-1">${claimList.claimAskDate}</div>
					<div class="col-sm-1">${claimList.subCode}</div>
					<div class="col-sm-1">${claimList.customerName}</div>
					<div class="col-sm-1">${claimList.customerPhone}</div>
					<div class="col-sm-1">${claimList.claimStatus}</div>
					<div class="col-sm-1">
						<a href="/viewClaimContent?claimCode=${claimList.claimCode}">[상세보기]</a><br/>
						<a href="/headAnswerClaimForm?claimCode=${claimList.claimCode}">[답변하기]</a>
					</div>
					<div class="col-sm-2">
					</div>
				</div>
			</c:if>
		</c:forEach>
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>