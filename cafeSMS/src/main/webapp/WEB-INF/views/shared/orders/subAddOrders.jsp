<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>발주</h1>
	<c:choose>
		<!-- cart에서 넘어온값일때 -->
		<c:when test="${cartList.cartCode != null}">
		
		</c:when>
		<!-- headItem에서 넘어온값일때 -->
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>
</body>
</html>