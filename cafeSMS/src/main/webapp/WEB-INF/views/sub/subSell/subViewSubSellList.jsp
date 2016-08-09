<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/function/upDownCheck.js"></script>
<script>
	var list = function(upDown,criteria){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		$('#subSellList').submit();	
	}
	
	
	
	$(document).ready(function(){
		var columnList = ['sub_sell_code','inte_code','sub_sell_group','sub_sell_date','sub_sell_practical_selling_price','total_account_group','sub_sell_final','sub_sell_final_date','pay_method','sub_code','event_code','sub_staff_code','sub_sell_final_staff','sub_sell_cost']
		

		$('.up').each(function(index,item){
			$(item).click(function(){
				list('ASC',columnList[index]);
			});
		});
		$('.down').each(function(index,item){
			$(item).click(function(){
				list('DESC',columnList[index]);
			});
		});
		// 더보기
		$('#viewMoreBtn').click(function(){
			var viewMore = $('#viewMore').val();
			$('#viewMore').val(viewMore*1+25);
			$('#subSellList').submit();
		});
		$('#searchBtn').click(function(){
			if($('#search').val() == ""){
				console.log("검색어입력하세요");
			}else{
				$('#subSellList').submit();
			}
		});
		
		
		//selectYN
		$('#selectYN').on('change',function(){
			if($('#selectYN').val() == ''){
				$('#YN').val('');
				$('#subSellList').submit();
			}else if($('#selectYN').val() == 'Y'){
				$('#YN').val('Y');
				$('#subSellList').submit();
			}else if($('#selectYN').val() == 'N'){
				$('#YN').val('N');
				$('#subSellList').submit();
			}
			
			
		});
		
		
		// 주문 체크 되어 있는 값 추출
		$('#subSellFinalBtn').click(function(){
			if($('.checking:checked').size()<1){
		        alert("1개 이상 체크해주세요");
		        console.log("subSellFinal");
		    }else{
		    	$('.checking').each(function(index,item){
		    		if(!$(this).is(":checked")){
		    			console.log("체크안됨");
						}else if($(this).is(":checked")){
		    				console.log("체크됨");
						$("input[class=subSellCode]:eq(" + index + ")").prop('name','subSellCode');
						$("input[class=subCode]:eq(" + index + ")").prop('name','subCode');
		    			}else{
		    				console.log("안됨")
		    			}
		    	});
					$('#subSellList').prop('action','/subSellFinals');
					$('#subSellList').prop('method','POST');
					$('#subSellList').submit();
		    }
		});
		
		
	});
</script>
</head>



