<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
		
		
	});
</script>
</head>
<body>
	<h1>가맹 판매 리스트[승인처리대기리스트]</h1>
	<form id="subSellList" action="/subViewSubSellListN" method="POST">
		<input type="hidden" id="upDown" name="upDown" value="${search.upDown}" />
		<input type="hidden" id="criteria" name="criteria" value="${search.criteria}"/>
		<input type="hidden" id="viewMore" name="viewMore" value="${search.viewMore}"/>
		<input type="hidden" id="subCode" name="subCode" value="${subCode}"/>
		
		등록 날짜: 
		<input type="date" name="regitDateStart" value="${search.regitDateStart}"/> ~
		<input type="date" name="regitDateEnd" value="${search.regitDateEnd}"/> 
		<br/><br/>
		<select name="searchKey" required="required">
			<option value="">::선택::</option>
			<option value="sub_sell_code" <c:if test="${search.searchKey eq 'sub_sell_code'}">selected="selected"</c:if>>sub_sell_code</option>
			<option value="inte_code" <c:if test="${search.searchKey eq 'inte_code'}">selected="selected"</c:if>>inte_code</option>
			<option value="sub_sell_group" <c:if test="${search.searchKey eq 'sub_sell_group'}">selected="selected"</c:if>>sub_sell_group</option>
			<option value="total_account_group" <c:if test="${search.searchKey eq 'total_account_group'}">selected="selected"</c:if>>total_account_group</option>
			<option value="pay_method" <c:if test="${search.searchKey eq 'pay_method'}">selected="selected"</c:if>>pay_method</option>
			<option value="event_code" <c:if test="${search.searchKey eq 'event_code'}">selected="selected"</c:if>>event_code</option>
			<option value="sub_staff_code" <c:if test="${search.searchKey eq 'sub_staff_code'}">selected="selected"</c:if>>sub_staff_code</option>
			<option value="sub_sell_final_staff" <c:if test="${search.searchKey eq 'sub_sell_final_staff'}">selected="selected"</c:if>>sub_sell_final_staff</option>
		</select>
		<input type="text" id="search" name="search" value="${search.search}"/>
		<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
		<a href="/subViewSubSellList?subCode=${subCode}"><input type="button" class="btn btn-default"  value="전체보기"/></a>
	</form>
	
	<a href="/subViewSubSellList?subCode=${subCode}">[승인처리리스트]</a>
	<div>
		subSellCode<span class="up">▲</span><span class="down">▼</span>
		inteCode<span class="up">▲</span><span class="down">▼</span>
		subSellGroup<span class="up">▲</span><span class="down">▼</span>
		subSellDate<span class="up">▲</span><span class="down">▼</span>
		subSellPracticalSellingPrice<span class="up">▲</span><span class="down">▼</span>
		totalAccountGroup<span class="up">▲</span><span class="down">▼</span>
		subSellFinal<span class="up">▲</span><span class="down">▼</span>
		subSellFinalDate<span class="up">▲</span><span class="down">▼</span>
		payMethod<span class="up">▲</span><span class="down">▼</span>
		subCode<span class="up">▲</span><span class="down">▼</span>
		eventCode<span class="up">▲</span><span class="down">▼</span>
		subStaffCode<span class="up">▲</span><span class="down">▼</span>
		subSellFinalStaff<span class="up">▲</span><span class="down">▼</span>
		subSellCost<span class="up">▲</span><span class="down">▼</span>
		[마감처리]
	</div>
	<div>
		<p>------------------------------------------------------승인처리안된것 subSellFinal ="N"---------------------------------------------------------</p>
		<c:forEach var="subSellList" items="${subSellList}">
			<c:if test="${subSellList.subSellFinal == 'N'}">	
				<div>
					${subSellList.subSellCode}
					${subSellList.inteCode}
					${subSellList.subSellGroup}
					${subSellList.subSellDate}
					${subSellList.subSellPracticalSellingPrice}
					${subSellList.totalAccountGroup}
					${subSellList.subSellFinal}
					${subSellList.subSellFinalDate}
					${subSellList.payMethod}
					${subSellList.subCode}
					${subSellList.eventCode}
					${subSellList.subStaffCode}
					${subSellList.subSellFinalStaff}
					${subSellList.subSellCost}
					<a href="/subSellFinal?subSellCode=${subSellList.subSellCode}&subCode=${subSellList.subCode}">[마감]</a>
				</div>
			</c:if>	
		</c:forEach>
		<input type="button" class="btn btn-default" id="viewMoreBtn" value="더보기"/>
	</div>
	
</body>
</html>