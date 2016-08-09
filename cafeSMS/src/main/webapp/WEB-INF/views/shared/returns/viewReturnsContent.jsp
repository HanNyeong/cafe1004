<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-4">
	</div>
		<div class="col-sm-3 addForm">
			<h3>반품 상품 상세보기</h3>
			<div> - 반품 코드 : ${map.returns.returnCode}</div>
			<div> - 반품 내용 : ${map.returns.returnReason}</div>
			<div> - 반품 가격 : ${map.returns.returnPrice}</div>
			<div> - 가맹 보고 날짜 : ${map.returns.returnReportDate}</div>
			<div> - 본사 확인 : ${map.returns.returnHeadCheck}</div>
			<div> - 본사 확인 날짜 : ${map.returns.returnHeadCheckDate}</div>
			<div> - 통합 회계 그룹 코드 : ${map.returns.totalAccountGroup}</div>
			<div> - 재배송 요청 유무 : ${map.returns.returnReDelivery}</div>
			<div> - 반품 취소 여부 : ${map.returns.returnCancel}</div>
			<div> - 주문 코드 : ${map.returns.ordersCode}</div>
			<div> - 개별 상품 코드 : ${map.returns.ordersCode}</div>
			<div> - 본사 확인자 아이디 : ${map.returns.headStaffId}</div>
			<div> - 본사 확인 여부 : ${map.returns.headReturnsConfirm}</div>
			<div> - 가맹대표코드 : ${map.returns.subCode}</div>

			<h3>파일 리스트</h3>
				<c:forEach var="returnsFile" items="${map.returnsFile}">
					<div> 
						<label>File download :</label>
						<a href="${returnsFile.returnFile}" download="${returnsFile.fileName}">${returnsFile.fileName}</a>
					</div>
				</c:forEach>
		</div>
	<div class="col-sm-5">
	</div>
</div>

<jsp:include page="/WEB-INF/module/footer.jsp"/>
</body>
</html>