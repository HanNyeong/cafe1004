<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>viewSubStaffList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/function/upDownCheck.js"></script>
<script>
	$(document).ready(function(){
		var columnList = ['sub_staff_code','sub_staff_name','sub_staff_join','sub_staff_regit_date','sub_staff_salary','sub_staff_resign','sub_staff_permit_date']

		//컬럼별조회 위
		$('.up').each(function(index,item){
			$(item).click(function(){
				list('ASC',columnList[index],$('#subStaffList'));
			});
		});
		//컬럼별조회 아래
		$('.down').each(function(index,item){
			$(item).click(function(){
				list('DESC',columnList[index],$('#subStaffList'));
			});
		});
		//직원구분
		$('#divisionChange').change(function(){
			$('#division').val(($('#divisionChange').val()));
			$('#subStaffList').submit();
		});
		// 더보기
		$('#viewMoreBtn').click(function(){
			var viewMore = $('#viewMore').val();
			$('#viewMore').val(viewMore*1+25);
			$('#subStaffList').submit();
		});
		$('#searchBtn').click(function(){
			if($('#searchSubStaff').val() == ""){
				console.log("검색어입력하세요");
			}else{
				$('#subStaffList').submit();
			}
		});
		//권한체크
		$('#keeperCheckBtn').click(function(){
			$('#subStaffKeeperCheck').submit();
		});
	});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<c:if test="${subLogin == null or subStaff.subStaffLevel != '점주'}">
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div class="container">
				<form role="form" action="/subStaffKeeperCheck" method="POST" id="subStaffKeeperCheck">
					<h2>1급 제한 구역입니다.</h2>
					<div class="form-group">
						<input type="hidden" name="subCode" value="${subLogin.subCode}">
						<label for="subStaffCode">코드 : </label> 
						<input type="text" class="form-control" id="keeperCheck" name="subStaffCode" value="sub_staff_code1" />
					</div>
					<div class="form-group">
						<label for="subStaffPw">비밀번호 : </label> 
						<input type="text" class="form-control" id="keeperCheck" name="subStaffPw" value="1234" />
					</div>
					<div class="rightKeeperCheck">
						<input type="button" class="btn btn-default" id="keeperCheckBtn" value="확인">
					</div>
				</form>
			</div>
		</div>
		<div class="col-sm-4"></div>
	</div>
	<br />
