<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-8">
		<div id="mainpng">
			<a href=""><img src="/resources/img/main.png" ></a>
		</div>
		<div style="text-align: center">
			<h3 style="margin-top: 5px; margin-bottom: 5px;" >
			<img src="/resources/img/Chrome.png" width="5%">크롬 사용을 부탁드립니다<img src="/resources/img/Chrome.png" width="5%"></h3>
		</div>
	</div>
	<div class="col-sm-2">
	</div>
</div>	
	<jsp:include page="/WEB-INF/module/footer.jsp"/>
	<div class="row" >
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8">
			<h3> = 본사-가맹 시스템 구조도 <small>이미지를<span style="color: red; font-size:x-large;">클릭</span>하시면 해당 기능 페이지로 이동이 가능합니다.</small> =</h3>
			
			<a href="/logout"><img src="resources/img/bon.png" width="45%" ></a>
			<a href="/subLogin?subCode=sub_code1&subPassword=1234"><img src="resources/img/rkaod.png" width="45%"></a>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
<div class="row">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-8">
		<h3> = ERD 논리구조 = </h3>
		<img alt="" src="resources/img/non.PNG" width="100%">
	</div>
	<div class="col-sm-2">
	</div>
</div>
<div class="row">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-8">
		<h3> = ERD 물리구조 = </h3>
		<img alt="" src="resources/img/phy.PNG" width="100%">
	</div>
	<div class="col-sm-2">
	</div>
</div>
		
</body>
</html>