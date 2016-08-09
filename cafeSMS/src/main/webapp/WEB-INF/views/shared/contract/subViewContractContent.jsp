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
	<div class="col-sm-4">
	</div>
		<div class="col-sm-3 addForm">
			<h3>가맹  [${map.contract.contractName}] 계약 상세 내역</h3>
			<div> - 계약 코드 : ${map.contract.contractCode}</div>
			<div> - 계약자 이름 : ${map.contract.contractName}</div>
			<div> - 데이터 등록 날짜 : ${map.contract.contractRegitDate}</div>
			<div> - 실 계약 날짜 : ${map.contract.contractActualDate}</div>
			<div> - 계약 만료일 : ${map.contract.contractExpiryDate}</div> 
			<div> - 가맹 금액 : ${map.contract.contractDeposit}</div>
			<div> - 이익 배분율 : ${map.contract.contractProfitPercent}</div>
			<div> - 계약 차수 : ${map.contract.contractN}</div>
			<div> - 계약파기일 : ${map.contract.contractExpireDate}</div>
			<div> - 본사 계약 담당 직원 : ${map.contract.headStaffId}</div>
			<div> - 가맹 대표 코드 : ${map.contract.subCode}</div>
			<div> - 재계약상태 : ${map.contract.reContractStatus}</div>
			<div> - 본사 확인 여부 : ${map.contract.headContractConfirm}</div>
			<hr/>
			<h3>가맹  [${map.contract.contractName}] 계약 파일</h3>
			<div>
				<c:forEach var="contractFile" items="${map.contractFile}">
					<div> 
						<label>contractFile download :</label>
						<a href="${contractFile.contractFile}" download="${contractFile.fileName}">${contractFile.fileName}</a>
					</div>
				</c:forEach>	
			</div>	
			<hr/>
			<h3>가맹  [${map.contract.contractName}] 계약 파기 사유서 </h3>
			<div>
				<c:forEach var="contractExpireFile" items="${map.contractExpireFile}">
					<div> 
						<label>contractExpireFile download :</label>
						<a href="${contractExpireFile.contractFile}" download="${contractExpireFile.fileName}">${contractExpireFile.fileName}</a>
					</div>
				</c:forEach>	
			</div>
		<div class="col-sm-5">
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/module/footer.jsp"/>
	
</body>
</html>