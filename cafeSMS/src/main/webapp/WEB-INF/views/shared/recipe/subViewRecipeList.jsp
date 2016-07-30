<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subviewRecipeList</title>
<script>
	$.list = function(upDown,criteria){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		$('#recipeList').submit();	
	}
	
	$(document).ready(function(){
		//컬럼 명 지정해주는 배열 
		//자기입맛에 맛게 고쳐 쓰세요
		var columnList = ['recipe_code','recipe_order','recipe_act','recipe_regit_date','menu_code','head_staff_id']

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
			if($('#searchRecipe').val() == ""){
				console.log("검색어입력하세요");
			}else{
				$('#recipeList').submit();
			}
		});
	});
</script>
</head>
<body>

	<form id="recipeList" action="/subViewrecipeList" method="POST">
		<input type="hidden" id="upDown" name="upDown" value="" />
		<input type="hidden" id="criteria" name="criteria" value=""/>
		등록 날짜: 
		<input type="date" name="regitDateStart" value="${recipeSearch.regitDateStart}"/> ~
		<input type="date" name="regitDateEnd" value="${recipeSearch.regitDateEnd}"/> 
		<br/><br/>
		<select name="searchKey" required="required">
			<option value="">::선택::</option>
			<option value="recipe_code" <c:if test="${recipeSearch.searchKey eq 'recipe_code'}">selected="selected"</c:if>>레시피 코드</option>
			<option value="menu_code" <c:if test="${recipeSearch.searchKey eq 'menu_code'}">selected="selected"</c:if>>메뉴코드</option>
		</select>
		<input type="text" id="searchRecipe" name="searchRecipe" value="${recipeSearch.searchRecipe}"/>
		<input type="button" id="searchBtn" value="검색" /><a href="/viewrecipeList"><input type="button" value="전체보기"/></a>
	</form>
	<P>
		1:레시피 코드<span class="up">▲</span><span class="down">▼</span>
		2:조리 순서<span class="up">▲</span><span class="down">▼</span>
		3:조리 내용<span class="up">▲</span><span class="down">▼</span>
		4:레시피 등록 날짜<span class="up">▲</span><span class="down">▼</span>
		5:메뉴 코드<span class="up">▲</span><span class="down">▼</span>
		6:본사 승인 직원 ID

	</P>        
	<c:forEach var="recipeList" items="${subViewrecipeList}">	
		<p>
			1:${recipeList.recipeCode}
			2:${recipeList.recipeOrder}
			3:${recipeList.recipeAct}
			4:${recipeList.recipeRegitDate}
			5:${recipeList.menuCode}
			6:${recipeList.headStaffId}
		</p>	
	</c:forEach>
</body>
</html>