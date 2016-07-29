<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subviewMenuList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$.list = function(upDown,criteria){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		$('#menuList').submit();	
	}
	
	$(document).ready(function(){
		//컬럼 명 지정해주는 배열 
		//자기입맛에 맛게 고쳐 쓰세요
		var columnList = ['menu_code','menu_name','menu_ingre_price','menu_selling_price','menu_regit_date','event_code']

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
			if($('#searchMenu').val() == ""){
				console.log("검색어입력하세요");
			}else{
				$('#menuList').submit();
			}
		});
	});
</script>
</head>
<body>

	<form id="menuList" action="/subViewMenuList" method="POST">
		<input type="hidden" id="upDown" name="upDown" value="" />
		<input type="hidden" id="criteria" name="criteria" value=""/>
		등록 날짜: 
		<input type="date" name="regitDateStart" value="${menuSearch.regitDateStart}"/> ~
		<input type="date" name="regitDateEnd" value="${menuSearch.regitDateEnd}"/> 
		<br/><br/>
		<select name="searchKey" required="required">
			<option value="">::선택::</option>
			<option value="menu_code" <c:if test="${menuSearch.searchKey eq 'menu_code'}">selected="selected"</c:if>>메뉴 코드</option>
			<option value="menu_name" <c:if test="${menuSearch.searchKey eq 'menu_name'}">selected="selected"</c:if>>메뉴 이름</option>
			<option value="event_code" <c:if test="${menuSearch.searchKey eq 'event_code'}">selected="selected"</c:if>>행사 코드</option>
		</select>
		<input type="text" id="searchMenu" name="searchMenu" value="${menuSearch.searchMenu}"/>
		<input type="button" id="searchBtn" value="검색" /><a href="/viewMenuList"><input type="button" value="전체보기"/></a>
	</form>
	<P>
		1:메뉴 코드<span class="up">▲</span><span class="down">▼</span>
		2:메뉴 이름<span class="up">▲</span><span class="down">▼</span>
		3:재료원가<span class="up">▲</span><span class="down">▼</span>
		4:소비자가격<span class="up">▲</span><span class="down">▼</span>
		5:등록 날짜<span class="up">▲</span><span class="down">▼</span>
		6:행사코드<span class="up">▲</span><span class="down">▼</span>
		7:본사 승인 직원 ID

	</P>        
	<c:forEach var="menuList" items="${subViewMenuList}">	
		<p>
			1:${menuList.menuCode}
			2:${menuList.menuName}
			3:${menuList.menuIngrePrice}
			4:${menuList.menuSellingPrice}
			5:${menuList.menuRegitDate}
			6:${menuList.eventCode}
			7:${menuList.headStaffId}
		</p>	
	</c:forEach>
</body>
</html>