<body>
<a href="/">home</a>
	<h1>가맹 판매 리스트[승인처리리스트]</h1>
	<form id="subSellList" action="/subViewSubSellList" method="POST">
		<input type="hidden" id="upDown" name="upDown" value="${search.upDown}" />
		<input type="hidden" id="criteria" name="criteria" value="${search.criteria}"/>
		<input type="hidden" id="viewMore" name="viewMore" value="${search.viewMore}"/>
		<input type="hidden" id="subCode" name="subCode" value="${subCode}"/>
		<input type="hidden" id="YN"  name="YN" value="${YN}"/>
		
		
		등록 날짜: 
		<input type="date" name="regitDateStart" value="${search.regitDateStart}"/> ~
		<input type="date" name="regitDateEnd" value="${search.regitDateEnd}"/> 
		<br/><br/>
		<select name="searchKey" required="required">
			<option value="">::선택::</option>
			<option value="sub_sell_code" <c:if test="${search.searchKey eq 'sub_sell_code'}">selected="selected"</c:if>>sub_sell_code</option>
			<option value="inte_code" <c:if test="${search.searchKey eq 'inte_code'}">selected="selected"</c:if>>inte_code</option>
			<option value="sub_sell_group" <c:if test="${search.searchKey eq 'sub_sell_group'}">selected="selected"</c:if>>sub_sell_group</option>
			<option value="total_account_group" <c:if test="${search.searchKey eq 'total_account_group'}">selected="selected"</c:if>>total_account_group</option>
			<option value="pay_method" <c:if test="${search.searchKey eq 'pay_method'}">selected="selected"</c:if>>pay_method</option>
			<option value="event_code" <c:if test="${search.searchKey eq 'event_code'}">selected="selected"</c:if>>event_code</option>
			<option value="sub_staff_code" <c:if test="${search.searchKey eq 'sub_staff_code'}">selected="selected"</c:if>>sub_staff_code</option>
			<option value="sub_sell_final_staff" <c:if test="${search.searchKey eq 'sub_sell_final_staff'}">selected="selected"</c:if>>sub_sell_final_staff</option>
		</select>
		<input type="text" id="search" name="search" value="${search.search}"/>
		<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
		<a href="/subViewSubSellList?subCode=${subCode}"><input type="button" class="btn btn-default"  value="전체보기"/></a>
	
	
	분류 : 
	<select id="selectYN" required="required">
		<option value="" <c:if test="${YN eq ''}">selected="selected"</c:if>>::선택::</option>
		<option value="Y" <c:if test="${YN eq 'Y'}">selected="selected"</c:if>>마감Y</option>
		<option value="N" <c:if test="${YN eq 'N'}">selected="selected"</c:if>>마감N</option>
	</select>
	
	
	<div>
		전체선택<input type="checkbox" id="selectAll" class="selectAll" name="selectAll" onclick="selectAll(this)" value="전체 선택">
		subSellCode<span class="up">▲</span><span class="down">▼</span>
		inteCode<span class="up">▲</span><span class="down">▼</span>
		subSellGroup<span class="up">▲</span><span class="down">▼</span>
		subSellDate<span class="up">▲</span><span class="down">▼</span>
		subSellPracticalSellingPrice<span class="up">▲</span><span class="down">▼</span>
		totalAccountGroup<span class="up">▲</span><span class="down">▼</span>
		subSellFinal<span class="up">▲</span><span class="down">▼</span>
		subSellFinalDate<span class="up">▲</span><span class="down">▼</span>
		payMethod<span class="up">▲</span><span class="down">▼</span>
		subCode<span class="up">▲</span><span class="down">▼</span>
		eventCode<span class="up">▲</span><span class="down">▼</span>
		subStaffCode<span class="up">▲</span><span class="down">▼</span>
		subSellFinalStaff<span class="up">▲</span><span class="down">▼</span>
		subSellCost<span class="up">▲</span><span class="down">▼</span>
		[마감처리]
	</div>
	
	<div>
	<!-- 	<form id="subSellFinalForm" action="/subSellFinals" method="POST"> -->
		
		<c:forEach var="subSellList" items="${subSellList}">
			<c:if test="${YN eq '' || YN eq null}">
				<div>
					<c:if test="${subSellList.subSellFinal == 'N'}">
						<input type="checkbox" class="checking" name="checking">
						<input type="hidden" class="subSellCode" name="" value="${subSellList.subSellCode}">
						<input type="hidden" class="subCode" name="" value="${subSellList.subCode}">
					</c:if>					
						${subSellList.subSellCode}
						${subSellList.inteCode}
						${subSellList.subSellGroup}
						${subSellList.subSellDate}
						${subSellList.subSellPracticalSellingPrice}
						${subSellList.totalAccountGroup}
						${subSellList.subSellFinal}
						${subSellList.subSellFinalDate}
						${subSellList.payMethod}
						${subSellList.subCode}
						${subSellList.eventCode}
						${subSellList.subStaffCode}
						${subSellList.subSellFinalStaff}
						${subSellList.subSellCost}
					
						
					
								
					<c:if test="${subSellList.subSellFinal == 'Y'}">
						[마감완료]
					</c:if>					
				</div>
			</c:if>
			<c:if test="${subSellList.subSellFinal eq YN}">	
				<div>
					<c:if test="${subSellList.subSellFinal == 'N'}">
						<input type="checkbox" class="checking" name="checking">
						<input type="hidden" class="subSellCode" name="" value="${subSellList.subSellCode}">
						<input type="hidden" class="subCode" name="" value="${subSellList.subCode}">
					</c:if>		
					
					
					${subSellList.subSellCode}
					
					${subSellList.inteCode}
					${subSellList.subSellGroup}
					${subSellList.subSellDate}
					${subSellList.subSellPracticalSellingPrice}
					${subSellList.totalAccountGroup}
					${subSellList.subSellFinal}
					${subSellList.subSellFinalDate}
					${subSellList.payMethod}
					${subSellList.subCode}
					
					${subSellList.eventCode}
					${subSellList.subStaffCode}
					${subSellList.subSellFinalStaff}
					${subSellList.subSellCost}
							
					<c:if test="${subSellList.subSellFinal == 'Y'}">
						[마감완료]
					</c:if>					
				</div>
			</c:if>
		</c:forEach>
		<!-- </form> -->
		
		<input type="button" class="btn btn-default" id="subSellFinalBtn" value="마감"/>
		<input type="button" class="btn btn-default" id="viewMoreBtn" value="더보기"/>
	</div>
	</form>
</body>
</html>