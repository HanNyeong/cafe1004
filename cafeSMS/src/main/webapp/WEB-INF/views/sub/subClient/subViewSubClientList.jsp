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
	<h1>가맹거래처목록</h1>
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
		<input type="button" id="searchBtn" value="검색" /><a href="/subViewSubClientList?subCode=${subLogin.subCode}"><input type="button" value="전체보기"/></a>
	</form>
		<p>
			1:거래처코드<span class="up">▲</span><span class="down">▼</span>
			2:거래처명 <span class="up">▲</span><span class="down">▼</span>
			3:거래처등록일<span class="up">▲</span><span class="down">▼</span>
			4:거래처담당자명<span class="up">▲</span><span class="down">▼</span>
			5:거래처계약상태<span class="up">▲</span><span class="down">▼</span>
			6:거래처연락처<span class="up">▲</span><span class="down">▼</span>
			7:거래처주소<span class="up">▲</span><span class="down">▼</span>
		</p>
		<c:forEach var="clientList" items="${clientList}">
		<p>
			1:${clientList.subClientCode}
			2:${clientList.subClientName}
			3:${clientList.subClientRegitDate}
			4:${clientList.subClientInCharge}
			5:${clientList.subClientContract}
			6:${clientList.subClientPhone}
			7:${clientList.subClientAddr}
		</p>
			<button><a href="/subModifySubClient?subClientCode=${clientList.subClientCode}">정보수정</a></button>
	</c:forEach>
	<div>
		<button><a href="/subAddSubClient">거래처추가</a></button>
	</div>
</body>
</html>