package com.cafe24.seoje1004.returns.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.returns.model.Returns;
import com.cafe24.seoje1004.returns.model.ReturnsFile;

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

	
}
