<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>viewSubStaffList</title>
<style>
	table,tr,td{
		border: 1px solid black;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$.list = function(upDown,criteria){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		$('#subStaffList').submit();	
	}
	
	$(document).ready(function(){
		//컬럼 명 지정해주는 배열 
		//자기입맛에 맛게 고쳐 쓰세요
		var columnList = ['sub_staff_id','sub_code','sub_staff_join','sub_staff_resign','sub_staff_salary','sub_staff_regit_date','sub_staff_permit_date']

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
			if($('#searchSubStaff').val() == ""){
				console.log("검색어입력하세요");
			}else{
				$('#subStaffList').submit();
			}
		});
		
		$('#subSalary').click(function(){
			if($('#subSalayYard').text() == ''){
				$('#subSalayYard').text('<input type="text" name="subStaffSalary" id="subStaffSalary"/>')
			}else if($('#subStaffSalary') == ''){
				alert('급여를 입력해주세요');
			}else{
				$('#subSalaryForm').submit();
			}
			
			
		});
	});
</script>
</head>
<body>

	<form id="subStaffList" action="/viewSubStaffList" method="POST">
		<input type="hidden" id="upDown" name="upDown" value="" />
		<input type="hidden" id="criteria" name="criteria" value=""/>
		등록 날짜: 
		<input type="date" name="regitDateStart" value="${subStaffSearch.regitDateStart}"/> ~
		<input type="date" name="regitDateEnd" value="${subStaffSearch.regitDateEnd}"/> 
		<br/><br/>
		<select name="searchKey" required="required">
			<option value="">::선택::</option>
			<option value="sub_staff_id" <c:if test="${subStaffSearch.searchKey eq 'sub_staff_id'}">selected="selected"</c:if>>가맹 직원 ID</option>
			<option value="sub_code" <c:if test="${subStaffSearch.searchKey eq 'sub_code'}">selected="selected"</c:if>>가맹대표코드</option>
			<option value="head_staff_id" <c:if test="${subStaffSearch.searchKey eq 'head_staff_id'}">selected="selected"</c:if>>본사 직원 ID</option>
			<option value="sub_staff_level" <c:if test="${subStaffSearch.searchKey eq 'sub_staff_level'}">selected="selected"</c:if>>직급</option>
<!-- 			<option value="sub_keeper">현재직원</option>  추가 하고 싶은 기능 입니다.--> 
<!-- 			<option value="sub_telephone">퇴사직원</option> -->
			<option value="joinPermit" <c:if test="${subStaffSearch.searchKey eq 'joinPermit'}">selected="selected"</c:if>>승인여부</option>
			<!-- 승인여부는 본사측 기능입니다. -->
		</select>
		<input type="text" id="searchSubStaff" name="searchSubStaff" value="${subStaffSearch.searchSubStaff}"/>
		<input type="button" id="searchBtn" value="검색" /><a href="/viewSubStaffList"><input type="button" value="전체보기"/></a>
	</form>
   <div>
      <a href="/subAddSubStaff"><input type="button" value="가맹등록"/></a>
   </div>
   <table>
         <tr>
            <th>가맹 직원 ID<span class="up">▲</span><span class="down">▼</span></th>
            <th>직원 이름</th>
            <th>가맹 대표 코드<span class="up">▲</span><span class="down">▼</span></th>
            <th>직급</th>
            <th>입사일<span class="up">▲</span><span class="down">▼</span></th>
            <th>퇴사일<span class="up">▲</span><span class="down">▼</span></th>
            <th>급여<span class="up">▲</span><span class="down">▼</span></th>
           	<!-- 급여는 가맹만 조회가능 -->
            <th>등록일자<span class="up">▲</span><span class="down">▼</span></th>
            <th>본사 승인 직원 ID</th>
            <th>승인 날짜<span class="up">▲</span><span class="down">▼</span></th>
            <th></th>
         </tr>
      <c:forEach var="subStaffList" items="${subStaffList}">
         <tr>
            <td>${subStaffList.subStaffId}</td>
            <td>${subStaffList.subStaffName}</td>
            <td>${subStaffList.subCode}</td>
            <td>${subStaffList.subStaffLevel}</td>
            <td>${subStaffList.subStaffJoin}</td>
            <td>${subStaffList.subStaffResign}</td>
            <td>${subStaffList.subStaffSalary}</td>
            <td>${subStaffList.subStaffRegitDate}</td>
            <td>${subStaffList.headStaffId}</td>
            <td>${subStaffList.subStaffPermitDate}</td>
            <td>
            	<c:if test="${subStaffLogin != null}">
            		<a href="/subModifySubStaff?subStaffId=${subStaffList.subStaffId}"><input type="button" value="수정"/></a>
            		<a href="/subModifySubStaffByRegsign?subStaffId=${subStaffList.subStaffId}"><input type="button" value="퇴사"/></a>
            		<form action="" method="POST" class="subSalaryForm">
            			<span class="subSalayYard"></span>
	            		<input type="button" class="subSalary" name="subSalary" value="급여지급"/>
            		</form>
           		</c:if>
            	<c:if test="${subStaffList.subStaffPermitDate == null and headStaffLogin != null}">
	            	<a href="/headModifySubStaffByPermit?subStaffId=${subStaffList.subStaffId}"><input type="button" value="승인"></a>
            	</c:if>
            </td>
         </tr>
      </c:forEach>
   </table>
   <form action="/subStaffSalary" method="POST" id="subSalaryForm">
		<span id="subSalayYard"></span>
   		<input type="button" id="subSalary" name="subSalary" value="급여지급"/>
	</form>
	
</body>
</html>