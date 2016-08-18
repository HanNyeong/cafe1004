<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subViewSubSellList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	
	$(document).ready(function(){
		var columnList = ['sub_sell_code','menu_code','sub_sell_group','sub_sell_date','sub_sell_practical_selling_price','pay_method','sub_sell_final_staff']
		

		$('.up').each(function(index,item){
			$(item).click(function(){
				list('ASC',columnList[index],$("#subSellList"));
			});
		});
		$('.down').each(function(index,item){
			$(item).click(function(){
				list('DESC',columnList[index],$("#subSellList"));
			});
		});
		// 더보기
		$('#viewMoreBtn').click(function(){
			var viewMore = $('#viewMore').val();
			$('#viewMore').val(viewMore*1+25);
			$('#subSellList').submit();
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
					
					$('#subSellFinals').submit();
		    }
		});
		//폼 제출 유효성
		undefinedEvent($('#searchBtn'),$('#subSellList'),$('#valChekMsg'));
	});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-8">
		<form id="subSellList" action="/subViewSubSellList" method="POST">
			<input type="hidden" id="upDown" name="upDown" value="${search.upDown}" />
			<input type="hidden" id="criteria" name="criteria" value="${search.criteria}"/>
			<input type="hidden" id="viewMore" name="viewMore" value="${search.viewMore}"/>
			<input type="hidden" id="subCode" name="subCode" value="${subCode}"/>
			
			<input type="hidden" id="YN"  name="YN" value="${YN}"/>
			
			
			등록 날짜: 
			<input type="date" id="regitDateStart" name="regitDateStart" value="${search.regitDateStart}"/> ~
			<input type="date" id="regitDateEnd" name="regitDateEnd" value="${search.regitDateEnd}"/> 
			<br/><br/>
			<select name="searchKey" required="required" valChek="검색 종류를 선택해주세요">
				<option value="">::선택::</option>
				<option value="sub_sell_code" <c:if test="${search.searchKey eq 'sub_sell_code'}">selected="selected"</c:if>>판매코드</option>
				<option value="menu_code" <c:if test="${search.searchKey eq 'menu_code'}">selected="selected"</c:if>>메뉴코드</option>
				<option value="pay_method" <c:if test="${search.searchKey eq 'pay_method'}">selected="selected"</c:if>>결제방식</option>
				<option value="sub_sell_final_staff" <c:if test="${search.searchKey eq 'sub_sell_final_staff'}">selected="selected"</c:if>>마감담당자</option>
			</select>
			<input type="text" id="search" name="search" value="${search.search}"  valChek="검색어를 입력해주세요"/>
			<input type="button" id="searchBtn" class="btn btn-default" value="검색" />
			<a href="/subViewSubSellList?subCode=${subCode}"><input type="button" class="btn btn-default"  value="전체보기"/></a>
			<br/><span id="valChekMsg"></span>
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
	<div class="col-sm-6">
		<a href="/subSellSignUp?subCode=${subCode}">[판매등록]</a>
		<h3>가맹 판매 리스트[승인처리리스트]</h3>
	</div>
	<div class="col-sm-2 clickBtn">
		<h4>분류 : 
			<select id="selectYN" required="required">
				<option value="" <c:if test="${YN eq ''}">selected="selected"</c:if>>::선택::</option>
				<option value="Y" <c:if test="${YN eq 'Y'}">selected="selected"</c:if>>마감Y</option>
				<option value="N" <c:if test="${YN eq 'N'}">selected="selected"</c:if>>마감N</option>
			</select>
			<input type="button" class="btn btn-default" id="subSellFinalBtn" value="마감"/>
		</h4>
	</div>
	<div class="col-sm-2">
	</div>	
</div>
<div class="row tablediv">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-1 th">	
		판매코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		메뉴코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">
		판매그룹<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-2 th">	
		판매날짜<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		원가→판매가<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		결제방식<span class="up">▲</span><span class="down">▼</span>
	</div>

	<div class="col-sm-1 th">	
		<input type="checkbox" id="selectAll" class="selectAll" name="selectAll" onclick="selectAll(this)" value="전체 선택">
		/마감
	</div>
	<div class="col-sm-2">
	</div>
</div>
	
<form action="/subSellFinals" method="post" id="subSellFinals">
	<c:forEach var="subSellList" items="${subSellList}">
		
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>	
			<div class="col-sm-1">${subSellList.subSellCode}</div>
			<div class="col-sm-1">${subSellList.menuCode}</div>
			<div class="col-sm-1">${subSellList.subSellGroup}</div>
			<div class="col-sm-2">${subSellList.subSellDate}</div>
			<div class="col-sm-1">${subSellList.subSellCost}→${subSellList.subSellPracticalSellingPrice}</div>
			<div class="col-sm-1">${subSellList.payMethod}</div>
				
			<div class="col-sm-1">
				<c:if test="${subSellList.subSellFinal == 'N'}">
					<input type="checkbox" class="checking" name="checking">
					<input type="hidden" class="subSellCode" name="" value="${subSellList.subSellCode}">
					<input type="hidden" class="subCode" name="" value="${subSellList.subCode}">
				</c:if>					
				<c:if test="${subSellList.subSellFinal == 'Y'}">
					[마감완료]
				</c:if>					
			</div>	
			<div class="col-sm-2">
			</div>
		</div>
	
	</c:forEach>
</form>
<div class="row tablediv">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-8">
		<input type="button" class="btn btn-default" id="viewMoreBtn" value="더보기"/>
	</div>
	<div class="col-sm-2">
	</div>
</div>		
	
<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>