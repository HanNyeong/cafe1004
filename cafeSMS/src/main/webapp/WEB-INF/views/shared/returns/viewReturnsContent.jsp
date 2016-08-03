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
	<h1>상세보기입니다요 ㅎ</h1>
	<div>
			returnCode
			returnReason
			returnPrice
			returnReportDate
			returnHeadCheck
			returnHeadCheckDate
			totalAccountGroup
			returnReDelivery
			returnCancel
			ordersCode
			specificItemCode
			headStaffId
			headReturnsConfirm
			subCode
	</div>
	<div>
			${map.returns.returnCode}
			${map.returns.returnReason}
			${map.returns.returnPrice}
			${map.returns.returnReportDate}
			${map.returns.returnHeadCheck}
			${map.returns.returnHeadCheckDate}
			${map.returns.totalAccountGroup}
			${map.returns.returnReDelivery}
			${map.returns.returnCancel}
			${map.returns.ordersCode}
			${map.returns.specificItemCode}
			${map.returns.headStaffId}
			${map.returns.headReturnsConfirm}
			${map.returns.subCode}
	</div>
	
	<h1>파일 리스트</h1><hr/>
	<div>
		<c:forEach var="returnsFile" items="${map.returnsFile}">
			<div> 
				<label>File download :</label>
				<a href="${returnsFile.returnFile}" download="${returnsFile.fileName}">${returnsFile.fileName}</a>
			</div>
		</c:forEach>
	</div>
</body>
</html>