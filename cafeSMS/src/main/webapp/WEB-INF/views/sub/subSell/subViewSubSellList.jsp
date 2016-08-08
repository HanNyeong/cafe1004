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
	var listN = function(upDown,criteria){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		$('#subSellList').submit();	
	}
	
	var listY = function(upDown2,criteria2){
		$('#upDown2').attr('value',upDown2);
		$('#criteria2').attr('value',criteria2);
		$('#subSellList').submit();	
	}
	
	
	$(document).ready(function(){
		var columnListN = ['sub_sell_code','inte_code','sub_sell_group','sub_sell_date','sub_sell_practical_selling_price','total_account_group','sub_sell_final','sub_sell_final_date','pay_method','sub_code','event_code','sub_staff_code','sub_sell_final_staff','sub_sell_cost']
		
		$('.upN').each(function(index,item){
			$(item).click(function(){
				listN('ASC',columnListN[index]);
			});
		});
		$('.downN').each(function(index,item){
			$(item).click(function(){
				listN('DESC',columnListN[index]);
			});
		});
		// 더보기
		$('#viewMoreBtnN').click(function(){
			var viewMoreN = $('#viewMore').val();
			$('#viewMore').val(viewMoreN*1+25);
			$('#subSellList').submit();
		});
		$('#searchBtnN').click(function(){
			if($('#searchN').val() == ""){
				console.log("검색어입력하세요");
			}else{
				$('#subSellList').submit();
			}
		});
	
		/* -----------------------------------------------------------------------------경계선----------------------------------------------------------------------------- */
		
	var columnListY= ['sub_sell_code','inte_code','sub_sell_group','sub_sell_date','sub_sell_practical_selling_price','total_account_group','sub_sell_final','sub_sell_final_date','pay_method','sub_code','event_code','sub_staff_code','sub_sell_final_staff','sub_sell_cost']
		
		$('.upY').each(function(index,item){
			$(item).click(function(){
				listY('ASC',columnListY[index]);
			});
		});
		$('.downY').each(function(index,item){
			$(item).click(function(){
				listY('DESC',columnListY[index]);
			});
		});
		// 더보기
		$('#viewMoreBtnY').click(function(){
			var viewMoreY = $('#viewMore2').val();
			$('#viewMore2').val(viewMoreY*1+25);
			$('#subSellList').submit();
		});
		$('#searchBtnY').click(function(){
			if($('#searchY').val() == ""){
				console.log("검색어입력하세요");
			}else{
				$('#subSellList').submit();
			}
		});
		
	});
