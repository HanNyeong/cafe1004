<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subViewContractList</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		var columnList = ['contract_code','contract_name','contract_regit_date','contract_actual_date','contract_expiry_date','contract_n','contract_expire_date','sub_code','pay_method','sub_code','re_contract_status']
		

		$('.up').each(function(index,item){
			$(item).click(function(){
				list('ASC',columnList[index],$("#contractList"));
			});
		});
		$('.down').each(function(index,item){
			$(item).click(function(){
				list('DESC',columnList[index],$("#contractList"));
			});
		});

		
		// 더보기
		$('#viewMoreBtn').click(function(){
			var viewMore = $('#viewMore').val();
			$('#viewMore').val(viewMore*1+25);
			$('#contractList').submit();
		});
	
		//selectYN
		$('#selectYN').change(function(){
			if($('#selectYN').val() == ''){
				$('#YN').val('');
				$('#contractList').submit();
			}else if($('#selectYN').val() == 'Y'){
				$('#YN').val('Y');
				$('#contractList').submit();
			}else if($('#selectYN').val() == 'N'){
				$('#YN').val('N');
				$('#contractList').submit();
			}
		});
		
		
		//폼 제출 유효성
		undefinedEvent($('#searchBtn'),$('#contractList'),$('#valChekMsg'));
	  });

</script>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-8">
		<!-- 상품 검색 -->
		<form  id="contractList" action="/subViewContractList" method="post">
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
				<option value="contract_code" <c:if test="${search.searchKey eq 'contract_code'}">selected="selected"</c:if>>계약코드</option>
				<option value="contract_name" <c:if test="${search.searchKey eq 'contract_name'}">selected="selected"</c:if>>계약자명</option>
			</select>
			<input type="text" id="search" name="search" value="${search.search}" valChek="검색어를  입력해주세요"/>
			<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
			<a href="/subViewContractList?subCode=${subCode}">
			<input type="button" class="btn btn-default"  value="전체보기"/></a><br/>
			<span id="valChekMsg"></span>
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
	<div class="col-sm-3">
		<h3>= 계약조회 페이지 =</h3>
	</div>	
	<div class="col-sm-5 clickBtn">	
			<h4>분류 : 
				<select id="selectYN" required="required">
					<option value="" <c:if test="${YN eq ''}">selected="selected"</c:if>>전체</option>
					<option value="Y" <c:if test="${YN eq 'Y'}">selected="selected"</c:if>>본사승인</option>
					<option value="N" <c:if test="${YN eq 'N'}">selected="selected"</c:if>>승인대기</option>			
				</select>
				<c:if test="${empty subContractList}">
				<a href="/subAddContract?subCode=${subCode}"><button class="btn btn-default">계약등록</button></a>
				</c:if>
			</h4>
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<div class="row tablediv">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-1 th">
			계약상태
		</div>
		<div class="col-sm-1 th">	
			계약코드  <span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">	
			계약자 명  <span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">	
			계약 시작일  <span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">	
			계약 만료일  <span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">	
			계약 파기일  <span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">	
			[상세보기]
		</div>
		<div class="col-sm-1 th">	
			신청
		</div>	
		<div class="col-sm-2">
		</div>
	</div> 	
		
<!-- 날짜구하기 -->
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now}" var="nows" pattern="yyyy-MM-dd"/>
		
<c:forEach var="subContractList" items="${subContractList}">
			
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-1">
					<c:if test="${subContractList.headContractConfirm == 'Y'}">
						[승인]
					</c:if>
					<c:if test="${subContractList.headContractConfirm == 'N'}">
						[대기]
					</c:if>	
					<br/>
					<c:if test="${subContractList.contractExpireDate != null}">
		 				파기
			 		</c:if>
					<c:if test="${subContractList.contractExpireDate == null && subContractList.contractExpiryDate > nows && subContractList.reContractStatus == 'N'}">
			 			정상
			 		</c:if>
			 		<c:if test="${subContractList.contractExpiryDate <= nows}">
			 			${subContractList.contractN}차 계약 만료
			 		</c:if>
			 		<br/>
			 		<c:if test="${subContractList.reContractStatus == 'Y' && subContractList.contractExpireDate == null}">
			 			${subContractList.contractN}차 재계약
			 		</c:if>
			 </div>		
			 <div class="col-sm-1">${subContractList.contractCode}</div>	
			 <div class="col-sm-1">${subContractList.contractName}</div>	
			 <div class="col-sm-1">${subContractList.contractActualDate}</div>	
			 <div class="col-sm-1">${subContractList.contractExpiryDate}</div>	
			 <div class="col-sm-1">${subContractList.contractExpireDate}</div>	
			 <div class="col-sm-1">		
				<a href="/subViewContractContent?contractCode=${subContractList.contractCode}">[상세보기]</a>
			 </div>	
			 <div class="col-sm-1">
					<c:if test="${subContractList.reContractStatus == 'N' && subContractList.headContractConfirm == 'Y'}">
						<a href="/subAddRecharterContract?contractCode=${subContractList.contractCode}">[재계약신청]</a>
					</c:if>
					<br/>
					<c:if test="${subContractList.contractExpireDate ==null && subContractList.reContractStatus == 'N' && subContractList.headContractConfirm == 'Y'}">
						<a href="/subExpireContract?contractCode=${subContractList.contractCode}&subCode=${subContractList.subCode}">[계약파기신청]</a>
					</c:if>			
			</div>
			<div class="col-sm-2">
			</div>
		</div>
	
			
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