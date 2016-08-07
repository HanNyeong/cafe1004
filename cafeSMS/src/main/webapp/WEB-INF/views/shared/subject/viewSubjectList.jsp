<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$.list = function(upDown,criteria){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		$('#subjectList').submit();	
	}
	
	$(document).ready(function(){
		var columnList = ['subject_code','subject_name','subject_content']

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
			if($('#searchSubject').val() == ""){
				console.log("검색어입력하세요");
			}else{
				$('#subjectList').submit();
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
		<form id="subjectList" action="/viewSubjectList" method="POST">
			<input type="hidden" id="upDown" name="upDown" value="" />
			<input type="hidden" id="criteria" name="criteria" value=""/>
			<%-- <input type="hidden" id="subCode" name="subCode" value="${subLogin.subCode}"/> --%>
			등록 날짜: 
			<input type="date" name="regitDateStart" value="${subjectSearch.regitDateStart}"/> ~
			<input type="date" name="regitDateEnd" value="${subjectSearch.regitDateEnd}"/> 
			<br/><br/>
			<select name="searchKey" required="required">
				<option value="">::선택::</option>
				<option value="subject_code" <c:if test="${subjectSearch.searchKey eq 'subject_code'}">selected="selected"</c:if>>가맹거래처코드</option>
				<option value="subject_name" <c:if test="${subjectSearch.searchKey eq 'subject_name'}">selected="selected"</c:if>>가맹거래처명</option>
			</select>
			<input type="text" id="searchSubject" name="searchSubject" value="${subjectSearch.searchSubject}"/>
			<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
			<a href="/viewSubjectList"><input type="button" class="btn btn-default" value="전체보기"/></a>
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
		<h3>= 계정과목목록 =</h3>
		</div>
	<div class="col-sm-2">
	</div>	
</div>
<div class="row tablediv">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-2 th">
		계정과목코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-2 th">
		계정과목명<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-2 th">
		계정과목상세내용<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-2 th">
		계정과목등록일자<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-2">
	</div>
</div>
	<c:forEach var="subjectList" items="${subjectList}">
	<div class="row tablediv">
		<div class="col-sm-2">
		</div>	
			<div class="col-sm-2">${subjectList.subjectCode}</div>
			<div class="col-sm-2">${subjectList.subjectName}</div>
			<div class="col-sm-2">${subjectList.subjectContent}</div>
			<div class="col-sm-2">${subjectList.subjectRegitDate}</div>
		<div class="col-sm-2">
		</div>
	</div>		
	</c:forEach>
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>