</c:if>
<c:if test="${subStaff.subStaffLevel == '점주'}">
	<div class="row">
		<div class="col-sm-2">
		</div>	
		<div class="col-sm-8">
		<form id="subStaffList" action="/viewSubStaffList" method="POST">
			<input type="hidden" id="upDown" name="upDown" value="${subStaffSearch.upDown}" />
			<input type="hidden" id="criteria" name="criteria" value="${subStaffSearch.criteria}"/>
			<input type="hidden" id="viewMore" name="viewMore" value="${subStaffSearch.viewMore}"/>
			<input type="hidden" id="subCode" name="subCode" value="${subLogin.subCode}"/>
			<input type="hidden" id="division" name="division" value="${division}"/>
			<input type="hidden" id="subStaffLevel" name="subStaffLevel" value="${subStaff.subStaffLevel}"/>
			
			등록 날짜: 
			<input type="date" name="regitDateStart" value="${subStaffSearch.regitDateStart}"/> ~
			<input type="date" name="regitDateEnd" value="${subStaffSearch.regitDateEnd}"/> 
			<br/><br/>
			<select name="searchKey" required="required">
				<option value="">선택</option>
				<option value="sub_staff_code" <c:if test="${subStaffSearch.searchKey eq 'sub_staff_code'}">selected="selected"</c:if>>가맹 직원 ID</option>
				<option value="head_staff_id" <c:if test="${subStaffSearch.searchKey eq 'head_staff_id'}">selected="selected"</c:if>>본사 직원 ID</option>
				<option value="sub_staff_level" <c:if test="${subStaffSearch.searchKey eq 'sub_staff_level'}">selected="selected"</c:if>>직급</option>
			</select>
			<input type="text" id="search" name="search" value="${subStaffSearch.search}"/>
			<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
			<a href="/viewSubStaffList"><input type="button" class="btn btn-default"  value="전체보기"/></a>
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
			<h3>= 가맹 직원 리스트 =</h3>
		</div>
		<div class="col-sm-6 clickBtn">
			<select id="divisionChange" required="required">
				<option value="">전체조회</option>
				<option value="employee" <c:if test="${division eq 'employee'}">selected="selected"</c:if>>정직원</option>
				<option value="retirement" <c:if test="${division eq 'retirement'}">selected="selected"</c:if>>퇴사직원</option>
			</select>
			<a href="/subAddSubStaff"><input type="button" class="btn btn-default" value="직원등록"/></a>
		</div>
		<div class="col-sm-2">
		</div>	
	</div>
	<div class="row tablediv">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-1 th">
			직원코드<span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">
			이름(직급)<span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">
			입사일<span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">
			 등록일자<span class="up">▲</span><span class="down">▼</span>
		</div>
		<div class="col-sm-1 th">
			승인 날짜<span class="up">▲</span><span class="down">▼</span>
	    </div>
		<div class="col-sm-1 th">
			급여<span class="up">▲</span><span class="down">▼</span>
			 <!-- 급여는 가맹만 조회가능 -->
		</div>
		<div class="col-sm-1 th">
			 퇴사<span class="up">▲</span><span class="down">▼</span>
		</div>
	    <div class="col-sm-1 th">
	    	수정
		</div>
		<div class="col-sm-2">
		</div>
	</div>   
	<c:forEach var="subStaffList" items="${subStaffList}">
		<c:if test="${subLogin != null}">
			<div class="row tablediv">
			<div class="col-sm-2">
			</div>	
				<div class="col-sm-1">${subStaffList.subStaffCode}</div>
				<div class="col-sm-1">${subStaffList.subStaffName}(${subStaffList.subStaffLevel})</div>
				<div class="col-sm-1">${subStaffList.subStaffJoin}</div>
				<div class="col-sm-1">${subStaffList.subStaffRegitDate}</div>
				<div class="col-sm-1">${subStaffList.subStaffPermitDate}</div>
				<div class="col-sm-1">${subStaffList.subStaffSalary} 원
					<c:if test="${subStaffList.subStaffResign == null}">
						<a href="/subStaffSalary?subStaffCode=${subStaffList.subStaffCode}&subStaffSalary=${subStaffList.subStaffSalary}&subCode=${subStaffList.subCode}&subStaffLevel=${subStaff.subStaffLevel}">
						<input type="button" class="btn btn-default" value="지급"/></a>
					</c:if>
				</div>
				<div class="col-sm-1">${subStaffList.subStaffResign}
					<c:if test="${subStaffList.subStaffResign == null}">
						<a href="/subModifySubStaffByRegsign?subStaffCode=${subStaffList.subStaffCode}&subCode=${subStaffList.subCode}&subStaffLevel=${subStaff.subStaffLevel}">
						<input type="button" class="btn btn-default"  value="퇴사"/></a>
					</c:if>
				</div>
				<div class="col-sm-1">
					<c:if test="${subStaffList.subStaffResign == null}">
						<a href="/subModifySubStaff?subStaffCode=${subStaffList.subStaffCode}&subCode=${subStaffList.subCode}&subStaffLevel=${subStaff.subStaffLevel}">
						<input type="button" class="btn btn-default"  value="수정"/></a>
					</c:if>
				</div>
			<div class="col-sm-2">
			</div>
			</div>
		</c:if>	
	</c:forEach>
	<div class="row tablediv">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8">
			<input type="button" class="btn btn-default" id="viewMoreBtn" value="더보기"/>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
</c:if>
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>