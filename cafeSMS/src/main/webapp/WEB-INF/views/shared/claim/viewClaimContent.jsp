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
<jsp:include page="/WEB-INF/module/nav.jsp"/>
<div class="row">
	<div class="col-sm-2">
	</div>	
		<div class="col-sm-2">  
			<h3>= 클래임 상세내역 =</h3>
		</div>
		<div class="col-sm-6 clickBtn">
			<c:if test="${customerName != null}">	
				<div>
					<!-- 수정후 콘텐츠(가맹이접근한)로 돌아가야하는데 매개변수로 claimCode 필요-->
					<a href="/customerUpdateClaimForm?claimCode=${map.claimContent.claimCode}">
					<button class="btn btn-default">수정</button></a>
					<!-- 삭제후 리스트로 이동해야는데 매개변수 customerName과 customerPhone이 필요 -->
					<a href="/customerDeleteClaim?claimCode=${map.claimContent.claimCode}&customerName=${map.claimContent.customerName}&customerPhone=${map.claimContent.customerPhone}">
					<button class="btn btn-default">삭제</button></a>
				</div>
			</c:if>
		</div>
	<div class="col-sm-2">
	</div>
</div>
<div class="row tablediv">
	<div class="col-sm-2">
	</div>	
	<div class="col-sm-1 th">claimCode</div>	
	<div class="col-sm-1 th">claimType</div>	
	<div class="col-sm-1 th">claimAskDate</div>	
	<div class="col-sm-1 th">claimContent</div>	
	<div class="col-sm-1 th">subCode</div>	
	<div class="col-sm-1 th">customerName</div>	
	<div class="col-sm-1 th">customerPhone</div>	
	<div class="col-sm-1 th">claimStatus</div>	
	<div class="col-sm-2">
	</div>
</div>	
<div class="row tablediv">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-1">${map.claimContent.claimCode}</div>
	<div class="col-sm-1">${map.claimContent.claimType}</div>
	<div class="col-sm-1">${map.claimContent.claimAskDate}</div>
	<div class="col-sm-1">${map.claimContent.claimContent}</div>
	<div class="col-sm-1">${map.claimContent.subCode}</div>
	<div class="col-sm-1">${map.claimContent.customerName}</div>
	<div class="col-sm-1">${map.claimContent.customerPhone}</div>
	<div class="col-sm-1">${map.claimContent.claimStatus}</div>
	<div class="col-sm-2">
	</div>
</div>		
<div class="row">
	<div class="col-sm-2">
	</div>	
		<div class="col-sm-8">  
			<h3>= 첨부파일내역 =</h3>
			<c:forEach var="claimFile" items="${map.claimFile}">
				<div> 
					<label>File download :</label>
					<a href="${claimFile.claimFile}" download="${claimFile.fileName}">${claimFile.fileName}</a>
				</div>
			</c:forEach>	
		</div>
	<div class="col-sm-2">
	</div>
</div>	
<div class="row">
	<div class="col-sm-2">
	</div>	
		<div class="col-sm-8">  
			<h3>= 답변내역 =</h3>
			답변 일자 : ${map.claimContent.claimAnswerDate}<br/>
			답변 내용 : ${map.claimContent.claimAnswerContent}		
		</div>
	<div class="col-sm-2">
	</div>
</div>	
<jsp:include page="/WEB-INF/module/footer.jsp"/>				
</body>
</html>