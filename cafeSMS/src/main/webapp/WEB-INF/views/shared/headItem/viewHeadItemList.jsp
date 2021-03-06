<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>viewHeadItemList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	//삭제 체크 박스 전체 선택/해제
	function selectHeadItemAll(source) {
		var checkboxes = document.getElementsByName('headItemCheck');
			for(var i=0; i<checkboxes.length; i++) {
			checkboxes[i].checked = source.checked; // '모두 체크'에 체크가 되면 다 체크하고 아니면 다 해제하고!
		}
	}
	
	$(document).ready(function(){
		//컬럼 명 지정해주는 배열 
		//자기입맛에 맛게 고쳐 쓰세요
		var columnList = ['h_item_code','h_item_name','h_item_quantity','h_item_selling_price','h_item_regit_date','head_staff_id']

		$('.up').each(function(index,item){
			$(item).click(function(){
				list('ASC',columnList[index],$('#headItemForm'));
			});
		});
		$('.down').each(function(index,item){
			$(item).click(function(){
				list('DESC',columnList[index],$('#headItemForm'));
			});
		});
		// 더보기 clear
		$('#viewMoreBtn').click(function(){
		var viewMore = $('#viewMore').val();
			$('#viewMore').val(viewMore*1+25);
			$('#headItemForm').submit();
		});
		$('#cartBtn').click(function(){
			if($('.headItemCheck:checked').size()<1){
		        alert("1개 이상 체크해주세요");
		        console.log("orders");
		    }else{
		    	$('.headItemCheck').each(function(index,item){
		    		if(!$(this).is(":checked")){
		    			console.log("체크안됨");
		    			console.log($(this).is(":checked"));
						$("input[class=subCode]:eq(" + index + ")").prop('name','');
						$("input[class=cartQuantity]:eq(" + index + ")").prop('name','');
						$("input[class=hItemCode]:eq(" + index + ")").prop('name','');
						$("input[class=hItemSellingPrice]:eq(" + index + ")").prop('name','');
		    		}else if($(this).is(":checked")){
		    			console.log("체크됨");
		    		}else{
		    			console.log("안됨")
		    		}
		    	});
					$('#cartAndOrders').prop('method','POST');
					$('#cartAndOrders').submit();
		    }
		});
		//폼 제출 유효성
		undefinedEvent($('#searchBtn'),$('#headItemForm'),$('#valChekMsg'));
	 });
</script>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-2">
	</div>
	
	<div class="col-sm-8">
	<form id="headItemForm" action="/viewHeadItemList" method="POST">
		<input type="hidden" id="upDown" name="upDown" value="" />
		<input type="hidden" id="criteria" name="criteria" value=""/>
		<input type="hidden" id="viewMore" name="viewMore" value="${headItemSearch.viewMore}"/>
		등록 날짜: 
		<input type="date" id="regitDateStart" name="regitDateStart" value="${headItemSearch.regitDateStart}"/> ~
		<input type="date" id="regitDateEnd" name="regitDateEnd" value="${headItemSearch.regitDateEnd}"/> 
		<br/><br/>
		<select name="searchKey" required="required" valChek="검색 종류를 선택해주세요">
			<option value="">::선택::</option>
			<option value="h_item_code" <c:if test="${headItemSearch.searchKey eq 'h_item_code'}">selected="selected"</c:if>>아이템 코드</option>
			<option value="h_item_name" <c:if test="${headItemSearch.searchKey eq 'h_item_name'}">selected="selected"</c:if>>아이템 이름</option>
			<option value="h_item_quantity" <c:if test="${headItemSearch.searchKey eq 'h_item_quantity'}">selected="selected"</c:if>>아이템 갯수</option>
			<option value="h_item_selling_price" <c:if test="${headItemSearch.searchKey eq 'h_item_selling_price'}">selected="selected"</c:if>>가맹에 파는 가격</option>
			<option value="h_item_regit_date" <c:if test="${headItemSearch.searchKey eq 'h_item_regit_date'}">selected="selected"</c:if>>등록 날짜</option>
			<option value="head_staff_id" <c:if test="${headItemSearch.searchKey eq 'head_staff_id'}">selected="selected"</c:if>>등록한 사람</option>
		</select>
		<input type="text" id="searchHeadItem" name="search" value="${headItemSearch.search}" valChek="검색어를  입력해주세요"/>
		<input type="button" class="btn btn-default" id="searchBtn" value="검색" /> 
		<a href="/viewHeadItemList"><input type="button" class="btn btn-default" value="전체보기"/></a><br/>
		<span id="valChekMsg"></span>
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
			<h3>= 상품 리스트 =</h3>
		</div>
		<div class="col-sm-6 clickBtn">
			<input type="button" id="cartBtn" class="btn btn-default" value="장바구니담기">
		</div>
	<div class="col-sm-2">
	</div>
</div>
<div class="row tablediv">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-1 th">	
		아이템 코드<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		아이템 이름<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		아이템 갯수<span class="up">▲</span><span class="down">▼</span>	
	</div>
	<div class="col-sm-1 th">	
		아이템 단위<span class="up">▲</span><span class="down">▼</span>	
	</div>
	<div class="col-sm-1 th">	
		가맹 판매가<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		등록 날짜<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		등록한 사람<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		수량 <input type="checkbox" id="cartDeleteAll" class="cartCodeChk" name="cartDeleteAll" onclick="selectHeadItemAll(this)" value="전체 선택">
	</div>
	<div class="col-sm-2">
	</div>
</div>

	<form id="cartAndOrders" action="/subAddCart" method="POST">
			
		<c:forEach var="headItemList" items="${headItemList}">	
		<div class="row tablediv">
			<div class="col-sm-2">
			</div>	    
			
				<div class="col-sm-1">${headItemList.hItemCode}</div>
				<div class="col-sm-1">${headItemList.hItemName}</div>
				<div class="col-sm-1">${headItemList.hItemQuantity}</div>
				<div class="col-sm-1">${headItemList.hItemUnit}</div>
				<div class="col-sm-1">${headItemList.hItemSellingPrice}</div>
				<div class="col-sm-1">${headItemList.hItemRegitDate}</div>
				<div class="col-sm-1">${headItemList.headStaffId}</div>
				<div class="col-sm-1">
					<c:if test="${subLogin != null}">
						<input type="hidden" class="subCode" name="subCode" value="${subLogin.subCode}">
						<input type="hidden" class="hItemCode" name="hItemCode" value="${headItemList.hItemCode}">
						<input type="hidden" class="hItemSellingPrice" name="hItemSellingPrice" value="${headItemList.hItemSellingPrice}">
						<input type="number" class="cartQuantity" name="cartQuantity" min="1" value="1">
						<input type="checkbox" class="headItemCheck" name="headItemCheck" >
					</c:if>
				</div>
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
		<br/>

	</form>

<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>