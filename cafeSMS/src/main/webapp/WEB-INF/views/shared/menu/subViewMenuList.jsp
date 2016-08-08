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
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-8">
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
			<input type="button" id="searchBtn" class="btn btn-default" value="검색" /><a href="/viewMenuList">
			<input type="button" class="btn btn-default" value="전체보기"/></a>
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
	<div class="col-sm-8">
		<h3>= 메뉴 리스트 =</h3>
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<div class="row tablediv">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-1 th">
		메뉴 코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		메뉴 이름<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		재료원가<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		소비자가격<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		등록 날짜<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		행사코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		본사승인직원ID
	</div>
	<div class="col-sm-1 th">	
		레시피
	</div>
	<div class="col-sm-2">
	</div>
</div>
       
	<c:forEach var="menuList" items="${subViewMenuList}">	
	<div class="row tablediv">
		<div class="col-sm-2">
		</div>	
			<div class="col-sm-1">${menuList.menuCode}</div>
			<div class="col-sm-1">${menuList.menuName}</div>
			<div class="col-sm-1">${menuList.menuIngrePrice}</div>
			<div class="col-sm-1">${menuList.menuSellingPrice}</div>
			<div class="col-sm-1">${menuList.menuRegitDate}</div>
			<div class="col-sm-1">${menuList.eventCode}</div>
			<div class="col-sm-1">${menuList.headStaffId}</div>
			<div class="col-sm-1">
				<a href="subViewRecipeList?menuCode=${menuList.menuCode}&menuName=${menuList.menuName}">레시피 보기</a>
			</div>
		<div class="col-sm-2">
		</div>
	</div>
	</c:forEach>
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>