</script>
</head>
<body>
	<h1>가맹 판매 리스트</h1>
	<form id="subSellList" action="/subViewSubSellList" method="POST">
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
		<input type="text" id="searchN" name="search" value="${search.search}"/>
		<input type="button" id="searchBtnN" class="btn btn-default" value="검색" />
		<a href="/subViewSubSellList?subCode=${subCode}"><input type="button" class="btn btn-default"  value="전체보기"/></a>
	
	
	<div>
		subSellCode<span class="upN">▲</span><span class="downN">▼</span>
		inteCode<span class="upN">▲</span><span class="downN">▼</span>
		subSellGroup<span class="upN">▲</span><span class="downN">▼</span>
		subSellDate<span class="upN">▲</span><span class="downN">▼</span>
		subSellPracticalSellingPrice<span class="upN">▲</span><span class="downN">▼</span>
		totalAccountGroup<span class="upN">▲</span><span class="downN">▼</span>
		subSellFinal<span class="upN">▲</span><span class="downN">▼</span>
		subSellFinalDate<span class="upN">▲</span><span class="downN">▼</span>
		payMethod<span class="upN">▲</span><span class="downN">▼</span>
		subCode<span class="upN">▲</span><span class="downN">▼</span>
		eventCode<span class="upN">▲</span><span class="downN">▼</span>
		subStaffCode<span class="upN">▲</span><span class="downN">▼</span>
		subSellFinalStaff<span class="upN">▲</span><span class="downN">▼</span>
		subSellCost<span class="upN">▲</span><span class="downN">▼</span>
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
		<input type="button" class="btn btn-default" id="viewMoreBtnN" value="더보기"/>
	</div>
	
	<!-- -----------------------------------------------------------------------------경계선----------------------------------------------------------------------------- -->
	 	<input type="hidden" id="upDown2" name="upDown2" value="${search2.upDown2}" />
		<input type="hidden" id="criteria2" name="criteria2" value="${search2.criteria2}"/>
		<input type="hidden" id="viewMore2" name="viewMore2" value="${search2.viewMore2}"/>
		
		
		등록 날짜: 
		<input type="date" name="regitDateStart2" value="${search2.regitDateStart2}"/> ~
		<input type="date" name="regitDateEnd2" value="${search2.regitDateEnd2}"/> 
		<br/><br/>
		<select name="searchKey2" required="required">
			<option value="">::선택::</option>
			<option value="sub_sell_code" <c:if test="${search2.searchKey2 eq 'sub_sell_code'}">selected="selected"</c:if>>sub_sell_code</option>
			<option value="inte_code" <c:if test="${search2.searchKey2 eq 'inte_code'}">selected="selected"</c:if>>inte_code</option>
			<option value="sub_sell_group" <c:if test="${search2.searchKey2 eq 'sub_sell_group'}">selected="selected"</c:if>>sub_sell_group</option>
			<option value="total_account_group" <c:if test="${search2.searchKey2 eq 'total_account_group'}">selected="selected"</c:if>>total_account_group</option>
			<option value="pay_method" <c:if test="${search2.searchKey2 eq 'pay_method'}">selected="selected"</c:if>>pay_method</option>
			<option value="event_code" <c:if test="${search2.searchKey2 eq 'event_code'}">selected="selected"</c:if>>event_code</option>
			<option value="sub_staff_code" <c:if test="${search2.searchKey2 eq 'sub_staff_code'}">selected="selected"</c:if>>sub_staff_code</option>
			<option value="sub_sell_final_staff" <c:if test="${search2.searchKey2 eq 'sub_sell_final_staff'}">selected="selected"</c:if>>sub_sell_final_staff</option>
		</select>
		<input type="text" id="search2" name="search2" value="${search2.search2}"/>
		<input type="button" id="searchBtn2" class="btn btn-default" value="검색" />
		<a href="/subViewSubSellList?subCode=${subCode}"><input type="button" class="btn btn-default"  value="전체보기"/></a>
	
	
	<div>
		subSellCode<span class="upY">▲</span><span class="downY">▼</span>
		inteCode<span class="upY">▲</span><span class="downY">▼</span>
		subSellGroup<span class="upY">▲</span><span class="downY">▼</span>
		subSellDate<span class="upY">▲</span><span class="downY">▼</span>
		subSellPracticalSellingPrice<span class="upY">▲</span><span class="downY">▼</span>
		totalAccountGroup<span class="upY">▲</span><span class="downY">▼</span>
		subSellFinal<span class="upY">▲</span><span class="downY">▼</span>
		subSellFinalDate<span class="upY">▲</span><span class="downY">▼</span>
		payMethod<span class="upY">▲</span><span class="downY">▼</span>
		subCode<span class="upY">▲</span><span class="downY">▼</span>
		eventCode<span class="upY">▲</span><span class="downY">▼</span>
		subStaffCode<span class="upY">▲</span><span class="downY">▼</span>
		subSellFinalStaff<span class="upY">▲</span><span class="downY">▼</span>
		subSellCost<span class="upY">▲</span><span class="downY">▼</span>
		[마감처리]
	</div> --%>
	<div>
		<p>------------------------------------------------------승인처리 된것 subSellFinal ="Y"---------------------------------------------------------</p>
		<c:forEach var="subSellList" items="${subSellList}">
			<c:if test="${subSellList.subSellFinal == 'Y'}">	
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
					[Null]
				</div>
			</c:if>	
		</c:forEach>
		<input type="button" class="btn btn-default" id="viewMoreBtnY" value="더보기"/>
	</div>
	
	</form>
</body>
</html>