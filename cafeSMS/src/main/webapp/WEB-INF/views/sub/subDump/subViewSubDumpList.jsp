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

	<form id="subDumpList" action="/subViewSubDumpList" method="POST">
		<input type="hidden" id="upDown" name="upDown" value="" />
		<input type="hidden" id="criteria" name="criteria" value=""/>
		<input type="hidden" id="subDumpCode" name="subDumpCode" value="${subDumpList.subDumpCode}"/>
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
		<input type="button" id="searchBtn" value="검색" /><a href="/viewsubDumpList"><input type="button" value="전체보기"/></a>
	</form>
		<a href="/subAddSubDump"><input type="button" id="subDumpAddBtn" name="subDumpAddBtn" value="폐기등록"></a>
	<P>
		1:폐기 코드<span class="up">▲</span><span class="down">▼</span>
		2:폐기 사유
		3:폐기 날짜<span class="up">▲</span><span class="down">▼</span>
		4:본사 상품 코드<span class="up">▲</span><span class="down">▼</span>
		5:개별 상품 코드<span class="up">▲</span><span class="down">▼</span>
		6:가맹 폐기 담당 직원<span class="up">▲</span><span class="down">▼</span>
		7:가맹대표코드<span class="up">▲</span><span class="down">▼</span>
	</P>        
		<c:forEach var="subDumpList" items="${subDumpList}">
			<p>
				1:${subDumpList.subDumpCode}<input type="hidden" class="subDumpCode" name="subDumpCode" value="${subDumpList.subDumpCode}">
				2:${subDumpList.specificItemCode}<input type="hidden" class="specificItemCode" name="specificItemCode" value="${subDumpList.specificItemCode}">
				3:${subDumpList.subDumpDate}<input type="hidden" class="subDumpDate" name="subDumpDate" value="${subDumpList.subDumpDate}">
				4:${subDumpList.hItemCode}<input type="hidden" class="hItemCode" name="hItemCode" value="${subDumpList.hItemCode}">
				5:${subDumpList.specificItemCode}<input type="hidden" class="specificItemCode" name="specificItemCode" value="${subDumpList.specificItemCode}">
				6:${subDumpList.subStaffCode}<input type="hidden" class="subStaffCode" name="subStaffCode" value="${subDumpList.subStaffCode}">
				7:${subDumpList.subCode}<input type="hidden" class="subCode" name="subCode" value="${subDumpList.subCode}">
				
			</p>
		
		</c:forEach>
</body>
</html>