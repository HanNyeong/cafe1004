<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>subviewMenuList</title>
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
		<input type="button" id="searchBtn" value="검색" /><a href="/viewHeadItemList"><input type="button" value="전체보기"/></a>
		
	</form>
	<P>
		1:아이템 코드<span class="up">▲</span><span class="down">▼</span>
		2:아이템 이름<span class="up">▲</span><span class="down">▼</span>
		3:상품메뉴통합코드<span class="up">▲</span><span class="down">▼</span>
		4:아이템 갯수<span class="up">▲</span><span class="down">▼</span>
		5:박스 또는 개별<span class="up">▲</span><span class="down">▼</span>
		6:가맹에 파는 가격<span class="up">▲</span><span class="down">▼</span>
		7:등록 날짜<span class="up">▲</span><span class="down">▼</span>
		8:등록한 사람<span class="up">▲</span><span class="down">▼</span>
		9:소비자가격<span class="up">▲</span><span class="down">▼</span>
		<input type="checkbox" id="cartDeleteAll" class="cartCodeChk" name="cartDeleteAll" onclick="selectHeadItemAll(this)" value="전체 선택">

	</P>        
	<form id="cartAndOrders" action="/subAddCart" method="POST">
		<c:forEach var="headItemList" items="${headItemList}">	
			<p>
				1:${headItemList.hItemCode}
				2:${headItemList.hItemName}
				3:${headItemList.inteCode}
				4:${headItemList.hItemQuantity}
				5:${headItemList.hItemUnit}6
				6:${headItemList.hItemSellingPrice}
				7:${headItemList.hItemRegitDate}
				8:${headItemList.headStaffId}
				9:${headItemList.hItemRetailPrice}
				<c:if test="${subLogin != null}">
					<input type="hidden" name="subCode" value="${subLogin.subCode}">
					<input type="hidden" name="hItemCode" value="${headItemList.hItemCode}">
					<input type="number" name="cartQuantity" min="1">
					<input type="checkbox" class="headItemCheck" name="headItemCheck" >
				</c:if>
			</p>	
		</c:forEach>
	</form>
	<input type="button" id="cartBtn" value="장바구니담기">
</body>
</html>