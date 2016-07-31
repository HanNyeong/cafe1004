<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>클래임 상세내역</h1>
	
	
	<div>
			claimCode
			claimType
			claimAskDate
			claimContent
			subCode
			customerName
			customerPhone
			claimStatus
	</div>
	<div>
			${map.claimContent.claimCode}
			${map.claimContent.claimType}
			${map.claimContent.claimAskDate}
			${map.claimContent.claimContent}
			${map.claimContent.subCode}
			${map.claimContent.customerName}
			${map.claimContent.customerPhone}
			${map.claimContent.claimStatus}
			
	</div>
	<hr/>
	
	<h1>첨부파일내역</h1>
	<div>
		<c:forEach var="claimFile" items="${map.claimFile}">
			<div> 
				<label>File download :</label>
				<a href="${claimFile.claimFile}" download="${claimFile.fileName}">${claimFile.fileName}</a>
			</div>
		</c:forEach>	
	</div>
	
	<hr/>
	<h1>답변내역</h1>
	<div>
		claimAnswerDate
		claimAnswerContent
	</div>
	<div>
		${map.claimContent.claimAnswerDate}
		${map.claimContent.claimAnswerContent}
	</div>
</body>
</html>