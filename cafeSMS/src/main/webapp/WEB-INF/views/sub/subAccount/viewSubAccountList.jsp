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
		$('#subClientList').submit();	
	}
	
	$(document).ready(function(){
		//컬럼 명 지정해주는 배열 
		//자기입맛에 맛게 고쳐 쓰세요
		var columnList = ['sub_account_code','sub_account_flow','total_account_group','sub_account_table','sub_account_sum','sub_account_request_date','sub_account_check','sub_account_detail','subject_code','sub_client_code','sub_code','sub_staff_code','sub_staff_keeper']

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
			if($('#searchSubAccount').val() == ""){
				console.log("검색어입력하세요");
			}else{
				$('#subAccountList').submit();
			}
		});
		$('#ordersBtn').click(function(){
			if($('.cartOrders:checked').size()<1){
		        alert("1개 이상 체크해주세요");
		        console.log("orders");
		    }else{
		    	$('.cartOrders').each(function(index,item){
		    		if(!$(this).is(":checked")){
		    			console.log("체크안됨");
						$("input[class=cartCode]:eq(" + index + ")").prop('name','');
						$("input[class=cartQuantity]:eq(" + index + ")").prop('name','');
						$("input[class=hItemCode]:eq(" + index + ")").prop('name','');
						$("input[class=subCode]:eq(" + index + ")").prop('name','');
						$("input[class=hItemName]:eq(" + index + ")").prop('name','');
						$("input[class=hItemSellingPrice]:eq(" + index + ")").prop('name','');
		    			}else if($(this).is(":checked")){
		    				console.log("체크됨");
		    			}else{
		    				console.log("안됨")
		    			}
		    	});
					$('#cartListForm').submit();
		    }
		});
	});
	function checkAll(source) {
		var checkboxes = document.getElementsByName('.accountListCheck');
			for(var i=0; i<checkboxes.length; i++) {
			checkboxes[i].checked = source.checked; // '모두 체크'에 체크가 되면 다 체크하고 아니면 다 해제하고!
		}
	}
</script>
</head>
<body>
	<c:if test="${subLogin == null or subStaff.subStaffLevel != '점주'}">
		<h1>1급 제한 구역입니다.</h1>
		<form action="/subAccountKeeperCheck" method="POST">
			<input type="hidden" name="subCode" value="${subLogin.subCode}">
			<div>코드 : <input type="text" name="subStaffCode" /></div>
			<div>비밀번호 : <input type="text" name="subStaffPw" /></div>
			<input type="submit" id="subAccountBtn" value="확인">
		</form>
	</c:if>
	<c:if test="${subStaff.subStaffLevel == '점주'}">
		<h1>가맹거래처목록</h1>
		<form id="subAccountList" action="/viewSubAccountList" method="POST">
			<input type="hidden" id="upDown" name="upDown" value="" />
			<input type="hidden" id="criteria" name="criteria" value=""/>
			<input type="hidden" id="subCode" name="subCode" value="${subLogin.subCode}"/>
			등록 날짜: 
			<input type="date" name="regitDateStart" value="${subAccountSearch.regitDateStart}"/> ~
			<input type="date" name="regitDateEnd" value="${subAccountSearch.regitDateEnd}"/> 
			<br/><br/>
			<select name="searchKey" required="required">
				<option value="">::선택::</option>
				<option value="sub_account_code" <c:if test="${subAccountSearch.searchKey eq 'sub_account_code'}">selected="selected"</c:if>>통합회계코드</option>
				<option value="sub_account_flow" <c:if test="${subAccountSearch.searchKey eq 'sub_account_flow'}">selected="selected"</c:if>>입금내역</option>
				<option value="subject_code" <c:if test="${subAccountSearch.searchKey eq 'subject_code'}">selected="selected"</c:if>>출금내역</option>
				<option value="sub_account_check" <c:if test="${subAccountSearch.searchKey eq 'sub_account_check'}">selected="selected"</c:if>>가맹거래처명</option>
			</select>
			<input type="text" id="searchSubAccount" name="searchSubAccount" value="${subAccountSearch.searchSubAccount}"/>
		</form>
		<p>
			<input type="checkbox" id="checkAll" name="checkAll" onclick="checkAll(this)">
			1:가맹 통합 회계 전표 코드<span class="up">▲</span><span class="down">▼</span>
			2:출급/입금 <span class="up">▲</span><span class="down">▼</span>
			3:통합 출/입금관련 그룹 코드<span class="up">▲</span><span class="down">▼</span>
			4:해당 테이블 명<span class="up">▲</span><span class="down">▼</span>
			5:합계(금액)<span class="up">▲</span><span class="down">▼</span>
			6:직원 요청 날짜<span class="up">▲</span><span class="down">▼</span>
			7:가맹 점주 확인 날짜<span class="up">▲</span><span class="down">▼</span>
			8:상세 내역<span class="up">▲</span><span class="down">▼</span>
			9:계정 과목 코드<span class="up">▲</span><span class="down">▼</span>
			10:가맹 거래처 코드<span class="up">▲</span><span class="down">▼</span>
			11:가맹 대표 번호<span class="up">▲</span><span class="down">▼</span>
			12:가맹 등록자 아이디<span class="up">▲</span><span class="down">▼</span>
			13:가맹 점주 아이디<span class="up">▲</span><span class="down">▼</span>
		</p>
	
		<form action="/" method="POST">
			<c:forEach var="accountList" items="${subAccountList}">
				<div>
					<c:if test="${empty accountList.subStaffKeeper}">
						<input type="checkbox" class="accountListCheck" name="accountListCheck">
					</c:if>
					${accountList.subAccountCode}
					${accountList.subAccountFlow}
					${accountList.totalAccountGroup}
					${accountList.subAccountTable}
					${accountList.subAccountSum}
					${accountList.subAccountRequestDate}
					${accountList.subAccountCheck}
					${accountList.subAccountDetail}
					${accountList.subjectCode}
					${accountList.subClientCode}
					${accountList.subCode}
					${accountList.subStaffCode}
					${accountList.subStaffKeeper}	
				</div>
			</c:forEach>
		</form>
	</c:if>
</body>
</html>