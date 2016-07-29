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
	<h1>가맹  [${map.contract.contractName}] 계약 상세 내역</h1>
	<div>
		contractCode
		contractName
		contractRegitDate
		contractActualDate
		contractExpiryDate
		contractDeposit
		contractProfitPercent
		contractN
		contractExpireDate
		headStaffId
		subCode
		reContractStatus
		headContractConfirm
	</div>
	<div>
		${map.contract.contractCode}
		${map.contract.contractName}
		${map.contract.contractRegitDate}
		${map.contract.contractActualDate}
		${map.contract.contractExpiryDate}
		${map.contract.contractDeposit}
		${map.contract.contractProfitPercent}
		${map.contract.contractN}
		${map.contract.contractExpireDate}
		${map.contract.headStaffId}
		${map.contract.subCode}
		${map.contract.reContractStatus}
		${map.contract.headContractConfirm}
	</div>	
	<hr/>
	
	<h1>가맹  [${map.contract.contractName}] 계약 파일</h1>
	<div>
		<c:forEach var="contractFile" items="${map.contractFile}">
			<div> 
				<label>contractFile download :</label>
				<a href="${contractFile.contractFile}" download="${contractFile.fileName}">${contractFile.fileName}</a>
			</div>
		</c:forEach>	
	</div>
	
	<hr/>
	<h1>가맹  [${map.contract.contractName}] 계약 파기 사유서 </h1>
	<div>
		<c:forEach var="contractExpireFile" items="${map.contractExpireFile}">
			<div> 
				<label>contractExpireFile download :</label>
				<a href="${contractExpireFile.contractFile}" download="${contractExpireFile.fileName}">${contractExpireFile.fileName}</a>
			</div>
		</c:forEach>	
	</div>
	
</body>
</html>