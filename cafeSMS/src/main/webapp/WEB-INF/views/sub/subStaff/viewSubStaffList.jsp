<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>viewSubStaffList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$.list = function(upDown,criteria){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		$('#subStaffList').submit();	
	}
	$(document).ready(function(){
		var columnList = ['sub_staff_code','sub_staff_name','sub_staff_level','sub_staff_join','sub_staff_resign','sub_staff_salary','sub_staff_regit_date','head_staff_id','sub_staff_permit_date']

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
		$('.subSalaryBtn').each(function(index,item){
			$(item).click(function(){
				$('.subSalaryForm')[index].submit();
			});	
		});
		
	});
</script>
</head>
<body>
	<form id="subStaffList" action="/viewSubStaffList" method="POST">
		<input type="hidden" id="upDown" name="upDown" value="" />
		<input type="hidden" id="criteria" name="criteria" value=""/>
		<input type="hidden" id="subCode" name="subCode" value="${subLogin.subCode}"/>
		등록 날짜: 
		<input type="date" name="regitDateStart" value="${subStaffSearch.regitDateStart}"/> ~
		<input type="date" name="regitDateEnd" value="${subStaffSearch.regitDateEnd}"/> 
		<br/><br/>
		<select name="searchKey" required="required">
			<option value="">::선택::</option>
			<option value="sub_staff_code" <c:if test="${subStaffSearch.searchKey eq 'sub_staff_code'}">selected="selected"</c:if>>가맹 직원 ID</option>
			<option value="head_staff_id" <c:if test="${subStaffSearch.searchKey eq 'head_staff_id'}">selected="selected"</c:if>>본사 직원 ID</option>
			<option value="sub_staff_level" <c:if test="${subStaffSearch.searchKey eq 'sub_staff_level'}">selected="selected"</c:if>>직급</option>
<!-- 			<option value="sub_keeper">현재직원</option>  추가 하고 싶은 기능 입니다.--> 
<!-- 			<option value="sub_telephone">퇴사직원</option> -->
			<!-- 승인여부는 본사측 기능입니다. -->
		</select>
		<input type="text" id="searchSubStaff" name="searchSubStaff" value="${subStaffSearch.searchSubStaff}"/>
		<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
		<a href="/viewSubStaffList"><input type="button" class="btn btn-default"  value="전체보기"/></a>
	</form>
	<div>
		<a href="/subAddSubStaff"><input type="button" class="btn btn-default" value="가맹등록"/></a>
	</div>
	<P>
		1:가맹 직원 코드<span class="up">▲</span><span class="down">▼</span>
		2:직원 이름<span class="up">▲</span><span class="down">▼</span>
		3:직급<span class="up">▲</span><span class="down">▼</span>
		4:입사일<span class="up">▲</span><span class="down">▼</span>
		5: 퇴사일<span class="up">▲</span><span class="down">▼</span>
		6:급여<span class="up">▲</span><span class="down">▼</span>
		 <!-- 급여는 가맹만 조회가능 -->
		7: 등록일자<span class="up">▲</span><span class="down">▼</span>
		8:본사 승인 직원 ID<span class="up">▲</span><span class="down">▼</span>
		9:승인 날짜<span class="up">▲</span><span class="down">▼</span>
	</P>        
	<c:forEach var="subStaffList" items="${subStaffList}">
	
		<p>
			1:${subStaffList.subStaffCode}
			2:${subStaffList.subStaffName}
			3:${subStaffList.subStaffLevel}
			4:${subStaffList.subStaffJoin}
			5:${subStaffList.subStaffResign}
			6:${subStaffList.subStaffSalary}
			7:${subStaffList.subStaffRegitDate}
			8:${subStaffList.headStaffId}
			9:${subStaffList.subStaffPermitDate}
			<c:if test="${subLogin != null}">
				<a href="/subModifySubStaff?subStaffCode=${subStaffList.subStaffCode}">
				<input type="button" class="btn btn-default"  value="수정"/></a>
				<c:if test="${subStaffList.subStaffResign == null}">
					<a href="/subModifySubStaffByRegsign?subStaffCode=${subStaffList.subStaffCode}&subCode=${subStaffList.subCode}">
					<input type="button" class="btn btn-default"  value="퇴사"/></a>
					<a href="/subAddSubAccount?subStaffCode=${subStaffList.subStaffCode}">
					<input type="button" class="btn btn-default" value="급여지금"/></a>
				</c:if>
			</c:if>
		</p>
	
	</c:forEach>
</body>
</html>