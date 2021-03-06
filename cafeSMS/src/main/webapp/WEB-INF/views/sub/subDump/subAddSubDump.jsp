<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subAddSubDump</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
	//폼 제출 유효성
	 var check = undefinedEvent($('#addSubDumpBtn'),$('#addSubDumpForm'),$('#valChekMsg'));
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-5">
	</div>
		<div class="col-sm-2 addForm">
			<h1> 폐기 등록 </h1>
		<form action="/subAddSubDump" method="POST" id="addSubDumpForm">
		 	<div>
			   	<input type="hidden" name="subStockCode" value="${subDump.subStockCode}"/>
			   	<p>폐기 사유 : <input type="text" id="subDumpReason" name="subDumpReason" value="" valChek="폐기 사유를 입력해주세요"></p>
				<p>본사 상품 코드 : <input type="text" class="inputNoLine" id="headItemCode" name="headItemCode" readonly="readonly" value="${subDump.headItemCode}"/></p>
				<p>개별 상품 코드: <input type="text" class="inputNoLine" id="specificItemCode" name="specificItemCode" readonly="readonly" value="${subDump.specificItemCode}"/></p>
				<p>가맹 담당 직원 : <input type="text" id="subStaffCode" name="subStaffCode" value="" valChek="담당 직원 아이디를 입력해주세요"/></p>
				<p>가맹대표코드 : <input type="text" class="inputNoLine" id="subCode" name="subCode" readonly="readonly" value="${subDump.subCode}"/></p>
			</div>	
			<br/>
			<div class="clickBtn">
				<span id="valChekMsg"></span>	
			    <input type="button" id="addSubDumpBtn" class="btn btn-default" name="addSubDumpBtn" value="등록"/>      
			</div>
			<br/>
			
		</form> 
		</div>
	<div class="col-sm-5">
	</div>
</div>
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>