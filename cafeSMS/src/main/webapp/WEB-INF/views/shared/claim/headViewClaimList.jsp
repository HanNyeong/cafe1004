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
<a href="/">home</a>
	<h1>본사에서 고객클래임리스트</h1>
	<!-- 상품 검색 -->
		<form name="claimList" id="claimList" action="/headViewClaimList" method="post">
			<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
			<input type="hidden" name="criteria" id="criteria" value=""/>
			<input type="hidden" name="upDown" id="upDown" value=""/>
			
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
			<button>검색</button>
		</form>
	<hr/>
	<div>
		claimCode<span id="claimCodeUp">▲</span><span id="claimCodeDown">▼</span>
		claimType<span id="claimTypeUp">▲</span><span id="claimTypeDown">▼</span>
		claimAskDate<span id="claimAskDateUp">▲</span><span id="claimAskDateDown">▼</span>
		claimAnswerDate<span id="claimAnswerDateUp">▲</span><span id="claimAnswerDateDown">▼</span>
		subCode<span id="subCodeUp">▲</span><span id="subCodeDown">▼</span>
		customerName<span id="customerNameUp">▲</span><span id="customerNameDown">▼</span>
		customerPhone<span id="customerPhoneUp">▲</span><span id="customerPhoneDown">▼</span>
		claimStatus<span id="claimStatusUp">▲</span><span id="claimStatusDown">▼</span>
		[상세보기]
		
	</div>
	<div>
	<p>--------------------------------------------------답변구간--------------------------------------------------</p>
	</div>
	<div>
		<c:forEach var="claimList" items="${claimList}">
			<c:if test="${claimList.claimStatus == 'Y'}">
				<div>
					${claimList.claimCode}
					${claimList.claimType}
					${claimList.claimAskDate}
					${claimList.claimAnswerDate}
					${claimList.subCode}
					${claimList.customerName}
					${claimList.customerPhone}
					${claimList.claimStatus}
					<a href="/viewClaimContent?claimCode=${claimList.claimCode}">[상세보기]</a>
					<a href="/headAnswerClaimForm?claimCode=${claimList.claimCode}">[수정하기]</a>
				</div>
			</c:if>
		</c:forEach>
		
		
	</div>
	<div>
	<p>--------------------------------------------------미답변구간--------------------------------------------------</p>
	</div>
	<div>
		
		<c:forEach var="claimList" items="${claimList}">
			<c:if test="${claimList.claimStatus == 'N'}">
			<div>
				${claimList.claimCode}
				${claimList.claimType}
				${claimList.claimAskDate}
				${claimList.claimAnswerDate}
				${claimList.subCode}
				${claimList.customerName}
				${claimList.customerPhone}
				${claimList.claimStatus}
				<a href="/viewClaimContent?claimCode=${claimList.claimCode}">[상세보기]</a>
				<a href="/headAnswerClaimForm?claimCode=${claimList.claimCode}">[답변하기]</a>
			</div>
			</c:if>
		</c:forEach>
		
		
	</div>
	<div>
	
</body>
</html>