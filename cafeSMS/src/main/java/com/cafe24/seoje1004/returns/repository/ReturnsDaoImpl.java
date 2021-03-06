package com.cafe24.seoje1004.returns.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.returns.model.AddReturns;
import com.cafe24.seoje1004.returns.model.Returns;
import com.cafe24.seoje1004.returns.model.ReturnsFile;
import com.cafe24.seoje1004.returns.model.SubOrders;
import com.cafe24.seoje1004.returns.model.SubStock;

@Repository
public class ReturnsDaoImpl implements ReturnsDao {
	/**
	 * 2016-08-02 오성현
	 * ReturnsDao 
	 */
	private final String NS ="com.cafe24.seoje1004.returns.repository.ReturnsMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionReturns;
	
	
	
	//가맹측 반품상품관리 조회
	@Override
	public List<Returns> subViewReturnsList(Map<String, Object> map) {
		System.out.println("ReturnsDaoImpl subViewReturnsList 실행");
		return sqlSessionReturns.selectList(NS+".subViewReturnsList", map);
	}
	
	//출고상태가 N, 가맹이확인하고 입고한날짜 not null
	@Override
	public List<SubStock> subAddReturnsForm(Map<String, Object> map) {
		System.out.println("ReturnsDaoImpl subAddReturnsForm 실행");
		return sqlSessionReturns.selectList(NS+".subAddReturnsForm", map);
	}


	//해당재고를 기준으로 반품등록에 필요한 정보를 가져오자
	@Override
	public AddReturns subAddReturnsForm2(String subStockCode) {
		System.out.println("ReturnsDaoImpl subAddReturnsForm2 실행");
		return sqlSessionReturns.selectOne(NS+".subAddReturnsForm2", subStockCode);
	}

	//환불 신청시 해당 재고상품의 출고여부(판매여부)를 N->Y로 변경
	@Override
	public void updateSubStockOut(String subStockCode) {
		System.out.println("ReturnsDaoImpl updateSubStockOut 실행");
		sqlSessionReturns.update(NS+".updateSubStockOut", subStockCode);
	}
	

	//랜덤네임이 중복되는 이름이 있으면 다시 새로운 랜덤네임으로 저장
	@Override
	public ReturnsFile selectReturnFileByRandomName(String randomName) {
		System.out.println("ReturnsDaoImpl selectReturnFileByRandomName 실행");
		return sqlSessionReturns.selectOne(NS+".selectReturnFileByRandomName", randomName);
	}
	
	//반품첨부파일 정보 등록
	@Override
	public void subAddReturnsFile(ReturnsFile returnsFile) {
		System.out.println("ReturnsDaoImpl subAddReturnsFile 실행");
		sqlSessionReturns.insert(NS+".subAddReturnsFile", returnsFile);
		
	}
	
	//해당 returnCode에 해당하는 행 삭제
	@Override
	public void subCancelReturns(String returnCode) {
		System.out.println("ReturnsDaoImpl subCancelReturns 실행");
		sqlSessionReturns.delete(NS+".subCancelReturns", returnCode);
	}

	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	
	//본사측 반품상품관리 조회
	@Override
	public List<Returns> headViewReturnsList(Map<String, Object> map) {
		System.out.println("ReturnsDaoImpl headViewReturnsList 실행");
		return sqlSessionReturns.selectList(NS+".headViewReturnsList", map);
	}

	//해당 반품상품의 상세정보
	@Override
	public Returns viewReturnsContent(String returnCode) {
		System.out.println("ReturnsDaoImpl viewReturnsContent 실행");
		return sqlSessionReturns.selectOne(NS+".viewReturnsContent", returnCode);
	}

	//해당반품상품의 파일 리스트
	@Override
	public List<ReturnsFile> viewReturnsFile(String returnCode) {
		System.out.println("ReturnsDaoImpl viewReturnsFile 실행");
		return sqlSessionReturns.selectList(NS+".viewReturnsFile", returnCode);
	}

	//returns테이블에 새로운 환불 등록
	@Override
	public void subAddReturns(Returns returns) {
		System.out.println("ReturnsDaoImpl subAddReturns 실행");
		sqlSessionReturns.insert(NS+".subAddReturns", returns);
		
	}

	//본사에서 환불 승인
	@Override
	public void approvalReturns(String returnCode) {
		System.out.println("ReturnsDaoImpl approvalReturns 실행");
		sqlSessionReturns.update(NS+".approvalReturns", returnCode);
	}

	//orders_code에 해당하는 subStock가맹재고의 subStockOut출고여부를 Y->N으로 수정
	@Override
	public void updateSubStockOutN(String ordersCode) {
		System.out.println("ReturnsDaoImpl updateSubStockOutN 실행");
		sqlSessionReturns.update(NS+".updateSubStockOutN", ordersCode);
		
	}
	
	//본사에서 환불 처리 (돈으로 지급)
		@Override
		public void headReturns(Map<String,Object> map) {
			System.out.println("ReturnsDaoImpl headReturns 실행");
			sqlSessionReturns.insert(NS+".headReturns", map);
	}
	
	//환불테이블의 headReturnsConfirm을 Y로 변경 update
	@Override
	public void updateHeadReturnsConfirmY(String returnCode) {
		System.out.println("ReturnsDaoImpl updateHeadReturnsConfirmY 실행");
		sqlSessionReturns.update(NS+".updateHeadReturnsConfirmY", returnCode);
	}	
	
	/*---------재배송---------------*/
	


	
	//sub_orders의 기존행의 정보를 가져옴
	@Override
	public SubOrders selectSubOrdersByOrdersCode(String ordersCode) {
		System.out.println("ReturnsDaoImpl selectSubOrdersByOrdersCode 실행");
		return sqlSessionReturns.selectOne(NS+".selectSubOrdersByOrdersCode", ordersCode);
	}

	//sub_orders새로운 행에 insert
	@Override
	public void addSubOrders(SubOrders subOrders) {
		System.out.println("ReturnsDaoImpl addSubOrders 실행");
		sqlSessionReturns.insert(NS+".addSubOrders", subOrders);
		
	}
	
	//sub_orders 재뱅송 재품 삭제하는 업데이트
	@Override
	public void updateOrdersReturns(SubOrders subOrders){
		System.out.println("ReturnsDaoImpl updateOrdersReturns 실행");
		sqlSessionReturns.update(NS+".updateOrdersReturns", subOrders);
	}

	
	//기존의 sub_orders를 수정
	@Override
	public void updateSubOrders(Map<String, Object> map) {
		System.out.println("ReturnsDaoImpl updateSubOrders");
		sqlSessionReturns.update(NS+".updateSubOrders", map);
		
	}

	
	
	

}
