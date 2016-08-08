<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subViewSubDumpList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$.list = function(upDown,criteria){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		$('#subDumpList').submit();	
	}
	$(document).ready(function(){
		//컬럼 명 지정해주는 배열 
		//자기입맛에 맛게 고쳐 쓰세요
		var columnList = ['sub_dump_code','sub_dump_reason','sub_dump_date','sub_dump_date','head_item_code','specific_item_code','sub_staff_code','sub_code']

		$('.up').each(function(index,item){
			$(item).click(function(){
				$.list('ASC',columnList[index]);
			});
		});
		$('.down').each(function(index,item){
			$(item).click(function(){
				$.list('DESC',columnList[index]);
			});
		});
		$('#searchBtn').click(function(){
			if($('#searchCart').val() == ""){
				console.log("검색어입력하세요");
			}else{
				$('#subDumpList').submit();
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
	
	<div class="col-sm-8">
	<form id="subDumpList" action="/subViewSubDumpList" method="POST">
		<input type="hidden" id="upDown" name="upDown" value="" />
		<input type="hidden" id="criteria" name="criteria" value=""/>
		<input type="hidden" id="subCode" name="subCode" value="${subLogin.subCode}"/>
		등록 날짜: 
		<input type="date" name="regitDateStart" value="${subDumpSearch.regitDateStart}"/> ~
		<input type="date" name="regitDateEnd" value="${subDumpSearch.regitDateEnd}"/> 
		<br/><br/>
		<select name="searchKey" required="required">
			<option value="">::선택::</option>
			<option value="sub_dump_code" <c:if test="${subDumpSearch.searchKey eq 'sub_dump_code'}">selected="selected"</c:if>>폐기 코드</option>
			<option value="sub_staff_code" <c:if test="${subDumpSearch.searchKey eq 'sub_staff_code'}">selected="selected"</c:if>>가맹 폐기 담당 직원</option>
			<option value="specific_item_code" <c:if test="${subDumpSearch.searchKey eq 'specific_item_code'}">selected="selected"</c:if>>개별 상품 코드</option>
			<option value="h_item_code" <c:if test="${subDumpSearch.searchKey eq 'cart_quantity'}">selected="selected"</c:if>>본사 상품 코드</option>
			<option value="sub_code" <c:if test="${subDumpSearch.searchKey eq 'sub_code'}">selected="selected"</c:if>>가맹 대표 코드</option>
		</select>
		<input type="text" id="searchSubDump" name="searchSubDump" value="${subDumpSearch.searchSubDump}"/>
		<input type="button" id="searchBtn" class="btn btn-default"  value="검색" /><a href="/viewsubDumpList"> <input type="button" class="btn btn-default" value="전체보기"/></a>
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
		<div class="col-sm-2">  
			<h3>= 폐기 관리 리스트 =</h3>
		</div>
		<div class="col-sm-6 clickBtn">
			<a href="/subAddSubDump?subCode=${subLogin.subCode}">
				<input type="button" class="btn btn-default" id="subDumpAddBtn" name="subDumpAddBtn" value="폐기등록">
			</a>
		</div>
	<div class="col-sm-2">
	</div>
</div>
<div class="row tablediv">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-1 th">	
		폐기 코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		폐기 사유
	</div>
	<div class="col-sm-2 th">
		폐기 날짜<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		본사상품C<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		개별상품C<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		담당 직원<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		대표코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-2">
	</div>
</div>    
		<c:forEach var="subDumpList" items="${subDumpList}">
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>
			
				<div class="col-sm-1">${subDumpList.subDumpCode}<input type="hidden" class="subDumpCode" name="subDumpCode" value="${subDumpList.subDumpCode}"></div>
				<div class="col-sm-1">${subDumpList.subDumpReason}<input type="hidden" class="subDumpReason" name="subDumpReason" value="${subDumpList.subDumpReason}"></div>
				<div class="col-sm-2">${subDumpList.subDumpDate}<input type="hidden" class="subDumpDate" name="subDumpDate" value="${subDumpList.subDumpDate}"></div>
				<div class="col-sm-1">${subDumpList.hItemCode}<input type="hidden" class="hItemCode" name="hItemCode" value="${subDumpList.hItemCode}"></div>
				<div class="col-sm-1">${subDumpList.specificItemCode}<input type="hidden" class="specificItemCode" name="specificItemCode" value="${subDumpList.specificItemCode}"></div>
				<div class="col-sm-1">${subDumpList.subStaffCode}<input type="hidden" class="subStaffCode" name="subStaffCode" value="${subDumpList.subStaffCode}"></div>
				<div class="col-sm-1">${subDumpList.subCode}<input type="hidden" class="subCode" name="subCode" value="${subDumpList.subCode}"></div>
			
			<div class="col-sm-2">
			</div>
		</div>
		</c:forEach>
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>