<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subClientView</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$.list = function(upDown,criteria){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		$('#subClientList').submit();	
	}
	
	$(document).ready(function(){
		//컬럼 명 지정해주는 배열 
		//자기입맛에 맛게 고쳐 쓰세요
		var columnList = ['sub_client_code','sub_client_name','sub_client_regit_date','sub_client_in_charge','sub_client_contract','sub_client_phone','sub_client_addr']

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
			if($('#searchSubClient').val() == ""){
				console.log("검색어입력하세요");
			}else{
				$('#subClientList').submit();
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
	<form id="subClientList" action="/subViewSubClientList" method="POST">
		<input type="hidden" id="upDown" name="upDown" value="" />
		<input type="hidden" id="criteria" name="criteria" value=""/>
		<input type="hidden" id="subCode" name="subCode" value="${subLogin.subCode}"/>
		등록 날짜: 
		<input type="date" name="regitDateStart" value="${clientSearch.regitDateStart}"/> ~
		<input type="date" name="regitDateEnd" value="${clientSearch.regitDateEnd}"/> 
		<br/><br/>
		<select name="searchKey" required="required">
			<option value="">::선택::</option>
			<option value="sub_client_code" <c:if test="${clientSearch.searchKey eq 'sub_client_code'}">selected="selected"</c:if>>가맹거래처코드</option>
			<option value="sub_client_name" <c:if test="${clientSearch.searchKey eq 'sub_client_name'}">selected="selected"</c:if>>가맹거래처명</option>
		</select>
		<input type="text" id="searchSubClient" name="searchSubClient" value="${clientSearch.searchSubClient}"/>
		<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
		<a href="/subViewSubClientList?subCode=${subLogin.subCode}">
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
		<div class="col-sm-2">  
			<h3>= 가맹거래처목록 =</h3>
		</div>
		<div class="col-sm-6 clickBtn">			
			<a href="/subAddSubClient"><button  class="btn btn-default">거래처추가</button></a>
		</div>
	<div class="col-sm-2">
	</div>
</div>
<div class="row tablediv">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-1 th">	
		거래처코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		거래처명 <span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		등록일<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		담장자명<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		계약상태<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		연락처<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		주소<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		수정
	</div>
	<div class="col-sm-2">
	</div>
</div>
	<c:forEach var="clientList" items="${clientList}">
	<div class="row tablediv">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-1">${clientList.subClientCode}</div>
		<div class="col-sm-1">${clientList.subClientName}</div>
		<div class="col-sm-1">${clientList.subClientRegitDate}</div>
		<div class="col-sm-1">${clientList.subClientInCharge}</div>
		<div class="col-sm-1">${clientList.subClientContract}</div>
		<div class="col-sm-1">${clientList.subClientPhone}</div>
		<div class="col-sm-1">${clientList.subClientAddr}</div>
		<div class="col-sm-1">			
			<a href="/subModifySubClient?subClientCode=${clientList.subClientCode}">
				<button class="btn btn-default">수정</button>
			</a>			
		</div>
		<div class="col-sm-2">
		</div>
	</div>
	</c:forEach>
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>