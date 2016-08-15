<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subviewRecipeList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>

<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-6">
		<h3>= ${menuName} =</h3>
	</div>
	<div class="col-sm-2 clickBtn">
		<a href="/subViewMenuList"><input type="button" class="btn btn-default" value="메뉴보기"/></a>
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<div class="row tablediv">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-1 th">
		레시피 코드
	</div>
	<div class="col-sm-1 th">	
		조리 순서
	</div>
	<div class="col-sm-2 th">
		조리 내용
	</div>
	<div class="col-sm-2 th">	
		레시피 등록 날짜
	</div>
	<div class="col-sm-1 th">
		메뉴 코드
	</div>
	<div class="col-sm-1 th">	
		본사승인직원ID
	</div>
	<div class="col-sm-2">
	</div>
</div>	

       
	<c:forEach var="recipeList" items="${subViewRecipeList}">	
	<div class="row tablediv">
		<div class="col-sm-2">
		</div>	 
			<div class="col-sm-1">${recipeList.recipeCode}</div>
			<div class="col-sm-1">${recipeList.recipeOrder}</div>
			<div class="col-sm-2">${recipeList.recipeAct}</div>
			<div class="col-sm-2">${recipeList.recipeRegitDate}</div>
			<div class="col-sm-1">${recipeList.menuCode}</div>
			<div class="col-sm-1">${recipeList.headStaffId}</div>
		<div class="col-sm-2">
		</div>
	</div>	
	</c:forEach>
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>