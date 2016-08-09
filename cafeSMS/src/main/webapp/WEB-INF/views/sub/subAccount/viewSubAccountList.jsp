<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		//컬럼 명 지정해주는 배열 
		//자기입맛에 맛게 고쳐 쓰세요
		var columnList = [ 'sub_account_code', 'sub_account_flow',
				'total_account_group', 'sub_account_table',
				'sub_account_sum', 'sub_account_request_date',
				'sub_account_check', 'sub_account_detail',
				'subject_code', 'sub_client_code', 'sub_code',
				'sub_staff_code', 'sub_staff_keeper' ]

		$('.up').each(function(index, item) {
			$(item).click(function() {
				$.list('ASC', columnList[index],$('#subAccountList'));
			});
		});
		$('.down').each(function(index, item) {
			$(item).click(function() {
				$.list('DESC', columnList[index],$('#subAccountList'));
			});
		});
		$('#searchBtn').click(function() {
			if ($('#searchSubAccount').val() == "") {
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
		$('#ordersBtn').click(function() {
			if ($('.cartOrders:checked').size() < 1) {
				alert("1개 이상 체크해주세요");
				console.log("orders");
			} else {
				$('.cartOrders').each(function(index, item) {
					if (!$(this).is(":checked")) {
						console.log("체크안됨");
						$("input[class=subCode]:eq("+ index + ")").prop('name', '');
					} else if ($(this).is(":checked")) {
						console.log("체크됨");
					} else {
						console.log("안됨")
					}
				});
				$('#subAccountList').prop('action','/viewSubAccountList');
				$('#subAccountList').submit();
			}
		});
	});
	function checkAll(source) {
		var checkboxes = document.getElementsByName('accountListCheck');
		for (var i = 0; i < checkboxes.length; i++) {
			checkboxes[i].checked = source.checked; // '모두 체크'에 체크가 되면 다 체크하고 아니면 다 해제하고!
		}
	}
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
		<h1>가맹거래처목록</h1>
		<form id="subAccountList" action="/viewSubAccountList" method="POST">
			<input type="hidden" id="upDown" name="upDown" value="" /> 
			<input type="hidden" id="criteria" name="criteria" value="" /> 
			<input type="hidden" id="subCode" name="subCode" value="${subLogin.subCode}" /> 
			<input type="hidden" id="deadLine" name="deadLine" value="${subLogin.subCode}" /> 
			
				등록 날짜: <input type="date" name="regitDateStart" value="${subAccountSearch.regitDateStart}" />
			~ <input type="date" name="regitDateEnd" value="${subAccountSearch.regitDateEnd}" /> 
			<br/>
			<br/> 
			<select name="searchKey" required="required">
				<option value="">::선택::</option>
				<option value="sub_account_code" <c:if test="${subAccountSearch.searchKey eq 'sub_account_code'}">selected="selected"</c:if>>통합회계코드</option>
				<option value="sub_account_flow" <c:if test="${subAccountSearch.searchKey eq 'sub_account_flow'}">selected="selected"</c:if>>입금내역</option>
				<option value="subject_code" <c:if test="${subAccountSearch.searchKey eq 'subject_code'}">selected="selected"</c:if>>출금내역</option>
				<option value="sub_account_check" <c:if test="${subAccountSearch.searchKey eq 'sub_account_check'}">selected="selected"</c:if>>가맹거래처명</option>
			</select> 
			<input type="text" id="searchSubAccount" name="searchSubAccount" value="${subAccountSearch.searchSubAccount}" />
		
		<select id="deadLineSelect">
			<option value="">전체</option>
			<option value="deadLineAGo">마감전</option>
			<option value="deadLine">마감</option>
		</select>
		<input type="button" value="마감">
		<p>
			<input type="checkbox" id="checkAll" name="checkAll" onclick="checkAll(this)"> 1:가맹 통합 회계 전표 코드<span class="up">▲</span>
			<span class="down">▼</span> 2:출급/입금 <span class="up">▲</span>
			<span class="down">▼</span> 3:통합 출/입금관련 그룹 코드<span class="up">▲</span>
			<span class="down">▼</span> 5:합계(금액)<span class="up">▲</span>
			<span class="down">▼</span> 6:등록 날짜<span class="up">▲</span>
			<span class="down">▼</span> 7:마감 날짜<span class="up">▲</span>
			<span class="down">▼</span> 8:상세 내역<span class="up">▲</span>
			<span class="down">▼</span> 10:거래처코드<span class="up">▲</span>
			<span class="down">▼</span>
		</p>

		
			<c:forEach var="accountList" items="${subAccountList}">
				<div>
					<c:if test="${empty accountList.subStaffKeeper}">
						<input type="checkbox" class="accountListCheck" name="accountListCheck" value="${accountList.subAccountCode}">
					</c:if>
					${accountList.subAccountCode} ${accountList.subAccountFlow}
					${accountList.totalAccountGroup} ${accountList.subAccountSum}
					${accountList.subAccountRequestDate} ${accountList.subAccountCheck}
					${accountList.subAccountDetail} ${accountList.subClientCode}
				</div>
			</c:forEach>
		</form>
	</c:if>
</body>
</html>