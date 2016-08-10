<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>headViewContractList</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
var list = function(upDown,criteria){
	$('#upDown').attr('value',upDown);
	$('#criteria').attr('value',criteria);
	$('#contractList').submit();	
	}

	$(document).ready(function(){
		var columnList = ['contract_code','contract_name','contract_regit_date','contract_actual_date','contract_expiry_date','contract_n','contract_expire_date','sub_code','pay_method','sub_code','re_contract_status']
		

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
			$('#contractList').submit();
		});
		
		$('#searchBtn').click(function(){
			if($('#searchSubStaff').val() == ""){
				console.log("검색어입력하세요");
			}else{
				$('#contractList').submit();
			}
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
	});
</script>

<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-8">
	<!-- 상품 검색 -->
		<form name="contractList" id="contractList" action="/headViewContractList" method="post">
			<!-- 오름차/내림차순 정렬을 위한 input 태그 -->
			<input type="hidden" id="upDown" name="upDown" value="${search.upDown}" />
			<input type="hidden" id="criteria" name="criteria" value="${search.criteria}"/>
			<input type="hidden" id="viewMore" name="viewMore" value="${search.viewMore}"/>
			<input type="hidden" id="YN"  name="YN" value="${YN}"/>
			<%-- <input type="hidden" name="subCode" value="${subCode}"/> --%>
			등록 날짜: 
			<input type="date" name="regitDateStart" value="${search.regitDateStart}"/> ~
			<input type="date" name="regitDateEnd" value="${search.regitDateEnd}"/> 
			<br/><br/>
			<select name="searchKey" required="required">
				<option value="">::선택::</option>
				<option value="contract_code" <c:if test="${search.searchKey eq 'contract_code'}">selected="selected"</c:if>>계약코드</option>
				<option value="contract_name" <c:if test="${search.searchKey eq 'contract_name'}">selected="selected"</c:if>>계약자명</option>
				<option value="sub_code" <c:if test="${search.searchKey eq 'sub_code'}">selected="selected"</c:if>>가맹코드</option>
				
			</select>
			<input type="text" id="search" name="search" value="${search.search}"/>
			<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
			<a href="/headViewContractList"><input type="button" class="btn btn-default"  value="전체보기"/></a>
		
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
		<h3>= 본사 계약 조회 =</h3>	
	</div>	
	<div class="col-sm-5 clickBtn">
		<h4>분류 : 
			<select id="selectYN" required="required">
				<option value="" <c:if test="${YN eq ''}">selected="selected"</c:if>>전체</option>
				<option value="Y" <c:if test="${YN eq 'Y'}">selected="selected"</c:if>>본사승인</option>
				<option value="N" <c:if test="${YN eq 'N'}">selected="selected"</c:if>>승인대기</option>
			</select>
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
		계약코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		계약자명<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		계약시작일<span class="up">▲</span><span class="down">▼</span>		
	</div>
	<div class="col-sm-1 th">	
		계약만료일<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		계약파기일<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		가맹코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		[상세보기]	
	</div>	
	<div class="col-sm-2">
	</div>
</div> 
<!-- 날짜구하기 -->
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now}" var="nows" pattern="yyyy-MM-dd"/>



<c:forEach var="headContractList" items="${headContractList}">
	<c:if test="${YN eq '' || YN eq null}">
	<div class="row tablediv">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-1">
				<c:if test="${headContractList.headContractConfirm == 'Y'}">
			 		[승인]
			 	</c:if>
			 	<c:if test="${headContractList.headContractConfirm == 'N'}">
			 		[대기]
			 	</c:if>		
		 		<c:if test="${headContractList.contractExpireDate != null}">
						파기
		 		</c:if>
				<c:if test="${headContractList.contractExpireDate == null && headContractList.contractExpiryDate > nows && headContractList.reContractStatus == 'N'}">
					정상
		 		</c:if>
		 		<c:if test="${headContractList.contractExpiryDate <= nows}">
		 			${headContractList.contractN}차 계약 만료
		 		</c:if>
		 		<c:if test="${headContractList.reContractStatus == 'Y' && headContractList.contractExpireDate == null}">
		 			${headContractList.contractN}차 재계약
		 		</c:if>
		 	</div>	
			<div class="col-sm-1">${headContractList.contractCode}</div>
			<div class="col-sm-1">${headContractList.contractName}</div>
			<div class="col-sm-1">${headContractList.contractActualDate}</div>
			<div class="col-sm-1">${headContractList.contractExpiryDate}</div>
			<div class="col-sm-1">${headContractList.contractExpireDate}</div>
			<div class="col-sm-1">${headContractList.subCode}</div>
			<div class="col-sm-1">
				<a href="/subViewContractContent?contractCode=${headContractList.contractCode}">[상세보기]</a><br/>
				<c:if test="${headContractList.headContractConfirm == 'N'}">	
					<a href="/headApproveContract?contractCode=${headContractList.contractCode}">[계약승인]</a>
				</c:if>		
			</div>
			<div class="col-sm-2">
			</div>
		</div>
	</c:if>
	<c:if test="${headContractList.headContractConfirm eq YN}">
	<div class="row tablediv">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-1">
			<c:if test="${headContractList.headContractConfirm == 'Y'}">
		 		[승인]
		 	</c:if>
		 	<c:if test="${headContractList.headContractConfirm == 'N'}">
		 		[대기]
		 	</c:if>		
	 		<c:if test="${headContractList.contractExpireDate != null}">
					파기
	 		</c:if>
			<c:if test="${headContractList.contractExpireDate == null && headContractList.contractExpiryDate > nows && headContractList.reContractStatus == 'N'}">
				정상
	 		</c:if>
	 		<c:if test="${headContractList.contractExpiryDate <= nows}">
	 			${headContractList.contractN}차 계약 만료
	 		</c:if>
	 		<c:if test="${headContractList.reContractStatus == 'Y' && headContractList.contractExpireDate == null}">
	 			${headContractList.contractN}차 재계약
	 		</c:if>
	 	</div>	
		<div class="col-sm-1">${headContractList.contractCode}</div>
		<div class="col-sm-1">${headContractList.contractName}</div>
		<div class="col-sm-1">${headContractList.contractActualDate}</div>
		<div class="col-sm-1">${headContractList.contractExpiryDate}</div>
		<div class="col-sm-1">${headContractList.contractExpireDate}</div>
		<div class="col-sm-1">${headContractList.subCode}</div>
		<div class="col-sm-1">
			<a href="/subViewContractContent?contractCode=${headContractList.contractCode}">[상세보기]</a><br/>
			<c:if test="${headContractList.headContractConfirm == 'N'}">	
				<a href="/headApproveContract?contractCode=${headContractList.contractCode}">[계약승인]</a>
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