<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/function/upDownCheck.js"></script>
<script>
	$(document).ready(function() {
		//컬럼 명 지정해주는 배열 
		//자기입맛에 맛게 고쳐 쓰세요
		var columnList = [ 'sub_account_code', 'sub_account_flow',
				'total_account_group', 
				'sub_account_price', 'sub_account_request_date',
				 'sub_account_detail',
				'subject_code', 'sub_client_code', 'sub_code']

		$('.up').each(function(index, item) {
			$(item).click(function() {
				list('ASC', columnList[index],$('#subAccountList'));
			});
		});
		$('.down').each(function(index, item) {
			$(item).click(function() {
				list('DESC', columnList[index],$('#subAccountList'));
			});
		});
		$('#viewMoreBtn').click(function(){
			var viewMore = $('#viewMore').val();
			$('#viewMore').val(viewMore*1+25);
			$('#subAccountList').submit();
		});
		$('#searchBtn').click(function() {
			if ($('#search').val() == "") {
				console.log("검색어입력하세요");
			} else {
				$('#subAccountList').submit();
			}
		});
		$('#deadLine').change(function(){
			$('#deadLine').val($('#deadLineSelect').val());
			$('#subAccountList').prop('action','/modifySubAccount');
			$('#subAccountList').submit();
		});
		
	});
	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/module/nav.jsp" />
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<c:if test="${subLogin == null or subStaff.subStaffLevel != '점주'}">
				<div class="container">
					<form role="form" action="/subAccountKeeperCheck" method="POST">
						<h2>1급 제한 구역입니다.</h2>
						<div class="form-group">
							<input type="hidden" name="subCode" value="${subLogin.subCode}">
							<label for="subStaffCode">코드 : </label> 
							<input type="text" class="form-control" id="keeperCheck" name="subStaffCode" value="sub_staff_code1" />
						</div>
						<div class="form-group">
							<label for="subStaffPw">비밀번호 : </label> <input type="text" class="form-control" id="keeperCheck" name="subStaffPw" value="1234" />
						</div>
						<div class="rightKeeperCheck">
							<input type="submit" class="btn btn-default" id="subAccountBtn" value="확인">
						</div>
					</form>
				</div>
			</c:if>
		</div>
		<div class="col-sm-4"></div>
	</div>
	<br />


	<c:if test="${subStaff.subStaffLevel == '점주'}">
		<div class="row">
			<div class="col-sm-2">
			</div>	
			<div class="col-sm-8">
			<form id="subAccountList" action="/viewSubAccountList" method="POST">
				<input type="hidden" id="upDown" name="upDown" value="" /> 
				<input type="hidden" id="criteria" name="criteria" value="" /> 
				<input type="hidden" id="subCode" name="subCode" value="${subLogin.subCode}" /> 
				<input type="hidden" id="subStaffLevel" name="subStaffLevel" value="${subStaff.subStaffLevel}" /> 
				
					등록 날짜: <input type="date" name="regitDateStart" value="${subAccountSearch.regitDateStart}" />
				~ <input type="date" name="regitDateEnd" value="${subAccountSearch.regitDateEnd}" /> 
				<br/>
				<br/> 
				<select name="searchKey" required="required">
					<option value="">::선택::</option>
					<option value="sub_account_code" <c:if test="${subAccountSearch.searchKey eq 'sub_account_code'}">selected="selected"</c:if>>통합회계코드</option>
					<option value="sub_account_flow" <c:if test="${subAccountSearch.searchKey eq 'sub_account_flow'}">selected="selected"</c:if>>입금내역</option>
					<option value="subject_code" <c:if test="${subAccountSearch.searchKey eq 'subject_code'}">selected="selected"</c:if>>출금내역</option>
					<option value="subject_code" <c:if test="${subAccountSearch.searchKey eq 'subject_code'}">selected="selected"</c:if>>가맹거래처명</option>
				</select> 
				<input type="text" id="search" name="search" value="${subAccountSearch.search}" />
				<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
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
					<h3>= 통합회계 =</h3>
				</div>
				<div class="col-sm-2">
				</div>
			</div>
				<div class="row tablediv">
					<div class="col-sm-2">
					</div>
					<div class="col-sm-1 th">
						통합코드<span class="up">▲</span><span class="down">▼</span>
					</div>
					<div class="col-sm-1 th">
						출급/입금 <span class="up">▲</span><span class="down">▼</span>
					</div>
					<div class="col-sm-2 th">
						통합 출/입금관련 그룹 코드<span class="up">▲</span><span class="down">▼</span> 
					</div>
					<div class="col-sm-1 th">
						 합계(금액)<span class="up">▲</span><span class="down">▼</span>
					</div>
					<div class="col-sm-1 th">
						등록 날짜<span class="up">▲</span><span class="down">▼</span>
				    </div>
					<div class="col-sm-1 th">
						상세 내역<span class="up">▲</span><span class="down">▼</span>
						 <!-- 급여는 가맹만 조회가능 -->
					</div>
					<div class="col-sm-1 th">
						 거래처코드<span class="up">▲</span><span class="down">▼</span>
					</div>
					<div class="col-sm-2">
					</div>
				</div>
	
			
				<c:forEach var="accountList" items="${subAccountList}">
					
					<div class="row tablediv">
						<div class="col-sm-2">
						</div>	
						<div class="col-sm-1">${accountList.subAccountCode}</div>
						<div class="col-sm-1">${accountList.subAccountFlow}</div>
						<div class="col-sm-2">${accountList.totalAccountGroup}</div>
						<div class="col-sm-1">${accountList.subAccountPrice}원</div>
						<div class="col-sm-1">${accountList.subAccountRequestDate}</div>
						<div class="col-sm-1">${accountList.subAccountDetail} </div>
						<div class="col-sm-1">${accountList.subClientCode}</div>
						<div class="col-sm-2">
						</div>
					</div>
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