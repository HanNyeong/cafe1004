<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subViewEventList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$.list = function(upDown,criteria){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		$('#EventList').submit();	
	}
	
	$(document).ready(function(){
		//컬럼 명 지정해주는 배열 
		//자기입맛에 맛게 고쳐 쓰세요
		var columnList = ['event_code','event_name','event_begin','event_end','event_type','event_discount_rate','event_regit_date','head_staff_id']

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
			if($('#searchEvent').val() == ""){
				console.log("검색어입력하세요");
			}else{
				$('#EventList').submit();
			}
		});
	});
</script>
</head>
<body>
	<h1>행사목록</h1>
	<form id="EventList" action="/viewEventList" method="POST">
		<input type="hidden" id="upDown" name="upDown" value="" />
		<input type="hidden" id="criteria" name="criteria" value=""/>
		등록 날짜: 
		<input type="date" name="regitDateStart" value="${eventSearch.regitDateStart}"/> ~
		<input type="date" name="regitDateEnd" value="${eventSearch.regitDateEnd}"/> 
		<br/><br/>
		<select name="searchKey" required="required">
			<option value="">::선택::</option>
			<option value="event_code" <c:if test="${eventSearch.searchKey eq 'event_code'}">selected="selected"</c:if>>행사코드</option>
			<option value="event_name" <c:if test="${eventSearch.searchKey eq 'event_name'}">selected="selected"</c:if>>행사명</option>
		</select>
		<input type="text" id="searchEvent" name="searchEvent" value="${eventSearch.searchEvent}"/>
		<input type="button" id="searchBtn" value="검색" /><a href="/viewEventList"><input type="button" value="전체보기"/></a>
	</form>
	<p>
		1:행사코드<span class="up">▲</span><span class="down">▼</span>
		2:행사명<span class="up">▲</span><span class="down">▼</span>
		3:행사시작일<span class="up">▲</span><span class="down">▼</span>
		4:행사종료일<span class="up">▲</span><span class="down">▼</span>
		5:행사종류<span class="up">▲</span><span class="down">▼</span>
		6:행사할인율<span class="up">▲</span><span class="down">▼</span>
		7:행사등록날짜<span class="up">▲</span><span class="down">▼</span>
		8:행사등록담당직원<span class="up">▲</span><span class="down">▼</span>
	</p>
	<c:forEach var="eventList" items="${eventList}">
		<p>
			1:${eventList.eventCode}
			2:${eventList.eventName}
			3:${eventList.eventBegin}
			4:${eventList.eventEnd}
			5:${eventList.eventType}
			6:${eventList.eventDiscountRate}
			7:${eventList.eventRegitDate}
			8:${eventList.headStaffId}
		</p>
	</c:forEach>
</body>
</html>