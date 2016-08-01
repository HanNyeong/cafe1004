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
	
	<hr/>
	<c:if test="${customerName != null}">	
		<div>
			<!-- 수정후 콘텐츠(가맹이접근한)로 돌아가야하는데 매개변수로 claimCode 필요-->
			<a href="/customerUpdateClaimForm?claimCode=${map.claimContent.claimCode}">[수정]</a>
			<!-- 삭제후 리스트로 이동해야는데 매개변수 customerName과 customerPhone이 필요 -->
			<a href="/customerDeleteClaim?claimCode=${map.claimContent.claimCode}&customerName=${map.claimContent.customerName}&customerPhone=${map.claimContent.customerPhone}">[삭제]</a>
		</div>
	</c:if>
		
	
</body>
</html>