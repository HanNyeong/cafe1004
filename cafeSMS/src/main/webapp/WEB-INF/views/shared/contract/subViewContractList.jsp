<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
	
	$(document).ready(function(){
		
		/* 오름차/내림차순 정렬 설정 */
		$('#contractCodeUp').click(function(){
			
			$('#criteria').attr('value','contract_code');
			$('#upDown').attr('value','DESC');
			$('#contractList').submit();
		});
		$('#contractCodeDown').click(function(){
			
			$('#criteria').attr('value','contract_code');
			$('#upDown').attr('value','ASC');
			$('#contractList').submit();
		});
		
		
		$('#contractNameUp').click(function(){
			
			$('#criteria').attr('value','contract_name');
			$('#upDown').attr('value','DESC');
			$('#contractList').submit();
		});
		$('#contractNameDown').click(function(){
			
			$('#criteria').attr('value','contract_name');
			$('#upDown').attr('value','ASC');
			$('#contractList').submit();
		});
		
		
		$('#contractRegitDateUp').click(function(){
			
			$('#criteria').attr('value','contract_regit_date');
			$('#upDown').attr('value','DESC');
			$('#contractList').submit();
		});
		$('#contractRegitDateDown').click(function(){
			
			$('#criteria').attr('value','contract_regit_date');
			$('#upDown').attr('value','ASC');
			$('#contractList').submit();
		});
		
		
		$('#contractActualDateUp').click(function(){
			
			$('#criteria').attr('value','contract_actual_date');
			$('#upDown').attr('value','DESC');
			$('#contractList').submit();
		});
		$('#contractActualDateDown').click(function(){
			
			$('#criteria').attr('value','contract_actual_date');
			$('#upDown').attr('value','ASC');
			$('#contractList').submit();
		});
		
		
		$('#contractExpiryDateUp').click(function(){
			
			$('#criteria').attr('value','contract_expiry_date');
			$('#upDown').attr('value','DESC');
			$('#contractList').submit();
		});
		$('#contractExpiryDateDown').click(function(){
			
			$('#criteria').attr('value','contract_expiry_date');
			$('#upDown').attr('value','ASC');
			$('#contractList').submit();
		});
		
		$('#contractExpireDateUp').click(function(){
			
			$('#criteria').attr('value','contract_expire_date');
			$('#upDown').attr('value','DESC');
			$('#contractList').submit();
		});
		$('#contractExpireDateDown').click(function(){
			
			$('#criteria').attr('value','contract_expire_date');
			$('#upDown').attr('value','ASC');
			$('#contractList').submit();
		});
		
	});

</script>

	<h1>계약조회 페이지입니다.</h1><hr/>
		<!-- 상품 검색 -->
		<form name="contractList" id="contractList" action="/subViewContractList" method="post">
			<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
			<input type="hidden" name="criteria" id="criteria" value=""/>
			<input type="hidden" name="upDown" id="upDown" value=""/>
		
			등록 날짜: 
			<input type="date" name="regitDateStart" value="${contractSearch.regitDateStart}"/> ~
			<input type="date" name="regitDateEnd" value="${contractSearch.regitDateEnd}"/> 
			<br/><br/>
			<select name="searchKey" required="required">
				<option value="">::선택::</option>
				<option value="contract_code" <c:if test="${contractSearch.searchKey eq 'contract_code'}">selected="selected"</c:if>>contract_code</option>
				<option value="contract_name" <c:if test="${contractSearch.searchKey eq 'contract_name'}">selected="selected"</c:if>>contract_name</option>
				<option value="sub_code" <c:if test="${contractSearch.searchKey eq 'sub_code'}">selected="selected"</c:if>>sub_code</option>
				
			</select>
			<input type="text" name="searchContract" value="${contractSearch.searchContract}"/>
			<button>검색</button>
		</form>
	
	<hr/>
	<div>
	<c:set var="now" value="<%=new java.util.Date()%>" />
	
		<div>
			[계약상태]
			contractCode<span id="contractCodeUp">▲</span><span id="contractCodeDown">▼</span>
			contractName<span id="contractNameUp">▲</span><span id="contractNameDown">▼</span>
			contractRegitDate<span id="contractRegitDateUp">▲</span><span id="contractRegitDateDown">▼</span>
			contractActualDate<span id="contractActualDateUp">▲</span><span id="contractActualDateDown">▼</span>
			contractExpiryDate<span id="contractExpiryDateUp">▲</span><span id="contractExpiryDateDown">▼</span>
			contractN
			contractExpireDate<span id="contractExpireDateUp">▲</span><span id="contractExpireDateDown">▼</span>
			subCode
			reContractStatus	
			[상세보기]
			[재계약신청]	
			[계약파기신청]	
		</div>
		
		
			
		
		<c:forEach var="subContractList" items="${subContractList}">
		<fmt:formatDate value="${now}" var="nows" pattern="yyyy-MM-dd"/>
			<div>
			<c:if test="${subContractList.contractExpireDate != null}">
	 				파기
	 		</c:if>
			<c:if test="${subContractList.contractExpireDate == null && subContractList.contractExpiryDate > nows}">
	 				정상
	 		</c:if>
	 		<c:if test="${subContractList.contractExpiryDate <= nows}">
	 				만료
	 		</c:if>
			${subContractList.contractCode}
			${subContractList.contractName}
			${subContractList.contractRegitDate}
			${subContractList.contractActualDate}
			${subContractList.contractExpiryDate}
			${subContractList.contractN}
			${subContractList.contractExpireDate}
			${subContractList.subCode}
			${subContractList.reContractStatus}
			<a href="/subViewContractContent?contractCode=${subContractList.contractCode}">[상세보기]</a>
			
			<c:if test="${subContractList.reContractStatus == 'N'}">
				<a href="/subAddRecharterContract?contractCode=${subContractList.contractCode}">[재계약신청]</a>
			</c:if>
			
			<c:if test="${subContractList.contractExpireDate ==null && subContractList.reContractStatus == 'N'}">
				<a href="/subExpireContract?contractCode=${subContractList.contractCode}">[계약파기신청]</a>
			</c:if>
			
			
			
			</div>
		</c:forEach>
	
	</div>
	<hr/>
	<h1>계약등록 링크</h1>
	<div>
		<a href="/subAddContract?subCode=${subCode}">[계약등록]</a>
	</div>
	
</body>
</html>