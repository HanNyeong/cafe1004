<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>viewHeadItemList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$.list = function(upDown,criteria){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		$('#headItemForm').submit();	
	}
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
		var columnList = ['h_item_code','h_item_name','inte_code','h_item_quantity','h_item_unit','h_item_selling_price','h_item_regit_date','head_staff_id','h_item_regit_price','h_item_regit_date','head_staff_id','h_item_regit_price']

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
			if($('#searchHeadItem').val() == ""){
				console.log("검색어입력하세요");
			}else{
				$('#headItemForm').submit();
			}
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
		등록 날짜: 
		<input type="date" name="regitDateStart" value="${headItemSearch.regitDateStart}"/> ~
		<input type="date" name="regitDateEnd" value="${headItemSearch.regitDateEnd}"/> 
		<br/><br/>
		<select name="searchKey" required="required">
			<option value="">::선택::</option>
			<option value="h_item_code" <c:if test="${headItemSearch.searchKey eq 'h_item_code'}">selected="selected"</c:if>>아이템 코드</option>
			<option value="h_item_name" <c:if test="${headItemSearch.searchKey eq 'h_item_name'}">selected="selected"</c:if>>아이템 이름</option>
			<option value="inte_code" <c:if test="${headItemSearch.searchKey eq 'inte_code'}">selected="selected"</c:if>>상품메뉴통합코드</option>
			<option value="h_item_quantity" <c:if test="${headItemSearch.searchKey eq 'h_item_quantity'}">selected="selected"</c:if>>아이템 갯수</option>
			<option value="h_item_unit" <c:if test="${headItemSearch.searchKey eq 'h_item_unit'}">selected="selected"</c:if>>박스 또는 개별</option>
			<option value="h_item_selling_price" <c:if test="${headItemSearch.searchKey eq 'h_item_selling_price'}">selected="selected"</c:if>>가맹에 파는 가격</option>
			<option value="h_item_regit_date" <c:if test="${headItemSearch.searchKey eq 'h_item_regit_date'}">selected="selected"</c:if>>등록 날짜</option>
			<option value="head_staff_id" <c:if test="${headItemSearch.searchKey eq 'head_staff_id'}">selected="selected"</c:if>>등록한 사람</option>
			<option value="h_item_regit_price" <c:if test="${headItemSearch.searchKey eq 'h_item_regit_price'}">selected="selected"</c:if>>소비자가격</option>
			
		</select>
		<input type="text" id="searchHeadItem" name="searchHeadItem" value="${headItemSearch.searchHeadItem}"/>
		<input type="button" class="btn btn-default" id="searchBtn" value="검색" /> <a href="/viewHeadItemList"><input type="button" class="btn btn-default" value="전체보기"/></a>
		
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
		<div class="col-sm-8 cartBtn">
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
		가맹 판매가<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		등록 날짜<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		등록한 사람<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		소비자가격<span class="up">▲</span><span class="down">▼</span>
	</div>
	<div class="col-sm-1 th">	
		<input type="checkbox" id="cartDeleteAll" class="cartCodeChk" name="cartDeleteAll" onclick="selectHeadItemAll(this)" value="전체 선택">
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
				<div class="col-sm-1">${headItemList.hItemQuantity}(${headItemList.hItemUnit})</div>
				<div class="col-sm-1">${headItemList.hItemSellingPrice}</div>
				<div class="col-sm-1">${headItemList.hItemRegitDate}</div>
				<div class="col-sm-1">${headItemList.headStaffId}</div>
				<div class="col-sm-1">${headItemList.hItemRetailPrice}</div>
				<div class="col-sm-1">
					<c:if test="${subLogin != null}">
						<input type="hidden" class="subCode" name="subCode" value="${subLogin.subCode}">
						<input type="hidden" class="hItemCode" name="hItemCode" value="${headItemList.hItemCode}">
						<input type="number" class="cartQuantity" name="cartQuantity" min="1">
						<input type="checkbox" class="headItemCheck" name="headItemCheck" >
					</c:if>
				</div>
			<div class="col-sm-2">
			</div>
		</div>
		</c:forEach>
		<br/>

	</form>

<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>